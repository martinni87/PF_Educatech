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
    @Binding var loginSuccessful: Bool
    @Binding var showAlert: Bool
    @Binding var user: UserModel

    let loginViewController = LoginViewController()
    
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
    
    @ViewBuilder func drawTextField(type: CustomTextFieldTypes) -> some View{
        if type == .email {
            TextField(LocalizedStringKey("ENTER_EMAIL"), text: $email)
                .padding(.horizontal, 20)
                .textFieldStyle(.roundedBorder)
                .tint(.mint)
        }
        else if type == .password {
            SecureField(LocalizedStringKey("ENTER_PASSWORD"), text: $password)
                .padding(.horizontal, 20)
                .textFieldStyle(.roundedBorder)
                .tint(.mint)
        }
    }
    
    @ViewBuilder func drawSignInButton()  -> some View {
        Button(LocalizedStringKey("LOGIN_BUTTON"), action: {
            loginSuccessful = loginViewController.loginAttempt(email: email, password: password)
            showAlert = !loginSuccessful
            user.email = email
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
    
    @ViewBuilder func drawNavigationLink(firstLocalizedKey: String, secondLocalizedKey: String, viewToGo: some View) -> some View{
        NavigationLink(destination: {
            viewToGo
        }) {
            VStack(spacing: 10) {
                Text(LocalizedStringKey(firstLocalizedKey))
                Text(LocalizedStringKey(secondLocalizedKey))
                    .bold()
                    .underline()
            }
        }
        .padding(.bottom,20)
        .padding(.horizontal,20)
        .multilineTextAlignment(.center)
    }
}
