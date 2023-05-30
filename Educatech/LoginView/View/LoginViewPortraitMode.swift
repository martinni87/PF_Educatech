//
//  LoginViewPortraitMode.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct LoginViewPortraitMode: View {
    
    @Binding var user: UserModel
    @Binding var validationResponse: ValidationResponse
    
    var body: some View {
        
        let loginViewElements = LoginViewElements(user: $user, validationResponse: $validationResponse)
        
        VStack (spacing:30){
            Spacer()
            
            loginViewElements.drawTitleAndIndications()
                .padding()
            Spacer()
            
            loginViewElements.drawTextField(type: .email)
            loginViewElements.drawTextField(type: .password)
            
            loginViewElements.drawNavigationLink(type: .recoverPassword)
            
            loginViewElements.drawSignInButton()

            Spacer()

            loginViewElements.drawNavigationLink(type: .newRegister)
        }
        .padding(.horizontal,30)
    }
}

struct LoginViewPortraitMode_Previews: PreviewProvider {
    
    @State static var user = UserModel()
    @State static var validationResponse = ValidationResponse()
    
    static var previews: some View {
        LoginViewPortraitMode(user: $user, validationResponse: $validationResponse)
    }
}
