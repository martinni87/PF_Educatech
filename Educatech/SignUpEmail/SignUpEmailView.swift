//
//  RegisterEmailView.swift
//  E-Learning
//
//  Created by Martín Antonio on 15/5/23.
//

import SwiftUI

struct SignUpEmailView: View {
    
//    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var userAge: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var repeatPassword: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 30){
//            DismissView()
//                .padding(20)
            Group {
                Text("Nuevo usuario")
                    .font(.largeTitle)
                .bold()
                
                Text("Rellena los campos siguientes para registrar un nuevo usuario utilizando tu e-mail habitual y una contraseña.")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.gray)
            }
            .multilineTextAlignment(.center)

            .padding(.horizontal, 20)

            Form {
                Section("Datos personales") {
                    TextField("Nombre", text: $firstName)
                        .tint(.mint)
                    TextField("Apellidos", text: $lastName)
                        .tint(.mint)
                    TextField("Edad", text: $userAge)
                        .tint(.mint)
                }
                
                Section("Datos de acceso") {
                    TextField("Introduce un e-mail válido", text: $email)
                        .tint(.mint)
                    
                    SecureField("Introduce una nueva contraseña", text: $password)
                        .tint(.mint)
                    
                    SecureField("Repite la contraseña", text: $repeatPassword)
                        .tint(.mint)
                }
            }
            
            
            HStack {
                Button (action: {
                    print("Registrar")
//                    authenticationViewModel.createNewUser(email: email, password: password)
                }, label: {
                    Label("Registrar", systemImage: "person.fill.checkmark")
                })
                .padding()
                .buttonStyle(.bordered)
                .tint(.mint)
                
                Button (action: {
                    print("Limpiar")
                }, label: {
                    Label("Limpiar", systemImage: "trash.fill")
                })
                .padding()
                .buttonStyle(.bordered)
                .tint(.purple)
            }
            
//            if let messageError = authenticationViewModel.messageError {
//                Text(messageError)
//                    .bold()
//                    .font(.body)
//                    .foregroundColor(.red)
//                    .padding(20)
        }
        .padding(.top, 30)
    }
}

struct SignUpEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpEmailView()
//        SignUpEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
