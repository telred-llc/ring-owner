//
//  SecureTextFieldCustom.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/12/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI

struct SecureTextFieldCustom: View {
    var placeholder: String?
    var value: Binding<String> = .constant("")
    
    var body: some View {
        return renderSecureInput()
    }
    
    private func renderSecureInput() -> some View {
           VStack {
               SecureField(placeholder ?? "", text: value)
                   .padding(.all, 16)
                   .frame(height: 50, alignment: .leading)
           }
           .border(Color.gray.opacity(0.6), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
       }
}

struct SecureTextFieldCustom_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextFieldCustom()
    }
}
