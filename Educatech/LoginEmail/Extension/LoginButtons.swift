//
//  LoginButtons.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

extension LoginView {

    // Buttons for login view
    @ViewBuilder func getLoginButtons(option: Binding<InitOption?>) -> some View{
        
        Group {
            VStack {
                VStack {
                    Button(action: {
                        option.wrappedValue = .email
                    }) {
                        Label(LocalizedStringKey("EMAIL_LOGIN"), systemImage: "envelope.fill")
                            .frame(maxWidth: .infinity)
                            .bold()
                    }.buttonStyle(.bordered)
                    Button(action: {
                        option.wrappedValue = .facebook
                    }) {
                        Label(LocalizedStringKey("FACEBOOK_LOGIN"), systemImage: "envelope.fill")
                            .frame(maxWidth: .infinity)
                            .bold()
                    }.tint(.blue)
                    Button(action: {
                        option.wrappedValue = .google
                    }) {
                        Label(LocalizedStringKey("GOOGLE_LOGIN"), systemImage: "envelope.fill")
                            .frame(maxWidth: .infinity)
                            .bold()
                    }.tint(.green)
                    Button(action: {
                        option.wrappedValue = .apple
                    }) {
                        Label(LocalizedStringKey("APPLE_LOGIN"), systemImage: "apple.logo")
                            .frame(maxWidth: .infinity)
                            .bold()
                    }.tint(.black)
                    
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(.horizontal,30)
        .padding(.top, 40)
        Spacer()
    }
}

