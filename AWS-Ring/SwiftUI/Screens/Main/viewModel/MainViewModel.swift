//
//  MainViewModel.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/18/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation
import UserNotifications
import AVKit
import AWSKinesis
import AWSKinesisVideoArchivedMedia
import AWSKinesisVideo
import AWSMobileClient
import QRCodeReader
import AWSAppSync
import AWSRekognition
import SwiftUI
import PromiseKit

class CameraOB: Identifiable {
    var id: String?
    var name: String?
    var channel: String?
    
    init(data: GraphQLSelectionSet?) {
        guard let data = data else {
            return
        }
        id = data.snapshot["id"] as? GraphQLID
        name = data.snapshot["name"] as? String
        channel = data.snapshot["channel"] as? String
    }
}

final class MainViewModel: BaseObservableObject {
    
    typealias UserCamera = ListCamerasQuery.Data.ListCamera
    typealias CollectionItem = ListGuestCollectionsQuery.Data.ListGuestCollection.Item
    
    @Published var userCamera = UserCamera()
    @Published var guestCollections: [String] = []
    @Published var dataCameras: [CameraOB] = []
    @Published var roomService: RoomService?
    @Published var videoView: UIView?
    @Published var isOpenDetail: Bool = false
    
    private var selectedDeviceId: String?
    private let userIdentifier = UUID().uuidString.replacingOccurrences(of: "-", with: "")
    private var participants: [ParticipantModel] = []
    
    func addDevice(id: String) {
        Untils.baseViewController.showProgressHub()
        var currentCameras = Session.shared.meData?.cameras ?? []
        if !currentCameras.contains(id) {
            currentCameras.append(id)
        }
        
        Session.shared.update(cameras: currentCameras) { [weak self] (error) in
            Untils.baseViewController.hideProgressHub()
            guard let `self` = self else {
                return
            }
            if let error = error {
                self.showAlert(title: "Error", mess: "", data: error)
            } else {
                self.getDevicesList()
            }
        }
    }
    
    func getDevicesList() {
        appSyncClient?.fetch(query: ListCamerasQuery.init(filter: nil, limit: 30, nextToken: nil), cachePolicy: .fetchIgnoringCacheData, queue: DispatchQueue.main, resultHandler: { [weak self] (result, error) in
            Untils.baseViewController.hideProgressHub()
            if let error = error {
                self?.showAlert(title: "Error", mess: "", data: error)
            } else if let userCamera = result?.data?.listCameras {
                self?.userCamera = userCamera
                self?.userCamera.items?.removeAll(where: {
                    Session.shared.meData?.cameras?.contains( $0?.id ?? "" ) != true
                })
                self?.dataCameras = self?.userCamera.items?.map({CameraOB(data: $0)}) ?? []
                if self?.userCamera.items?.count == 1 {
                    if let cameraId = self?.userCamera.items?.first??.id {
                        //                        self?.joinRoom(roomId: cameraId)
                    }
                }
                self?.objectWillChange.send()
            }
        })
    }
    
    func getCollections() {
        appSyncClient?.fetch(query: ListGuestCollectionsQuery.init(), cachePolicy: .fetchIgnoringCacheData, queue: .main, resultHandler: { [weak self] (result, error) in
            if let error = error {
                self?.showAlert(title: "Error", mess: "", data: error)
            } else if let collections = result?.data?.listGuestCollections?.items?.compactMap({ $0?.id }) {
                self?.guestCollections = collections
            } else {
                self?.guestCollections = []
            }
            self?.objectWillChange.send()
        })
    }
    
    func getMeData() {
        guard Session.shared.meData?.deviceToken == nil else {
            self.getDevicesList()
            self.getCollections()
            self.objectWillChange.send()
            
            return
        }
        Untils.baseViewController.showProgressHub()
        AWSMobileClient.sharedInstance().getUserAttributes(completionHandler: { [weak self] (attrs, error) in
            // Get cognitoId
            if let attrs = attrs, let cognitoId = attrs["sub"] {
                self?.appSyncClient?.fetch(query: GetUserQuery.init(id: cognitoId), cachePolicy: CachePolicy.fetchIgnoringCacheData, resultHandler: { (result, error) in
                    if let error = error {
                        self?.showAlert(title: "Error", mess: "", data: error)
                    } else if let getUser = result?.data?.getUser {
                        Session.shared.meData = getUser
                        self?.getDevicesList()
                        self?.getCollections()
                        self?.objectWillChange.send()
                    }
                })
            } else {
                self?.showAlert(title: "Error", mess: "Something went wrong!", data: nil)
            }
        })
    }
    
    
    func joinRoom(roomId: String) {
        if self.roomService == nil || self.roomService?.getRoomIdentifier() != roomId {
            selectedDeviceId = roomId
            self.roomService = RoomService(withRoomIdentifier: roomId, userIdentifier: self.userIdentifier, delegate: self)
        }
        
        //        if !isDisplayingDetailVC, detailViewController != nil {
        //            self.navigationController?.pushViewController(detailViewController!, animated: false)
        //        }
        self.isOpenDetail = true
        self.objectWillChange.send()
        let now = Date.init()
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let dateString = dateFormatter.string(from: now)
        
        let requestStreamingInput = CreateRequestStreamingInput.init(id: UUID().uuidString, cameraId: roomId, userId: Session.shared.meData?.id, time: dateString)
        appSyncClient?.perform(mutation: CreateRequestStreamingMutation.init(input: requestStreamingInput), resultHandler: { (result, error) in
            //
        })
    }
    
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
    
    func applyParticipants(_ participants: [ParticipantModel]) {
    }
    
}

extension MainViewModel:  RoomServiceDelegate {
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
            self.showAlert(title: "Error", mess: "", data: error)
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
                Untils.baseViewController.showToast(message: "Streaming finished")
            default:
                break
            }
        }
    }
    
    func room(_ room: RoomService?, didChangeVideoView videoView: UIView?, forUserIdentifier userIdentifier: String) {
        if  self.selectedDeviceId == userIdentifier, let videoView = videoView {
            self.videoView = videoView
//            detailViewController?.configureVideoView(videoView)
        }
    }
    
    func existRoom() {
        self.selectedDeviceId = nil
        self.roomService = nil
        
        //        if isDisplayingDetailVC {
        //            self.navigationController?.popViewController(animated: true)
        //        }
    }
}
