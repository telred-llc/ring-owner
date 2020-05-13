//
//  MasterViewController.swift
//  AWS-Ring
//
//  Created by Pham Hoa on 2/13/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit
import UserNotifications
import AVKit
import AWSKinesis
import AWSKinesisVideoArchivedMedia
import AWSKinesisVideo
import AWSMobileClient
import QRCodeReader
import AWSAppSync
import AWSRekognition

class MasterViewController: BaseViewController, AVPlayerViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!

    typealias UserCamera = ListCamerasQuery.Data.ListCamera
    typealias CollectionItem = ListGuestCollectionsQuery.Data.ListGuestCollection.Item

    var detailViewController: DetailViewController? = nil
    var userCamera: UserCamera?
    var guestCollections: [String] = []

    //Set a variable to discard at the class level
    var discardSubscription: Cancellable?

    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)

            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = true
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.3, width: 0.6, height: 0.4)
        }

        return QRCodeReaderViewController(builder: builder)
    }()

    // Device
    var selectedDeviceId: String? {
        didSet {
            detailViewController?.title = self.selectedDeviceId
        }
    }

    // MARK: Private Properties

    private let participantsUpdateQueue = DispatchQueue(label: "participantsUpdateQueue")
    private let participantsDataQueue = DispatchQueue(label: "participantsDataQueue")

    private var roomService: RoomService?

    private let userIdentifier = UUID().uuidString.replacingOccurrences(of: "-", with: "")
    private var participants: [ParticipantModel] = []

    private var isDisplayingDetailVC: Bool {
        get {
            if let detailViewController = detailViewController {
                return self.navigationController?.viewControllers.contains(detailViewController) ?? false
            }

            return false
        }
    }

    // MARK: Init methods

    override func viewDidLoad() {
        super.viewDidLoad()
        let addCameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(insertNewCamera(_:)))
        let guestsListButton = UIBarButtonItem.init(image: UIImage.init(named: "ic_people_group"), style: .plain, target: self, action: #selector(showGuestsList(_:)))
        navigationItem.rightBarButtonItems = [addCameraButton, guestsListButton]

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            detailViewController?.delegate = self
        }

        if Session.shared.meData == nil {
            self.getMeData()
        } else {
            self.getDevicesList()
            self.getCollections()
        }

        self.handlePushNotificaionIfNeeded(byTapping: false)

        if let selectedDeviceId = selectedDeviceId {
            self.joinRoom(roomId: selectedDeviceId)
        }
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Cameras"
        self.tableView.reloadData()
    }

    @objc
    func insertNewCamera(_ sender: Any) {
        self.showQRCodeReader()
    }

    @objc
    func showGuestsList(_ sender: Any) {
        let guestCollectionId = self.guestCollections.first
        // Perform segue
        self.performSegue(withIdentifier: "showGuests", sender: guestCollectionId)
    }

    // Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGuests" {
            if let guestsListVC = segue.destination as? GuestsListViewController {
                guestsListVC.collectionId = sender as? String
                guestsListVC.createCollectionHandler = { [weak self] in
                    self?.getCollections()
                }
            }
        }
    }

    // MARK: Methods

    func getMeData() {
        self.showProgressHub()
        AWSMobileClient.sharedInstance().getUserAttributes(completionHandler: { [weak self] (attrs, error) in
            // Get cognitoId
            self?.hideProgressHub()
            if let attrs = attrs, let cognitoId = attrs["sub"] {
                self?.appSyncClient?.fetch(query: GetUserQuery.init(id: cognitoId), cachePolicy: CachePolicy.fetchIgnoringCacheData, resultHandler: { (result, error) in
                    if let error = error {
                        self?.showErrorMessage(error: error)
                    } else if let getUser = result?.data?.getUser {
                        Session.shared.meData = getUser
                        self?.getDevicesList()
                        self?.getCollections()
                    } else {
                        self?.showAlert(title: "Error", msg: "Please try again!", buttons: ["Ok"], { (_) in
                            self?.getMeData()
                        })
                    }
                })
            } else {
                self?.showAlert(title: "ERROR", msg: "Something went wrong!")
            }
        })
    }

    func joinRoom(roomId: String) {
        if self.roomService == nil || self.roomService?.getRoomIdentifier() != roomId {
            selectedDeviceId = roomId
            self.roomService = RoomService(withRoomIdentifier: roomId, userIdentifier: self.userIdentifier, delegate: self)
        }

        if !isDisplayingDetailVC, detailViewController != nil {
            self.navigationController?.pushViewController(detailViewController!, animated: false)
        }

        let now = Date.init()
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let dateString = dateFormatter.string(from: now)

        let requestStreamingInput = CreateRequestStreamingInput.init(id: UUID().uuidString, cameraId: roomId, userId: Session.shared.meData?.id, time: dateString)
        appSyncClient?.perform(mutation: CreateRequestStreamingMutation.init(input: requestStreamingInput), resultHandler: { (result, error) in
            //
        })
    }

    // TODO: Support loadmore
    func getDevicesList() {
        self.showProgressHub()
        appSyncClient?.fetch(query: ListCamerasQuery.init(filter: nil, limit: 30, nextToken: nil), cachePolicy: .fetchIgnoringCacheData, queue: DispatchQueue.main, resultHandler: { [weak self] (result, error) in
            self?.hideProgressHub()
            if let error = error {
                self?.showErrorMessage(error: error)
            } else if let userCamera = result?.data?.listCameras {
                self?.userCamera = userCamera
                self?.userCamera?.items?.removeAll(where: {
                    Session.shared.meData?.cameras?.contains( $0?.id ?? "" ) != true
                })
                self?.tableView.reloadData()

                if self?.userCamera?.items?.count == 1 {
                    if let cameraId = self?.userCamera?.items?.first??.id {
                        self?.joinRoom(roomId: cameraId)
                    }
                }
            }
        })
    }

    func getCollections() {
        self.showProgressHub()
        let rekognition = AWSRekognition.default()
        rekognition.listCollections(AWSRekognitionListCollectionsRequest.init()).continueOnSuccessWith { [weak self] (response) in
            self?.hideProgressHub()
            if let error = response.error {
                self?.showErrorMessage(error: error)
            } else if let collections = response.result?.collectionIds {
                self?.guestCollections = collections
            } else {
                self?.guestCollections = []
            }
            return nil
        }.waitUntilFinished()
    }

    // MARK: - IBActions
    
    @IBAction func clickedOnSignOutButton(_ sender: Any) {
        self.view.isUserInteractionEnabled = false
        Session.shared.signOut()
    }
    
    func showDetailVC(indexPath: IndexPath) {
        if let detailViewController = detailViewController {
            self.showDetailViewController(detailViewController, sender: nil)
            
            let camera = self.userCamera?.items?[indexPath.row]
            
            detailViewController.navigationItem.title = camera?.name
        }
    }

    func showQRCodeReader() {
        readerVC.delegate = self

        // Or by using the closure pattern
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            if let deviceId = result?.value {
                print("qr code value: \(deviceId)")
                self.addDevice(id: deviceId)
            } else {
                self.showAlert(title: "Error", msg: "Can not read QR code")
            }
        }

        // Presents the readerVC as modal form sheet
        readerVC.modalPresentationStyle = .formSheet

        present(readerVC, animated: true, completion: nil)
    }

    func addDevice(id: String) {
        self.showProgressHub()
        var currentCameras = Session.shared.meData?.cameras ?? []
        if !currentCameras.contains(id) {
            currentCameras.append(id)
        }

        Session.shared.update(cameras: currentCameras) { [weak self] (error) in
            self?.hideProgressHub()
            if let error = error {
                self?.showErrorMessage(error: error)
            } else {
                self?.getDevicesList() // refresh
            }
        }
    }

    func trackCamera(id: String) {
        discardSubscription?.cancel()

        do {
            discardSubscription = try appSyncClient?.subscribe(subscription: OnCreateDetectMotionSubscription.init(), queue: DispatchQueue.main, resultHandler: { (result, _, error) in
                let detection = result?.data?.onCreateDetectMotion
                if detection?.cameraId == id {
                    print("Motion dectected from deviceId: \(id)")
                }
            })
        } catch {
            print("Cannot subscription")
        }
    }

    func handlePushNotificaionIfNeeded(byTapping: Bool) {
        if let deviceId = PushHandler.shared.processQueue.last {
            if byTapping {
                self.selectedDeviceId = deviceId
                self.joinRoom(roomId: deviceId)
                PushHandler.shared.processQueue.removeAll()
            } else {
                if !isDisplayingDetailVC {
                    self.selectedDeviceId = deviceId
                    self.joinRoom(roomId: deviceId)
                    PushHandler.shared.processQueue.removeAll()
                }
            }
        }
    }

    func existRoom() {
        self.selectedDeviceId = nil
        self.roomService = nil

        if isDisplayingDetailVC {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - UITableViewDataSource

extension MasterViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCamera?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let camera = userCamera?.items?[indexPath.row]
        cell.textLabel!.text = camera?.name
        cell.backgroundColor = camera?.id == selectedDeviceId ? UIColor.gray : UIColor.white
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MasterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let camera = userCamera?.items?[indexPath.row] {
            self.joinRoom(roomId: camera.id)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

// MARK: - QRCodeReaderViewController Delegate Methods

extension MasterViewController: QRCodeReaderViewControllerDelegate {
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()

        dismiss(animated: true, completion: nil)
    }

    //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
    //By pressing on the switch camera button
    func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
        let cameraName = newCaptureDevice.device.localizedName
        print("Switching capture to: \(cameraName)")
    }

    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()

        dismiss(animated: true, completion: nil)
    }
}

// MARK: Start Configurations

private extension MasterViewController {
    func configureInterface() {
        self.checkRoomState(animated: false)
    }
}

// MARK: User List Methods

private extension MasterViewController {
    func applyParticipants(_ participants: [ParticipantModel]) {
    }
}

// MARK: Show/Hide View Controllers

private extension MasterViewController {
    func showAlert(withMessage message: String?) {
        let close = UIAlertAction(title: AppMessage.ButtonTitles.confirm.rawValue, style: .cancel) { [weak self] (action) in
            self?.navigationController?.popViewController(animated: true)
        }

        let alert = UIAlertController(title: AppMessage.ErrorTitles.commonError.rawValue, message: message, preferredStyle: .alert)
        alert.addAction(close)

        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: Support Methods

private extension MasterViewController {
    func checkRoomState(animated: Bool) {
        guard let state = self.roomService?.roomState() else {
            return
        }

        switch state {
        case .connecting:
            let participants: [ParticipantModel] = []
            self.applyParticipants(participants)
        default:
            break
        }
    }
}

// MARK: RoomServiceDelegate

extension MasterViewController: RoomServiceDelegate {
    func room(_ room: RoomService?, didChangeState state: RoomService.RoomState) {
        print("room didChangeState: \(state)")
        self.checkRoomState(animated: true)
        switch state {
        case .unknown:
            break
        case .connecting, .disconnected:
            break
        case .connected:
            break
        case .failed(let error):
            self.showAlert(withMessage: error)
        }
    }

    func room(_ room: RoomService?, didChangeParticipantsList list: [ParticipantModel]) {
        print("room didChangeParticipantsList: \(list.count)")
        self.applyParticipants(list)

        // Stop roomService
        if list.count == 0, let roomState = self.roomService?.roomState() {
            switch roomState {
            case .connected:
                self.existRoom()
                self.showToast(message: "Streaming finished")
            default:
                break
            }
        }
    }

    func room(_ room: RoomService?, didChangeVideoView videoView: UIView?, forUserIdentifier userIdentifier: String) {
        if  self.selectedDeviceId == userIdentifier, let videoView = videoView {
            detailViewController?.configureVideoView(videoView)
        }
    }
}

extension MasterViewController: DetailViewControllerDelegate {
    func detailVCWillBePopped() {
        //
    }

    func detailVCWillAppear() {
        if let selectedDeviceId = self.selectedDeviceId {
            if let videoView = self.roomService?.videoView(forUserIdentifier: selectedDeviceId) {
                detailViewController?.configureVideoView(videoView)
            }
        }
        
        detailViewController?.title = selectedDeviceId
    }

    func detailVCStopWatching() {
        self.existRoom()
    }
}
