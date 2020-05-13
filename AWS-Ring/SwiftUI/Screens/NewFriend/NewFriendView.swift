//
//  NewFriendView.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/15/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI

struct NewFriendView: View {
    typealias Guest = GetGuestCollectionQuery.Data.GetGuestCollection.Guest.Item
    @Environment(\.presentationMode) var presentationMode
    @State private var guestName = ""
    @State private var isShowPickerImage = false
    @State private var image: UIImage?
    @ObservedObject private var viewModel = NewFriendViewModel()
    
    init(collectionID: String, addComplete: (() -> Void)?) {
        viewModel.collectionId = collectionID
        viewModel.addComplete = { (data: Guest) in
            addComplete?()
            print("Friend:", data)
        }
    }
    
    var body: some View {
        return VStack(spacing: 20) {
            AlertView(title: $viewModel.titleAlert, data: $viewModel.alertResponse, message: $viewModel.messageAlert, isShowing: $viewModel.isShowAlert) { (data) in
                
            }.frame(width: 0, height: 0, alignment: .center)
            InputViewCustom(placeholder: "Guest name", value: $viewModel.guestName)
            Image(uiImage: getImage())
                           .resizable()
                           .scaledToFit()
                           .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)
                           .border(Color.gray.opacity(0.6), width: 1)
                           .clipped()
                           .onTapGesture {
                               self.isShowPickerImage = true
                       }
            Text("ADD")
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                .background(Color.green)
                .foregroundColor(Color.white)
                .onTapGesture {
                    self.viewModel.addGuest()
            }
            
        }
        .sheet(isPresented: $isShowPickerImage, content: {
            return ImagePickerView(dismiss: { image in
                self.viewModel.image = image
                self.isShowPickerImage = false
            })
        })
            .padding(30)
        
    }
    
    func getImage() -> UIImage {
        guard let image = $viewModel.image.wrappedValue else {
            return UIImage(named: "ic_add_guest_face") ?? UIImage()
        }
        return image
    }
}

struct NewFriendView_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendView(collectionID: "", addComplete: {
            
        })
    }
}
