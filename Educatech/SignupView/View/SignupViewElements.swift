//
//  SignupViewElements.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI



struct SignupViewElements {
    
    @Binding var user: UserModel
    @Binding var registrationStatus: LogStatus?
    
    @ViewBuilder func drawInstructionsText() -> some View {
        Text("FILL_FORM_INSTRUCTIONS")
    }
    
    @ViewBuilder func drawTextField(type: CustomTextFieldTypes) -> some View{
        switch type {
        case .firstName:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_FIRSTNAME"), text: $user.firstName)
                .onTapGesture {
                    registrationStatus = .noData
                }
                .padding(5)
                .border((registrationStatus == .firstNameEmpty) ? .pink : .clear)
                .shadow(color: (registrationStatus == .firstNameEmpty) ? .red : .clear, radius: 5, x: 0, y: 0)
        case .lastName:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_LASTNAME"), text: $user.lastName)
                .onTapGesture {
                    registrationStatus = .noData
                }
                .padding(5)
                .border((registrationStatus == .lastNameEmpty) ? .pink : .clear)
                .shadow(color: (registrationStatus == .lastNameEmpty) ? .red : .clear, radius: 5, x: 0, y: 0)
        case .email:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_EMAIL"), text: $user.email)
                .onTapGesture {
                    registrationStatus = .noData
                }
                .padding(5)
                .border((registrationStatus == .emailEmpty || registrationStatus == .emailSyntaxError) ? .pink : .clear)
                .shadow(color: (registrationStatus == .emailEmpty || registrationStatus == .emailSyntaxError) ? .red : .clear, radius: 5, x: 0, y: 0)
        case .password:
            SecureField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_PASSWORD1"), text: $user.password)
                .onTapGesture {
                    registrationStatus = .noData
                }
                .padding(5)
                .border((registrationStatus == .passwordEmpty || registrationStatus == .passwordSyntaxError) ? .pink : .clear)
                .shadow(color: (registrationStatus == .passwordEmpty || registrationStatus == .passwordSyntaxError) ? .red : .clear, radius: 5, x: 0, y: 0)
        case .passwordCheck:
            SecureField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_PASSWORD2"), text: $user.passwordCheck)
                .onTapGesture {
                    registrationStatus = .noData
                }
                .padding(5)
                .border((registrationStatus == .passwordCheckEmpty || registrationStatus == .passwordNoMatchError) ? .pink : .clear)
                .shadow(color: (registrationStatus == .passwordCheckEmpty || registrationStatus == .passwordNoMatchError) ? .red : .clear, radius: 5, x: 0, y: 0)
        }
    }
    
    @ViewBuilder func drawButton(type: SignupButtonTypes) -> some View {
        switch type {
        case .submit:
            Button(action: {
                registrationStatus = SignupController().validateForm(user: user, actionType: .submit)
                if registrationStatus == .noError {
                    if SignupController().sendData(user: user) == .noError {
                        //MARK: UPDATE DATABASE
                        user.isLoggedIn = true
                        user.userRole = .student
                        self.user = user
                        registrationStatus = .noError
                    }
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
                registrationStatus = SignupController().validateForm(user: user, actionType: .reset)
                user = UserModel() //Variable user equals new empty instance of UseModel
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
