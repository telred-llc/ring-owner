//
//  BaseView.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/25/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
    let content: Content
    
    var body: some View {
        VStack {
            Text("")
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView(content: Text(""))
    }
}
