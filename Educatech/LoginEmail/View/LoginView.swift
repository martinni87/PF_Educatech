//
//  LoginView.swift
//  E-Learning
//
//  Created by Martín Antonio on 13/5/23.
//

import SwiftUI

struct LoginView: View {
    
//    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var email: String = ""
    @State var password: String = ""
    @State var action: EmailOption?
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    
    var body: some View {
        VStack{
            Text("Login with email")
        }
        //Method viewOrientation is an custom made extension for View Object in SwiftUI Package Library to handle orientation in layout
//        self.viewOrientation(viewContext: .loginView, vertical: verticalSizeClass ?? .regular, horizontal: horizontalSizeClass ?? .compact,orientation: action)
//        .sheet(item: $action) { action in
//            LoginEmailController().selectView(for: action)
//        }

//        VStack(alignment: .center, spacing: 30) {
//            Spacer()
//            Group {
//                Text(LocalizedStringKey("WELCOME"))
//                    .font(.largeTitle)
//                .bold()
//
//                Text(LocalizedStringKey("LOGIN_INDICATIONS"))
//                    .font(.subheadline)
//                    .bold()
//                    .foregroundColor(.gray)
//            }
//            .multilineTextAlignment(.center)
//            .padding(.horizontal, 20)
//
//            TextField(LocalizedStringKey("ENTER_EMAIL"), text: $email)
//                .padding(.horizontal, 20)
//                .textFieldStyle(.roundedBorder)
//                .tint(.mint)
//
//            SecureField(LocalizedStringKey("ENTER_PASSWORD"), text: $password)
//                .padding(.horizontal, 20)
//                .textFieldStyle(.roundedBorder)
//                .tint(.mint)
//
//            Button(action: {
//                action = .resetPassword
//            }) {
//                VStack(spacing: 10) {
//                    Text(LocalizedStringKey("FORGOT_PASSWORD_1"))
//                    Text(LocalizedStringKey("FORGOT_PASSWORD_2"))
//                        .bold()
//                        .underline()
//                }
//            }
//            .padding(.bottom,20)
//            .padding(.horizontal,20)
//            .multilineTextAlignment(.center)
//
//            Button(LocalizedStringKey("LOGIN_BUTTON"), action: {
//                action = .signIn
//            })
//            .padding()
//            .buttonStyle(.bordered)
//            .tint(.mint)
//
//
//            Spacer()
//
//            Button(action: {
//                action = .register
//            }) {
//                VStack(spacing: 10) {
//                    Text(LocalizedStringKey("LOGIN_MESSAGE"))
//                    Text(LocalizedStringKey("ASK_FOR_SIGNUP"))
//                        .bold()
//                        .underline()
//                }
//            }
//            .padding(.bottom,20)
//            .padding(.horizontal,20)
//            .multilineTextAlignment(.center)
//        }
//        .sheet(item: $action) { action in
//            LoginEmailController().selectView(for: action)
//        }
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
//        LoginEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
