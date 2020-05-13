//
//  ImagePickerView.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/18/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation
import SwiftUI
import YPImagePicker

struct ImagePickerView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = YPImagePicker
    @State var dismiss: ((_ image: UIImage) -> Void)?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> YPImagePicker {
         var config = YPImagePickerConfiguration()
        config.isScrollToChangeModesEnabled = false
        config.showsPhotoFilters = false
        config.startOnScreen = YPPickerScreen.photo
        config.screens = [.library, .photo]
        let pickerVC = YPImagePicker(configuration: config)
        pickerVC.didFinishPicking { (items, _) in
            if let image = items.singlePhoto {
                self.dismiss?(image.image)
            }
        }
        return pickerVC
    }
    
    func updateUIViewController(_ uiViewController: YPImagePicker, context: Context) {
        
    }
    
    class Coordinator: NSObject, YPImagePickerDelegate {
        func noPhotos() {
            
        }
        
        
        var parent: ImagePickerView?
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
    }
}
