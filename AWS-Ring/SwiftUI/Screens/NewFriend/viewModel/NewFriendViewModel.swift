//
//  NewFriendViewModel.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/18/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation
import SwiftUI
import SDWebImage
import AWSRekognition
import PromiseKit

class GuestCollection: ObservableObject {
    typealias Guest = GetGuestCollectionQuery.Data.GetGuestCollection.Guest.Item
    var items: [Guest] = []
}

final class NewFriendViewModel: BaseObservableObject {
    typealias Guest = GetGuestCollectionQuery.Data.GetGuestCollection.Guest.Item
    @Published var guestName = ""
    @Published var image: UIImage?
    @Published var collectionId: String?
    var addComplete: ((_ data: Guest) -> Void)?
    
    func addGuest() {
        guard !guestName.isEmpty else {
            showAlert(title: "Error", mess: "Name guest is empty!", data: nil)
            return
        }
        
        guard let faceImage = image else {
            showAlert(title: "Error", mess: "Please select a face image", data: nil)
            return
        }
        
        var fileName = guestName.split(separator: " ").filter({ !$0.isEmpty }).joined(separator: "_").lowercased()
        fileName += "_\(Date().timeIntervalSince1970)"
        Untils.baseViewController.showProgressHub()
        firstly {
            return self.uploadFaceImageToS3(image: faceImage, imageName: fileName)
        }.then({ (_) in
            return self.indexFace(s3ObjectName: fileName)
        }).then({ (faceId) in
            return self.addGuest(name: self.guestName, collectionId: self.collectionId!, recognitionId: faceId, faces: [fileName])
        }).done({ (guest: Guest) in
            self.addComplete?(guest)
        }).ensure {
            Untils.baseViewController.hideProgressHub()
        }.catch({ (error) in
            self.showAlert(title: "Error", mess: "", data: error)
        })
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
    
    func indexFace(s3ObjectName: String) -> PromiseKit.Promise<String> {
        return PromiseKit.Promise<String> { (resolver) in
            let rekognition = AWSRekognition.default()
            
            let faceRequest = AWSRekognitionIndexFacesRequest()
            let image = AWSRekognitionImage()
            
            let s3Object = AWSRekognitionS3Object()
            s3Object?.bucket = Constant.ASWConfiguration.S3.facesBucketName
            s3Object?.name = s3ObjectName
            image?.s3Object = s3Object
            
            faceRequest!.image = image
            faceRequest!.collectionId = Constant.awsRekognitionCollectionId
            
            rekognition.indexFaces(faceRequest!).continueWith { (response) -> Any? in
                if let error = response.error {
                    print("Index face faile: \(error)")
                    resolver.reject(error)
                    //handle error
                }
                else {
                    //app logic here
                    if let firstFace = response.result?.faceRecords?.first?.face  {
                        resolver.fulfill(firstFace.faceId ?? "")
                    } else {
                        self.showAlert(title: "Error", mess: "Can't detect face from your image! Try again", data: nil)
                        let error = NSError(domain:"", code: 400, userInfo:[ NSLocalizedDescriptionKey: "Can't detect face from your image! Try again"])
                        resolver.reject(error)
                    }
                    
                }
                return nil
            }
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
}
