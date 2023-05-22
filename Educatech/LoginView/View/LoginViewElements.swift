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
            option = .signIn
        })
        .padding()
        .buttonStyle(.bordered)
        .tint(.mint)
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
