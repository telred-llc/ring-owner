//
//  ConfirmationView.swift
//  AWS-Ring
//
//  Created by Vu Vuong on 11/15/19.
//  Copyright © 2019 Pham Hoa. All rights reserved.
//

import SwiftUI

struct ConfirmationScreen: View {
    enum ConfirmationType {
           case signup
           case signin
       }
    @ObservedObject private var viewModel = ConfirmationViewModel()
    var type: ConfirmationType = .signup
    
    var body: some View {
        VStack(spacing: 20) {
            InputViewCustom(placeholder: "Verify Code*", value: $viewModel.code)
            Button("Submit") {
                switch self.type {
                case .signup:
                    self.viewModel.confirmSignup()
                case .signin:
                    self.viewModel.confirmSignin()
                }
            }
            .modifier(LoginButtonModifier())
            
            Button("Resend verifycation code") {
                self.viewModel.resendCode()
            }
            Spacer()
            
        }
        .navigationBarTitle("Confirmation")
        .padding(.all, 30)
        .padding(.top, 30)
    }
 
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationScreen()
    }
}
