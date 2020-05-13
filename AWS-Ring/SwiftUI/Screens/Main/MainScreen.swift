//
//  MainScreen.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/15/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI
import AWSAppSync

struct MainScreen: View {
    @State private var isShowFriendList = false
    @State private var ishowQRcode = false
    @State private var idCamera = ""
    @ObservedObject private var viewModel = MainViewModel()
    
    var body: some View {
        return VStack() {
            VStack {
                setupNavigationLink()
                AlertView(title: $viewModel.titleAlert, data: $viewModel.alertResponse, message: $viewModel.messageAlert, isShowing: $viewModel.isShowAlert) { (data) in
                    
                }.frame(width: 0, height: 0, alignment: .center)
                
                List(viewModel.dataCameras, id: \.id) { (value: CameraOB) in
                    Text("\(value.name ?? "") \(Int(self.viewModel.dataCameras.lastIndex(where: {$0 === value}) ?? 0) + 1)")
                        .foregroundColor(Color.white.opacity(0.8))
                        .padding(.vertical, 5).onTapGesture {
                            self.viewModel.joinRoom(roomId: value.id ?? "")
                            print("Join Room:", value.id ?? "")
                    }
                    
                }
                Button("Logout") {
                    Untils.baseViewController.showProgressHub()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        Untils.baseViewController.hideProgressHub()
                        Session.shared.signOut()
                        Switcher.updateRootVC(logined: false)
                    }
                    
                }
                .foregroundColor(Color.red)
                .font(Font.system(size: 14))
                .padding(16)
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                .onAppear() {
                    self.viewModel.getMeData()
                }
            }
        }
        .sheet(isPresented: $ishowQRcode, content: {
            return QRCodeView { (id) in
                self.viewModel.addDevice(id: id)
                self.ishowQRcode = false
            }
        })
            .navigationBarTitle("Cameras")
            .navigationBarItems(trailing: renderItemBar())
        
    }
    
    private func renderItemBar() -> some View {
        HStack(spacing: 0) {
            Button(action: {
                self.isShowFriendList = true
            }) {
                Image(systemName: "person.2").padding()
            }
            
            Button(action: {
                self.ishowQRcode = true
            }) {
                Image(systemName: "camera").padding()
            }
        }
    }
    
    private func setupNavigationLink() -> some View {
        VStack {
            NavigationLink(destination: FriendScreen(collectionID:
                $viewModel.guestCollections.wrappedValue.first ?? ""), isActive: $isShowFriendList) {
                    Text("")
            }.frame(width: 0, height: 0, alignment: .center)
            
            NavigationLink(destination: CameraView(videoView: viewModel.videoView), isActive: self.$viewModel.isOpenDetail) {
                Text("")
            }.frame(width: 0, height: 0, alignment: .center)
        }
        
    }
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
