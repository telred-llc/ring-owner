//
//  AWSS3Manager.swift
//  AWS-Ring
//
//  Created by Pham Hoa on 8/18/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import UIKit
import AWSS3

class AWSS3Manager {
    static let shared = AWSS3Manager()
    
    private init() {
        //
    }
    
    func uploadS3(image: UIImage,
                  name: String,
                  parameters: [String: String],
                  progressHandler: @escaping (Progress) -> Void,
                  completionHandler: @escaping (Error?) -> Void) {
        guard let rzImage = image.resized(withPercentage: 0.5), let data = rzImage.jpegData(compressionQuality: 1.0) else {
            DispatchQueue.main.async {
                completionHandler(ARLError.imageFormatError) // Replace your error
            }
            return
        }
        
        let expression = AWSS3TransferUtilityUploadExpression()
        
        //Copy the custom Meta information into the expression
        for (key, value) in parameters {
            expression.setValue(value, forRequestParameter: key)
        }
        
        expression.progressBlock = { task, progress in
            DispatchQueue.main.async {
                progressHandler(progress)
            }
        }
        
        AWSS3TransferUtility.default().uploadData(
            data,
            bucket: Constant.ASWConfiguration.S3.facesBucketName,
            key: name,
            contentType: "image/jpg",
            expression: expression) { task, error in
                DispatchQueue.main.async {
                    completionHandler(error)
                }
                print("Upload to S3 successed")
                
        }.continueWith { task -> AnyObject? in
            if let error = task.error {
                DispatchQueue.main.async {
                    completionHandler(error)
                }
            }
            return nil
        }
    }
    
    func downloadImage(bucketName: String, fileName: String, completion: @escaping (_ image: UIImage?, _ error: NSError?) -> Void) {
        let transferUtility = AWSS3TransferUtility.default()
        
        transferUtility.downloadData(fromBucket: bucketName, key: fileName, expression: nil) { (task, url, data, error) in
            var resultImage: UIImage?
            
            if let data = data {
                resultImage = UIImage(data: data)
            }
            
            completion(resultImage, error as NSError?)
        }
    }
}
