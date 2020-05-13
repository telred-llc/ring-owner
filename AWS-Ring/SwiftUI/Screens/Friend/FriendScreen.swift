//
//  FriendScreen.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/15/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI
import AWSAppSync

struct FriendScreen: View {
    @State private var isShowAddFriend = false
    typealias Item = GetGuestCollectionQuery.Data.GetGuestCollection.Guest.Item
    @State private var data: [Item] = []
    @ObservedObject private var viewModel = FriendListViewModel()
    var addComplete: (() -> Void)?
    
    init(collectionID: String) {
        viewModel.collectionID = collectionID
    }
    
    var body: some View {
        return List(viewModel.data, id:\.id) { (item: Item) in
            FriendCell(data: item)
        }
        .sheet(isPresented: $isShowAddFriend, content: {
            return NewFriendView(collectionID: self.viewModel.collectionID ?? "") {
                self.viewModel.prepareData(animated: false)
                self.isShowAddFriend = false
            }
        })
            .navigationBarTitle("Friend List")
            .navigationBarItems(trailing: renderItemBar())
            .onAppear() {
                self.viewModel.prepareData()
        }
        
    }
    
    private func renderItemBar() -> some View {
        Button(action: {
            self.isShowAddFriend = true
        })
        {
            Image(systemName: "person.badge.plus").padding()
            
        }
    }
    
}

struct FriendScreen_Previews: PreviewProvider {
    static var previews: some View {
        FriendScreen(collectionID: "")
    }
}
