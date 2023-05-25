//
//  LoginViewLandscapeMode.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct LoginViewLandscapeMode: View {
    
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
                loginViewElements.drawNavigationLink(firstLocalizedKey: "FORGOT_PASSWORD_1", secondLocalizedKey: "FORGOT_PASSWORD_2", viewToGo: Text("Recover password view"))
                    .padding()
                loginViewElements.drawNavigationLink(firstLocalizedKey: "LOGIN_MESSAGE", secondLocalizedKey: "ASK_FOR_SIGNUP", viewToGo: SignupView())
            }
            Spacer()
        }
        .padding(.horizontal,30)
    }
}

struct LoginViewLandscapeMode_Previews: PreviewProvider {
    
    @State static var email: String = ""
    @State static var password: String = ""
    @State static var loginSuccessful: Bool = false
    @State static var showAlert: Bool = false
    @State static var user = UserModel()
    
    static var previews: some View {
        LoginViewLandscapeMode(email: $email, password: $password, loginSuccessful: $loginSuccessful, showAlert: $showAlert, user: $user)
    }
}
