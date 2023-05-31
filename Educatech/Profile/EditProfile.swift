//
//  EditProfile.swift
//  Educatech
//
//  Created by Martín Antonio on 31/5/23.
//

import SwiftUI

struct EditProfile: View {
    
    @State var user: UserModel = UserModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    Section(LocalizedStringKey("FORM_SECTION_PERSONAL")){
                        TextField("First name",text: $user.firstName)
                        TextField("Last name",text: $user.lastName)
        //                TextField("Role", text: $user.userRole)
                    }
                    Section(LocalizedStringKey("FORM_SECTION_CREDENTIALS")){
                        TextField("email",text: $user.email)
                        TextField("password",text: $user.password)
                        TextField("Repeat password", text: $user.passwordCheck)
                    }
                    HStack {
                        Button("Guardar"){
                            print("Guardando datos")
                        }
                        Button("Limpiar"){
                            print("Limpiando datos")
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 30)
                    .padding()
                }
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
