//
//  CountryPicker.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/13/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI

struct CountryPicker: View {
    @Binding var phoneCodeDataSource: [PhoneCodeModel]
    @Binding var showing: Bool
    @Binding var model: PhoneCodeModel?
    
    var body: some View {
        return renderView()
    }
    
    private func renderView() -> some View {
        return List(phoneCodeDataSource, id: \.countryCode) { value in
            Text(String(format: "+%@ %@", value.phoneCode, value.countryName)).onTapGesture {
                self.showing = false
                self.model = value
            }.foregroundColor(Color.gray)
        }
        .navigationBarTitle("Choose your country")
    }
}

//struct CountryPicker_Previews: PreviewProvider {
//    @State var modelA: PhoneModel?
//
//    static var previews: some View {
//        CountryPicker(showing: .constant(false), model: $modelA)
//    }
//}
