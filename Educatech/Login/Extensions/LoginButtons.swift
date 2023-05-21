//
//  LoginButtons.swift
//  Educatech
//
//  Created by Martín Antonio on 18/5/23.
//

import SwiftUI

enum LoginOption: String, Identifiable {
    case emailLogin
    case facebook
    case google
    case apple
    case register
    case lost
    case empty
    
    //To conform Identifiable protocol
    var id: String {
        return rawValue
    }
}

extension LoginView {

    // Buttons for login view
    @ViewBuilder func getLoginButtons(option: Binding<LoginOption?>) -> some View{
        
        Group {
            VStack {
                VStack {
                    Button(action: {
                        option.wrappedValue = .emailLogin
                    }) {
                        Label("Acceder con email", systemImage: "envelope.fill")
                            .frame(maxWidth: .infinity)
                            .bold()
                    }.buttonStyle(.bordered)
                    Button(action: {
                        option.wrappedValue = .facebook
                    }) {
                        Label("Continuar con Facebook", systemImage: "envelope.fill")
                            .frame(maxWidth: .infinity)
                            .bold()
                    }.tint(.blue)
                    Button(action: {
                        option.wrappedValue = .google
                    }) {
                        Label("Continuar con Google", systemImage: "envelope.fill")
                            .frame(maxWidth: .infinity)
                            .bold()
                    }.tint(.green)
                    Button(action: {
                        option.wrappedValue = .apple
                    }) {
                        Label("Apple", systemImage: "apple.logo")
                            .frame(maxWidth: .infinity)
                            .bold()
                    }.tint(.black)
                    
                }
                .frame(maxWidth: .infinity)
                .controlSize(.large)
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button(action: {
                    option.wrappedValue = .register
                }) {
                    VStack(spacing: 10) {
                        Text("¿Aun no te has registrado?")
                        Text("Regístrate haciendo click aquí")
                            .bold()
                            .underline()
                    }
                }
                .padding(.bottom,20)
                .padding(.horizontal,20)
                .multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal,30)
        .padding(.top, 40)
    }
}
