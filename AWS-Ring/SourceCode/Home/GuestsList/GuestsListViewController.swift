//
//  GuestsListViewController.swift
//  AWS-Ring
//
//  Created by Pham Hoa on 8/14/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit
import SDWebImage
import AWSRekognition
import PromiseKit
import RxSwift
import RxCocoa
import Fusuma
import SwiftEntryKit
import Kingfisher

class GuestsListViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    typealias Guest = GetGuestCollectionQuery.Data.GetGuestCollection.Guest.Item
    var guestList: [Guest] = []
    var disposeBag = DisposeBag()

    // Now the app support only a collection
    var collectionId: String?

    // Create new collection callback
    var createCollectionHandler: (() -> Void)?

    // Current adding guest dialog
    var addGuestDialog: AddGuestDialog?

    // Images downloading
    var imagesDownloading: [String] = []

    // current FusumaViewController
    var fusuma: FusumaViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitinization()
    }

    // MARK: Initinization

    func setupInitinization() {
        setupTableView()

        // Setup Navigation Bar
        self.title = "Guests"
        let addGuestButton = UIBarButtonItem.init(image: UIImage.init(named: "ic_add_guest"), style: .plain, target: self, action: #selector(addNewGuest(_:)))
        navigationItem.rightBarButtonItem = addGuestButton

        // Prepare Data Source
        if let collectionId = collectionId {
            self.getGuestList(collectionId: collectionId)
        } else {
            self.showProgressHub()
            firstly {
                return self.createGuestCollection(collectionId: UUID().uuidString)
            }.done { (collectionId) in
                self.collectionId = collectionId
                self.getGuestList(collectionId: collectionId)
                self.createCollectionHandler?()
            }.ensure {
                self.hideProgressHub()
            }.catch { (error) in
                self.showErrorMessage(error: error, {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        }
    }

    func setupTableView() {
        tableView.rowHeight = 90
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: Methods

    // TODO: Support loadmore function
    func getGuestList(collectionId: String) {
        appSyncClient?.fetch(query: GetGuestCollectionQuery.init(id: collectionId), cachePolicy: .fetchIgnoringCacheData, queue: DispatchQueue.main, resultHandler: { [weak self] (result, error) in
            if let error = error {
                self?.showErrorMessage(error: error)
            } else if let guestCollection = result?.data?.getGuestCollection {
                self?.guestList = guestCollection.guests?.items?.compactMap{ $0 } ?? []
            } else {
                self?.guestList = []
            }

            self?.tableView.reloadData()
        })
    }

    @objc func addNewGuest(_ sender: Any) {
        if let addGuestDialog = Bundle.main.loadNibNamed("AddGuestDialog", owner: nil, options: nil)?.first as? AddGuestDialog {
            self.showAddGuestDialog(addGuestDialog)
        }
    }
}

private extension GuestsListViewController {
    func indexFace(s3ObjectName: String) -> PromiseKit.Promise<String> {
        return PromiseKit.Promise<String> { (resolver) in
            guard let collectionId = collectionId else {
                print("collectionId is nil")
                resolver.reject(ARLError.unknownError)
                return
            }

            let rekognition = AWSRekognition.default()

            let faceRequest = AWSRekognitionIndexFacesRequest()
            let image = AWSRekognitionImage()

            let s3Object = AWSRekognitionS3Object()
            s3Object?.bucket = Constant.ASWConfiguration.S3.facesBucketName
            s3Object?.name = s3ObjectName
            image?.s3Object = s3Object

            faceRequest!.image = image
            faceRequest!.collectionId = collectionId

            rekognition.indexFaces(faceRequest!).continueWith { (response) -> Any? in
                if let error = response.error {
                    print("Index face faile: \(error)")
                    resolver.reject(error)
                    //handle error
                }
                else {
                    //app logic here
                    let firstFace = response.result?.faceRecords?.first?.face
                    resolver.fulfill(firstFace?.faceId ?? "")
                }
                return nil
            }
        }
    }

    func uploadFaceImageToS3(image: UIImage, imageName: String) -> PromiseKit.Promise<Bool> {
        return PromiseKit.Promise<Bool> { (resolver) in
            AWSS3Manager.shared.uploadS3(image: image, name: imageName, parameters: [:], progressHandler: { (_) in
                //
            }) { (error) in
                if let error = error {
                    resolver.reject(error)
                } else {
                    resolver.fulfill(true)
                }
            }
        }
    }

    func createRekognitionCollection(collectionId: String) -> Promise<String> {
        return Promise<String> { (resolver) in
            DispatchQueue.global(qos: .default).async {
                let rekognition = AWSRekognition.default()
                let collectionRequest = AWSRekognitionCreateCollectionRequest.init()

                collectionRequest?.collectionId = collectionId
                rekognition.createCollection(collectionRequest!).continueWith { (response) -> Any? in
                    if let error = response.error as NSError? {
                        resolver.reject(error)
                    } else if let _ = response.result {
                        resolver.fulfill(collectionId)
                    } else {
                        resolver.reject(ARLError.unknownError)
                    }
                    return nil
                    }.waitUntilFinished()
            }
        }
    }

    func createGuestCollection(collectionId: String) -> Promise<String> {
        return Promise<String> { (resolver) in
            let createGuestCollectionInput = CreateGuestCollectionInput.init(id: collectionId, name: "My famaly")
            appSyncClient?.perform(mutation: CreateGuestCollectionMutation.init(input: createGuestCollectionInput), queue: DispatchQueue.main, resultHandler: { (result, error) in
                if let error = error {
                    resolver.reject(error)
                } else if let _ = result?.data?.createGuestCollection {
                    resolver.fulfill(collectionId)
                } else {
                    resolver.reject(ARLError.unknownError)
                }
            })
        }
    }

    func addGuest(name: String, collectionId: String, recognitionId: String, faces: [String]) -> PromiseKit.Promise<Guest> {
        return Promise<Guest> { (resolver) in
            let createGuestInput = CreateGuestInput.init(id: UUID().uuidString, name: name, recognitionId: recognitionId, facePhotos: faces, guestCollectionGuestsId: collectionId)
            appSyncClient?.perform(mutation: CreateGuestMutation.init(input: createGuestInput), queue: DispatchQueue.main, resultHandler: { (result, error) in
                if let error = error {
                    resolver.reject(error)
                } else if let snapshot = result?.data?.createGuest?.snapshot {
                    resolver.fulfill(Guest.init(snapshot: snapshot))
                } else {
                    resolver.reject(ARLError.unknownError)
                }
            })
        }
    }

    func showAddGuestDialog(_ dialog: AddGuestDialog) {
        disposeBag = DisposeBag()

        self.addGuestDialog = dialog
        dialog.selectFaceButton.rx.tap.subscribe(onNext: { [weak self] () in

            Presenter.shared.dismiss {

            }
            self?.fusuma = FusumaViewController()
            if let fusuma = self?.fusuma {
                fusuma.delegate = self
                fusuma.availableModes = [FusumaMode.library, FusumaMode.camera] // Add .video capturing mode to the default .library and .camera modes
                fusuma.autoSelectFirstImage = true
                fusuma.allowMultipleSelection = false // You can select multiple photos from the camera roll. The default value is false.

                DispatchQueue.main.async {
                    self?.present(fusuma, animated: true, completion: {
                        fusuma.albumShouldEnableDoneButton(isEnabled: true)
                    })
                }
            }
        }).disposed(by: disposeBag)

        dialog.submitButton.rx.tap.subscribe(onNext: { () in
            guard let fullName = self.addGuestDialog?.fullNameTextField.text else {
                self.showToast(message: "Full name cannot be blank")
                return
            }

            guard let faceImage = self.addGuestDialog?.faceImageView.image else {
                self.showToast(message: "Please select face image")
                return
            }

            Presenter.shared.dismiss {
                var fileName = fullName.split(separator: " ").filter({ !$0.isEmpty }).joined(separator: "_").lowercased()
                fileName += "_\(Date().timeIntervalSince1970)"
                self.showProgressHub()
                firstly {
                    return self.uploadFaceImageToS3(image: faceImage, imageName: fileName)
                    }.then({ (_) in
                        return self.indexFace(s3ObjectName: fileName)
                    }).then({ (faceId) in
                        return self.addGuest(name: fullName, collectionId: self.collectionId!, recognitionId: faceId, faces: [fileName])
                    }).done({ (guest) in
                        self.guestList.append(guest)
                        self.tableView.reloadData()
                    }).ensure {
                        self.hideProgressHub()
                    }.catch({ (error) in
                        self.showErrorMessage(error: error)
                    })
            }
        }).disposed(by: disposeBag)

        Presenter.shared.present(view: dialog) {
            //
        }
    }
}

extension GuestsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guestList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GuestItemTableViewCell") as? GuestItemTableViewCell {
            let guest = guestList[indexPath.row]

            // default
            cell.activityView.stopAnimating()
            cell.activityView.isHidden = true

            cell.personNameLabel.text = guest.name
            if let firstFace = guest.facePhotos?.first {
                let cache = ImageCache.default
                let cached = cache.isCached(forKey: firstFace)

                if cached {
                    cache.retrieveImage(forKey: firstFace) { (result) in
                        switch result {
                        case .success(let value):
                            DispatchQueue.main.async {
                                cell.faceImage.image = value.image
                            }
                        case .failure:
                            DispatchQueue.main.async {
                                cell.faceImage.image = nil
                            }
                        }
                    }
                } else {
                    cell.activityView.isHidden = false
                    cell.activityView.startAnimating()

                    if imagesDownloading.contains(firstFace) {
                        cell.faceImage.image = nil
                    } else {
                        imagesDownloading.append(firstFace)

                        AWSS3Manager.shared.downloadImage(bucketName: Constant.ASWConfiguration.S3.facesBucketName, fileName: firstFace) { [weak self] (image, error) in
                            self?.imagesDownloading.removeAll(where: { $0 == firstFace })
                            DispatchQueue.main.async {
                                cell.activityView.stopAnimating()
                                cell.activityView.isHidden = true
                                if let image = image {
                                    cache.store(image, forKey: firstFace)
                                    cell.faceImage.image = image
                                } else {
                                    cache.removeImage(forKey: firstFace)
                                    cell.faceImage.image = nil
                                }
                            }
                        }
                    }
                }
            } else {
                cell.faceImage.image = nil
            }

            cell.selectionStyle = .none
            cell.accessoryType = .none
            return cell
        }

        return UITableViewCell()
    }
}

extension GuestsListViewController: UITableViewDelegate {

}

extension GuestsListViewController: FusumaDelegate {
    // Return the image which is selected from camera roll or is taken via the camera.
    func fusumaImageSelected(_ image: UIImage, source: FusumaMode) {
        print("Image selected")

        self.fusuma?.albumShouldEnableDoneButton(isEnabled: true)
    }

    // Return the image but called after is dismissed.
    func fusumaDismissedWithImage(_ image: UIImage, source: FusumaMode) {
        print("Called just after FusumaViewController is dismissed.")

        if let addGuestDialog = self.addGuestDialog {
            addGuestDialog.faceImageView.image = image
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.showAddGuestDialog(addGuestDialog)
            }
        }
    }

    func fusumaVideoCompleted(withFileURL fileURL: URL) {
        print("Called just after a video has been selected.")
    }

    // When camera roll is not authorized, this method is called.
    func fusumaCameraRollUnauthorized() {
        print("Camera roll unauthorized")

        self.fusuma?.albumShouldEnableDoneButton(isEnabled: false)
    }

    // Return selected images when you allow to select multiple photos.
    func fusumaMultipleImageSelected(_ images: [UIImage], source: FusumaMode) {

    }

    // Return an image and the detailed information.
    func fusumaImageSelected(_ image: UIImage, source: FusumaMode, metaData: ImageMetadata) {

    }

    func fusumaClosed() {
        if let addGuestDialog = self.addGuestDialog {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.showAddGuestDialog(addGuestDialog)
            }
        }
    }
}
