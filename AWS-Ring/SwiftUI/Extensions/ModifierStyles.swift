//
//  ModifierExtension.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/12/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI

struct LoginButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 30)
            .padding(.vertical, 12)
            .background(Color.blue)
            .accentColor(Color.white)
            .cornerRadius(8)
            .padding(.top, 20)
    }
}
