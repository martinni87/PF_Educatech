//
//  EditProfile.swift
//  Educatech
//
//  Created by Martín Antonio on 31/5/23.
//

import SwiftUI

struct EditProfile: View {
    
    @State var user: UserModel = UserModel()
    @State var level = "Aprendiz"
    
    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    Section(LocalizedStringKey("FORM_SECTION_PERSONAL")){
                        TextField("First name",text: $user.firstName)
                        TextField("Last name",text: $user.lastName)
                    }
                    Section(LocalizedStringKey("FORM_SECTION_CREDENTIALS")){
                        TextField("email",text: $user.email)
                        TextField("password",text: $user.password)
                        TextField("Repeat password", text: $user.passwordCheck)
                    }
                }
                Text("Si quieres convertirte en profesor contacta por email con info@educatech.com y nos pondremos en contacto contigo.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding()
                HStack {
                    Button("Guardar"){
                        print("Guardando datos")
//                            FirebaseConnection().saveToDataBase(user: user)
                    }
                    Button("Limpiar"){
                        print("Limpiando datos")
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 30)
                .padding()
            }
            .navigationTitle(Text("Edit profile"))
        }
        .padding(.top, 20)
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
