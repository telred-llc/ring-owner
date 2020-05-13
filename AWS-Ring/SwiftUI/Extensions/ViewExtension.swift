//
//  ViewExtension.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/12/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI
import UIKit

extension View {
    func endEditing(_ force: Bool) {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow?.endEditing(force)
    }
    
}

extension RandomAccessCollection {
    func indexed() -> IndexedCollection<Self> {
        IndexedCollection(base: self)
    }
}

struct IndexedCollection<Base: RandomAccessCollection>: RandomAccessCollection {
 typealias Index = Base.Index
 typealias Element = (index: Index, element: Base.Element)

 let base: Base

 var startIndex: Index { base.startIndex }

// corrected typo: base.endIndex, instead of base.startIndex
 var endIndex: Index { base.endIndex }

 func index(after i: Index) -> Index {
     base.index(after: i)
 }

 func index(before i: Index) -> Index {
     base.index(before: i)
 }

 func index(_ i: Index, offsetBy distance: Int) -> Index {
     base.index(i, offsetBy: distance)
 }

 subscript(position: Index) -> Element {
     (index: position, element: base[position])
    }
}


extension UIImage {
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
}
