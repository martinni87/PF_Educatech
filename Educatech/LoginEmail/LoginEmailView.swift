//
//  LoginEmailView.swift
//  E-Learning
//
//  Created by Martín Antonio on 13/5/23.
//

import SwiftUI

struct LoginEmailView: View {
    
//    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var email: String = ""
    @State var password: String = ""
//    @State private var recoverPassword: RecoverPasswordOptions?
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
//            DismissView()
//                .padding(20)
            Group {
                Text("¡Bienvenido de nuevo!")
                    .font(.largeTitle)
                .bold()
                
                Text("Escribe la dirección de e-mail con la que te has registrado para iniciar sesión en tu cuenta")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.gray)
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)

            TextField("Introduce tu e-mail", text: $email)
                .padding(.horizontal, 20)
                .textFieldStyle(.roundedBorder)
                .tint(.mint)
            
            SecureField("Introduce tu contraseña", text: $password)
                .padding(.horizontal, 20)
                .textFieldStyle(.roundedBorder)
                .tint(.mint)
            
            Button(action: {
                print("Restore password")
            }) {
                VStack(spacing: 10) {
                    Text("¿No recuerdas tu contraseña?")
                    Text("Pulsa para resetear")
                        .bold()
                        .underline()
                }
            }
            .padding(.bottom,20)
            .padding(.horizontal,20)
            .multilineTextAlignment(.center)
            
            Button("Iniciar sesión", action: {
                print("Login")
//                authenticationViewModel.login(email: email, password: password)
            })
            .padding()
            .buttonStyle(.bordered)
            .tint(.mint)
//            if let messageError = authenticationViewModel.messageError {
                Text(/*messageError*/"Texto demo error")
                    .bold()
                    .font(.body)
                    .foregroundColor(.red)
                    .padding(20)
            }
            
            Button(action: {
//                recoverPassword = .recover
            }, label: {
                VStack(spacing: 10, content: {
                    Text("¿No recuerdas tu contraseña?")
                    Text("Pulsa aquí para resetear tu contraseña")
                        .bold()
                        .underline()
                })
            })
            .padding(.bottom,20)
            .padding(.horizontal,20)
            .multilineTextAlignment(.center)
        }
//        .sheet(item: $recoverPassword, content: { _ in
//            RecoverPasswordView()
//        })
//    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView()
//        LoginEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
