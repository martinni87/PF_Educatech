//
//  SignupViewElements.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI



struct SignupViewElements {
    
    @Binding var user: UserModel
    @Binding var formStatus: RegisterStatus
    
    @ViewBuilder func drawInstructionsText() -> some View {
        Text("FILL_FORM_INSTRUCTIONS")
    }
    
    @ViewBuilder func drawTextField(type: CustomTextFieldTypes) -> some View{
        switch type {
        case .firstName:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_FIRSTNAME"), text: $user.firstName)
                .onTapGesture {
                    formStatus = .noData
                }
                .padding(5)
                .border((formStatus == .firstNameEmpty) ? .pink : .clear)
                .shadow(color: (formStatus == .firstNameEmpty) ? .red : .clear, radius: 5, x: 0, y: 0)
        case .lastName:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_LASTNAME"), text: $user.lastName)
                .onTapGesture {
                    formStatus = .noData
                }
                .padding(5)
                .border((formStatus == .lastNameEmpty) ? .pink : .clear)
                .shadow(color: (formStatus == .lastNameEmpty) ? .red : .clear, radius: 5, x: 0, y: 0)
        case .email:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_EMAIL"), text: $user.email)
                .onTapGesture {
                    formStatus = .noData
                }
                .padding(5)
                .border((formStatus == .emailEmpty || formStatus == .emailSyntaxError) ? .pink : .clear)
                .shadow(color: (formStatus == .emailEmpty || formStatus == .emailSyntaxError) ? .red : .clear, radius: 5, x: 0, y: 0)
        case .password:
            SecureField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_PASSWORD1"), text: $user.password)
                .onTapGesture {
                    formStatus = .noData
                }
                .padding(5)
                .border((formStatus == .passwordEmpty || formStatus == .passwordSyntaxError) ? .pink : .clear)
                .shadow(color: (formStatus == .passwordEmpty || formStatus == .passwordSyntaxError) ? .red : .clear, radius: 5, x: 0, y: 0)
        case .passwordCheck:
            SecureField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_PASSWORD2"), text: $user.passwordCheck)
                .onTapGesture {
                    formStatus = .noData
                }
                .padding(5)
                .border((formStatus == .passwordCheckEmpty || formStatus == .passwordNoMatchError) ? .pink : .clear)
                .shadow(color: (formStatus == .passwordCheckEmpty || formStatus == .passwordNoMatchError) ? .red : .clear, radius: 5, x: 0, y: 0)
        }
    }
    
    @ViewBuilder func drawButton(type: SignupButtonTypes) -> some View {
        switch type {
        case .submit:
            Button(action: {
                formStatus = SignupController().validateForm(user: user, actionType: .submit)
                if formStatus == .noError {
                    SignupController().sendData(user: user)
                    user.userRole = .student
                    user.isLoggedIn = true
                }
            }) {
                Label(LocalizedStringKey("CREATE_NEW_USER_BUTTON"), systemImage: "checkmark.circle")
                    .frame(maxWidth: .infinity)
                    .bold()
            }
            .tint(.mint)
            .buttonStyle(.bordered)
            .controlSize(.large)
        case .reset:
            Button(action: {
                formStatus = SignupController().validateForm(user: user, actionType: .reset)
                user.firstName = ""
                user.lastName = ""
                user.email = ""
                user.password = ""
                user.passwordCheck = ""
                user.isLoggedIn = false
                user.userRole = .notDefined
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
