//
//  ProgressHub.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/12/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import Foundation
import AWSAppSync
import SDWebImage
import AWSRekognition
import PromiseKit
import RxSwift
import RxCocoa
import Fusuma
import SwiftEntryKit
import Kingfisher

class Untils {
    static let baseViewController = BaseViewController()
    static let shared = Untils()
    
    func getAppSync() -> AWSAppSyncClient? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.appSyncClient
    }
    
    func downloadImageAWS(fileName: String?, complete: ((_ image: UIImage?) -> Void)?) {
        guard let fileName = fileName else {
            return
        }
        let cache = ImageCache.default
        let cached = cache.isCached(forKey: fileName)
        
        if cached {
            cache.retrieveImage(forKey: fileName) { (result) in
                switch result {
                case .success(let value):
                    complete?(value.image)
                case .failure(_):
                    break
                }
            }
        } else {
            AWSS3Manager.shared.downloadImage(bucketName: Constant.ASWConfiguration.S3.facesBucketName, fileName: fileName) { (imageA, error) in
                if let imageB = imageA {
                    cache.store(imageB, forKey: fileName)
                    complete?(imageB)
                } else {
                    cache.removeImage(forKey: fileName)
                }
            }
        }
    }
}
