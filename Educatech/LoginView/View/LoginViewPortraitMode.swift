//
//  LoginViewPortraitMode.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct LoginViewPortraitMode: View {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var loginSuccessful: Bool
    @Binding var showAlert: Bool
    @Binding var user: UserModel
    
    var body: some View {
        
        let loginViewElements = LoginViewElements(email: $email, password: $password, loginSuccessful: $loginSuccessful, showAlert: $showAlert, user: $user)
        
        VStack (spacing:30){
            Spacer()
            
            loginViewElements.drawTitleAndIndications()
                .padding()
            Spacer()
            
            loginViewElements.drawTextField(type: .email)
            loginViewElements.drawTextField(type: .password)
            
            loginViewElements.drawNavigationLink(firstLocalizedKey: "FORGOT_PASSWORD_1", secondLocalizedKey: "FORGOT_PASSWORD_2", viewToGo: Text("Recover password view"))
            
            loginViewElements.drawSignInButton()

            Spacer()

            loginViewElements.drawNavigationLink(firstLocalizedKey: "LOGIN_MESSAGE", secondLocalizedKey: "ASK_FOR_SIGNUP", viewToGo: SignupView())
        }
        .padding(.horizontal,30)
    }
}

struct LoginViewPortraitMode_Previews: PreviewProvider {
    
    @State static var email: String = ""
    @State static var password: String = ""
    @State static var loginSuccessful: Bool = false
    @State static var showAlert: Bool = false
    @State static var user = UserModel()
    
    static var previews: some View {
        LoginViewPortraitMode(email: $email, password: $password, loginSuccessful: $loginSuccessful, showAlert: $showAlert, user: $user)
    }
}
