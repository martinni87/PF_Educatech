//
//  SignupViewElements.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI

struct SignupViewElements {
    
    @Binding var user: UserModel
    @Binding var validationResponse: ValidationResponse
    
    @ViewBuilder func drawInstructionsText() -> some View {
        Text("FILL_FORM_INSTRUCTIONS")
    }
    
    @ViewBuilder func drawTextField(type: TextFieldTypes) -> some View{
        switch type {
        case .firstName:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_FIRSTNAME"), text: $user.firstName)
        case .lastName:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_LASTNAME"), text: $user.lastName)
        case .email:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_EMAIL"), text: $user.email)
        case .password:
            SecureField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_PASSWORD1"), text: $user.password)
        case .passwordCheck:
            SecureField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_PASSWORD2"), text: $user.passwordCheck)
        }
    }
    
    @ViewBuilder func drawButton(type: ButtonTypes) -> some View {
        if type == .submit {
            Button(action: {
                SignupController(user: $user).actionButton(actionType: .submit){ response in
                    validationResponse = response
                }
            }) {
                Label(LocalizedStringKey("CREATE_NEW_USER_BUTTON"), systemImage: "checkmark.circle")
                    .frame(maxWidth: .infinity)
                    .bold()
            }
            .tint(.mint)
            .buttonStyle(.bordered)
            .controlSize(.large)
            .alert(isPresented: $validationResponse.alert){
                Alert(
                    title: validationResponse.title,
                    message: validationResponse.message,
                    dismissButton: .default(Text(LocalizedStringKey("OK_BUTTON"))))
            }
        }
        else if type == .reset {
            Button(action: {
                SignupController(user: $user).actionButton(actionType: .reset){ response in
                    validationResponse = response
                }
            }) {
                Label(LocalizedStringKey("RESET_BUTTON"), systemImage: "trash.circle")
                    .frame(maxWidth: .infinity)
                    .bold()
            }
            .tint(.pink)
            .buttonStyle(.bordered)
            .controlSize(.large)
        }
    }
}
