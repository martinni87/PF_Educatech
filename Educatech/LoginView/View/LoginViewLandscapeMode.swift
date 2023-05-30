//
//  LoginViewLandscapeMode.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct LoginViewLandscapeMode: View {
    
    @Binding var user: UserModel
    @Binding var validationResponse: ValidationResponse
    
    var body: some View {
        
        let loginViewElements = LoginViewElements(user: $user, validationResponse: $validationResponse)
        
        VStack (spacing:30){
            Spacer()
            loginViewElements.drawTitleAndIndications()
                .padding()
            Spacer()
            HStack {
                VStack {
                    loginViewElements.drawTextField(type: .email)
                    loginViewElements.drawTextField(type: .password)
                }
                VStack {
                    
                    loginViewElements.drawSignInButton()
                }
            }

            HStack{
                loginViewElements.drawNavigationLink(type: .recoverPassword)
                    .padding()
                loginViewElements.drawNavigationLink(type: .newRegister)
            }
            Spacer()
        }
        .padding(.horizontal,30)
    }
}

struct LoginViewLandscapeMode_Previews: PreviewProvider {
    
    @State static var user = UserModel()
    @State static var validationResponse = ValidationResponse()
    
    static var previews: some View {
        LoginViewLandscapeMode(user: $user, validationResponse: $validationResponse)
    }
}
