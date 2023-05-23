//
//  SignupViewElements.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI



struct SignupViewElements {
    
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordCheck: String
    
    @ViewBuilder func drawTextField(type: SignupTextFieldTypes) -> some View{
        switch type {
        case .firstName:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_FIRSTNAME"), text: $firstName)
        case .lastName:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_LASTNAME"), text: $lastName)
        case .email:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_EMAIL"), text: $email)
        case .password:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_PASSWORD1"), text: $password)
        case .passwordCheck:
            TextField(LocalizedStringKey("TEXTFIELD_PLACEHOLDER_PASSWORD2"), text: $passwordCheck)
        }
    }
    
    @ViewBuilder func drawButton(type: SignupButtonTypes) -> some View {
        switch type {
        case .submit:
            Button(action: {
                guard SignupController().validateForm(actionType: .submit) else {
                    print("Error")
                    return
                }
                print("Sending data")
            }) {
                Label(LocalizedStringKey("CREATE_NEW_USER_BUTTON"), systemImage: "checkmark.circle")
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
        case .reset:
            Button(action: {
                guard SignupController().validateForm(actionType: .reset) else {
                    print("Error")
                    return
                }
                print("Erasing data")
            }) {
                Label(LocalizedStringKey("RESET_BUTTON"), systemImage: "trash.circle")
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
    }
    
}

//func elements(){
//    VStack(alignment: .center, spacing: 30){
////            DismissView()
////                .padding(20)
//        Group {
//            Text("Nuevo usuario")
//                .font(.largeTitle)
//            .bold()
//
//            Text("Rellena los campos siguientes para registrar un nuevo usuario utilizando tu e-mail habitual y una contraseña.")
//                .font(.subheadline)
//                .bold()
//                .foregroundColor(.gray)
//        }
//        .multilineTextAlignment(.center)
//
//        .padding(.horizontal, 20)
//
//        Form {
//            Section("Datos personales") {
//                TextField("Nombre", text: $firstName)
//                    .tint(.mint)
//                TextField("Apellidos", text: $lastName)
//                    .tint(.mint)
//                TextField("Edad", text: $userAge)
//                    .tint(.mint)
//            }
//
//            Section("Datos de acceso") {
//                TextField("Introduce un e-mail válido", text: $email)
//                    .tint(.mint)
//
//                SecureField("Introduce una nueva contraseña", text: $password)
//                    .tint(.mint)
//
//                SecureField("Repite la contraseña", text: $repeatPassword)
//                    .tint(.mint)
//            }
//        }
//
//
//        HStack {
//            Button (action: {
//                print("Registrar")
////                    authenticationViewModel.createNewUser(email: email, password: password)
//            }, label: {
//                Label("Registrar", systemImage: "person.fill.checkmark")
//            })
//            .padding()
//            .buttonStyle(.bordered)
//            .tint(.mint)
//
//            Button (action: {
//                print("Limpiar")
//            }, label: {
//                Label("Limpiar", systemImage: "trash.fill")
//            })
//            .padding()
//            .buttonStyle(.bordered)
//            .tint(.purple)
//        }
//
////            if let messageError = authenticationViewModel.messageError {
////                Text(messageError)
////                    .bold()
////                    .font(.body)
////                    .foregroundColor(.red)
////                    .padding(20)
//    }
//    .padding(.top, 30)
//}
