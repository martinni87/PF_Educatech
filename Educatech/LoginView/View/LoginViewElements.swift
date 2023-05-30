//
//  LoginViewElements.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct LoginViewElements {
    
    @Binding var user: UserModel
    @Binding var validationResponse: ValidationResponse
    
    @ViewBuilder func drawTitleAndIndications() -> some View{
        VStack {
            Text(LocalizedStringKey("WELCOME"))
                .font(.largeTitle)
            .bold()
            .padding(.bottom,20)

            Text(LocalizedStringKey("LOGIN_INDICATIONS"))
                .font(.subheadline)
                .bold()
                .foregroundColor(.gray)
        }
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder func drawTextField(type: TextFieldTypes) -> some View{
        if type == .email {
            TextField(LocalizedStringKey("ENTER_EMAIL"), text: $user.email)
                .padding(.horizontal, 20)
                .textFieldStyle(.roundedBorder)
                .tint(.mint)
        }
        else if type == .password {
            SecureField(LocalizedStringKey("ENTER_PASSWORD"), text: $user.password)
                .padding(.horizontal, 20)
                .textFieldStyle(.roundedBorder)
                .tint(.mint)
        }
    }
    
    @ViewBuilder func drawSignInButton()  -> some View {
        Button(LocalizedStringKey("LOGIN_BUTTON"), action: {
            LoginViewController(user: $user).actionButton(actionType: .submit){ response in
                validationResponse = response
            }
        })
        .padding()
        .buttonStyle(.bordered)
        .tint(.mint)
        .alert(isPresented: $validationResponse.alert){
            Alert(
                title: Text(LocalizedStringKey("ERROR_CREDENTIALS")),
                message: Text(LocalizedStringKey("ERROR_CREDENTIALS_MESSAGE")),
                dismissButton: .default(Text(LocalizedStringKey("OK_BUTTON"))))
        }
    }
    
    @ViewBuilder func drawNavigationLink(type: ButtonTypes) -> some View{
        if type == .recoverPassword {
            NavigationLink(destination: {
                //MARK: PENDING RECOVER PASSWORD VIEW
                Text("Recover password view")
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
        else if type == .newRegister {
            NavigationLink(destination: {
                SignupView()
            }) {
                VStack(spacing: 10) {
                    Text(LocalizedStringKey("ASK_FOR_SIGNUP1"))
                    Text(LocalizedStringKey("ASK_FOR_SIGNUP2"))
                        .bold()
                        .underline()
                }
            }
            .padding(.bottom,20)
            .padding(.horizontal,20)
            .multilineTextAlignment(.center)
        }
        
        

    }
}
