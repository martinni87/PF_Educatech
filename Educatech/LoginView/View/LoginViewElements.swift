//
//  LoginViewElements.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct LoginViewElements {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var option: EmailOption?
    @Binding var showAlert: Bool

    @ViewBuilder func drawTitleAndIndications() -> some View{
        VStack {
            Text(LocalizedStringKey("WELCOME"))
                .font(.largeTitle)
            .bold()

            Text(LocalizedStringKey("LOGIN_INDICATIONS"))
                .font(.subheadline)
                .bold()
                .foregroundColor(.gray)
        }
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder func drawTextField() -> some View{
        TextField(LocalizedStringKey("ENTER_EMAIL"), text: $email)
            .padding(.horizontal, 20)
            .textFieldStyle(.roundedBorder)
            .tint(.mint)
    }
    
    @ViewBuilder func drawSecureTextField() -> some View{
        SecureField(LocalizedStringKey("ENTER_PASSWORD"), text: $password)
            .padding(.horizontal, 20)
            .textFieldStyle(.roundedBorder)
            .tint(.mint)
    }
    
    @ViewBuilder func drawForgotButton() -> some View{
        Button(action: {
            option = .resetPassword
        }) {
            VStack(spacing: 10) {
                Text(LocalizedStringKey("FORGOT_PASSWORD_1"))
                Text(LocalizedStringKey("FORGOT_PASSWORD_2"))
                    .bold()
                    .underline()
            }
        }
        .padding(.bottom,20)
        .padding(.horizontal,20)
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder func drawSignInButton() -> some View{
        Button(LocalizedStringKey("LOGIN_BUTTON"), action: {
            //Check credentials locally: if true, then option = .signIn, if false, option = .error
            guard LoginViewController().validateCredentials(email: email, password: password) else {
                print("Debería mostrarse la alerta")
                showAlert = true
                return
            }
            print("No debería mostrarse la alerta")
            showAlert = false
            option = .signIn
        })
        .padding()
        .buttonStyle(.bordered)
        .tint(.mint)
        .alert(isPresented: $showAlert){
            Alert(
                title: Text(LocalizedStringKey("ERROR_CREDENTIALS")),
                message: Text(LocalizedStringKey("ERROR_CREDENTIALS_MESSAGE")),
                dismissButton: .default(Text(LocalizedStringKey("OK_BUTTON"))))
        }
    }
    
    @ViewBuilder func drawSignUpButton() -> some View{
        Button(action: {
            option = .register
        }) {
            VStack(spacing: 10) {
                Text(LocalizedStringKey("LOGIN_MESSAGE"))
                Text(LocalizedStringKey("ASK_FOR_SIGNUP"))
                    .bold()
                    .underline()
            }
        }
        .padding(.bottom,20)
        .padding(.horizontal,20)
        .multilineTextAlignment(.center)
    }
    
}
