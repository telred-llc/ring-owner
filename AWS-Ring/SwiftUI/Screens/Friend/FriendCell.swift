//
//  FriendCell.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/21/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI

struct FriendCell: View {
    typealias Item = GetGuestCollectionQuery.Data.GetGuestCollection.Guest.Item
    var data: Item?
    @State private var image = UIImage()
    
    var body: some View {
        return HStack(spacing: 10) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
            
            Text(data?.name ?? "")
                .foregroundColor(Color.white.opacity(0.8))
        }
        .padding(.vertical, 5)
        .onAppear() {
            self.downloadImage()
        }
    }
    
    func downloadImage() {
        Untils.shared.downloadImageAWS(fileName: data?.facePhotos?.first) { (image) in
            if let image = image {
                self.image = image
            } else {
                self.image = UIImage(systemName: "person")!
            }
        }
    }
}

struct FriendCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell()
    }
}
