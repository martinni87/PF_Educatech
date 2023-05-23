//
//  SignupViewPortraitMode.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI

struct SignupViewPortraitMode: View {
    
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordCheck: String
    
    var body: some View {
        
        let signupViewElements = SignupViewElements(firstName: $firstName, lastName: $lastName, email: $email, password: $password, passwordCheck: $passwordCheck)
        
        NavigationStack {
            Spacer()
            Form {
                Section(LocalizedStringKey("FORM_SECTION_PERSONAL")){
                    signupViewElements.drawTextField(type: .firstName)
                    signupViewElements.drawTextField(type: .lastName)
                }
                Section(LocalizedStringKey("FORM_SECTION_CREDENTIALS")){
                    signupViewElements.drawTextField(type: .email)
                    signupViewElements.drawTextField(type: .password)
                    signupViewElements.drawTextField(type: .passwordCheck)
                }
            }
            .navigationTitle(LocalizedStringKey("NEW_REGISTER_FORM_TITLE"))
            Spacer()
            HStack {
                signupViewElements.drawButton(type: .submit)
                signupViewElements.drawButton(type: .reset)
            }
            .padding()
            Spacer()
        }
    }
}

struct SignupViewPortraitMode_Previews: PreviewProvider {
    
    @State static var firstName: String = ""
    @State static var lastName: String = ""
    @State static var email: String = ""
    @State static var password: String = ""
    @State static var passwordCheck: String = ""
    
    static var previews: some View {
        SignupViewPortraitMode(firstName: $firstName, lastName: $lastName, email: $email, password: $password, passwordCheck: $passwordCheck)
    }
}
