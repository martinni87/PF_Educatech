//
//  SignupViewPortraitMode.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI

struct SignupViewPortraitMode: View {
    
    @Binding var user: UserModel
    @Binding var validationResponse: ValidationResponse
    
    var body: some View {
        
        let signupViewElements = SignupViewElements(user: $user, validationResponse: $validationResponse)
        
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
            HStack {
                signupViewElements.drawButton(type: .submit)
                signupViewElements.drawButton(type: .reset)
            }
            .frame(maxWidth: .infinity, minHeight: 30)
            .padding()
        }
    }
}

struct SignupViewPortraitMode_Previews: PreviewProvider {
    
    @State static var user = UserModel()
    @State static var validationResponse = ValidationResponse()
    
    static var previews: some View {       
        SignupViewPortraitMode(user: $user, validationResponse: $validationResponse)
    }
}
