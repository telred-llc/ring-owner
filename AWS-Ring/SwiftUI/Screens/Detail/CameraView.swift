//
//  DetailCameraScreen.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/21/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = DetailViewController
    @State var videoView: UIView?
    
    func makeCoordinator() -> CameraView.Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> DetailViewController {
        let detail = DetailViewController()
        detail.delegate = context.coordinator
        detail.configureVideoView(videoView)
        return detail
        
    }
    
    func updateUIViewController(_ uiViewController: DetailViewController, context: Context) {
        uiViewController.configureVideoView(videoView)
    }
    
    
    class Coordinator: NSObject, DetailViewControllerDelegate {
        var parent: CameraView?
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func detailVCWillAppear() {
            
        }
        
        func detailVCWillBePopped() {
            
        }
        
        func detailVCStopWatching() {
            
        }
    }
    
}

