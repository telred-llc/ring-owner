//
//  QRCodeView.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/18/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation
import SwiftUI
import QRCodeReader

struct QRCodeView: UIViewControllerRepresentable {
    var complete: ((_ id: String) -> Void)?
    typealias UIViewControllerType = QRCodeReaderViewController
    
    func makeCoordinator() -> QRCodeView.Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<QRCodeView>) -> QRCodeReaderViewController {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.3, width: 0.6, height: 0.4)
        }
        
        let vc = QRCodeReaderViewController(builder: builder)
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: QRCodeReaderViewController, context: UIViewControllerRepresentableContext<QRCodeView>) {
        
    }
    
    class Coordinator: NSObject, QRCodeReaderViewControllerDelegate {
        
        var parent: QRCodeView?
        
        init(_ parentViewController: QRCodeView) {
            self.parent = parentViewController
        }
        
        func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
            let id = result.value
            parent?.complete?(id)
            
        }
        
        func readerDidCancel(_ reader: QRCodeReaderViewController) {
            reader.stopScanning()
        }
        
        
    }
    
}
