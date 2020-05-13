//
//  FriendListViewModel.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/19/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation
import PromiseKit
import AWSRekognition
import AWSAppSync
import SwiftUI

final class FriendListViewModel: BaseObservableObject {
    typealias Promise = PromiseKit.Promise
    @Published var collectionID: String?
    @Published var data: [Item] = [] {
        didSet {
            self.objectWillChange.send()
        }
    }
    typealias Item = GetGuestCollectionQuery.Data.GetGuestCollection.Guest.Item
    
    func prepareData(animated: Bool = true) {
        guard let collectionId = self.collectionID, collectionID?.isEmpty == false else {
            if animated {
                Untils.baseViewController.showProgressHub()
            }
            firstly {
                return self.createGuestCollection(collectionId: UUID().uuidString)
            }.done { (collectionId) in
                self.collectionID = collectionId
                self.getGuestList(collectionId: collectionId)
                //                self.createCollectionHandler?()
            }.ensure {
                Untils.baseViewController.hideProgressHub()
            }.catch { (error) in
                self.showAlert(title: "Error", mess: "", data: error)
            }
            return
        }
        self.getGuestList(collectionId: collectionId)
        
    }
    
    func getGuestList(collectionId: String) {
        Untils.baseViewController.showProgressHub()
        appSyncClient?.fetch(query: GetGuestCollectionQuery.init(id: collectionId), cachePolicy: .fetchIgnoringCacheData, queue: DispatchQueue.main, resultHandler: { [weak self] (result, error) in
            Untils.baseViewController.hideProgressHub()
            if let error = error {
                self?.showAlert(title: "Error", mess: "", data: error)
            } else if let guestCollection = result?.data?.getGuestCollection {
                self?.data = guestCollection.guests?.items?.compactMap{ $0 } ?? []
            } else {
                self?.data = []
            }
        })
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
    
}
