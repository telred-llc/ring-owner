//
//  InputViewCustom.swift
//  SwiftUI Test
//
//  Created by Vu Vuong on 11/12/19.
//  Copyright © 2019 Vu Vuong. All rights reserved.
//

import SwiftUI

struct InputViewCustom: View {
    var placeholder: String?
    var value: Binding<String> = .constant("")
    
    var body: some View {
        return renderNormalInput()
       
    }
    
    private func renderNormalInput() -> some View {
        VStack {
            TextField(placeholder ?? "", text: value)
                .padding(.all, 16)
                .frame(height: 50, alignment: .leading)
                .autocapitalization(.none)
            
        }
        .border(Color.gray.opacity(0.6), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

struct InputViewCustom_Previews: PreviewProvider {
    static var previews: some View {
        var view = InputViewCustom()
        view.placeholder = "Placeholder"
        return view.previewLayout(.fixed(width: 300, height: 50))
    }
}
