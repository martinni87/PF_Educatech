//
//  SignupViewLandscapeMode.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI

struct SignupViewLandscapeMode: View {
    
    @Binding var user: UserModel
    @Binding var formStatus: RegisterStatus
    
    var body: some View {
        
        let signupViewElements = SignupViewElements(user: $user, formStatus: $formStatus)
        
        NavigationStack{
            Spacer()
            VStack {
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
                HStack {
                    signupViewElements.drawButton(type: .submit)
                    signupViewElements.drawButton(type: .reset)
                }
                .frame(maxWidth: .infinity, minHeight: 30)
                .padding()
            }
            .navigationTitle(LocalizedStringKey("NEW_REGISTER_FORM_TITLE"))
            Spacer()
        }
    }
}

struct SignupViewLandscapeMode_Previews: PreviewProvider {
    
    @State static var user = UserModel()
    @State static var formStatus = RegisterStatus.noData
    
    static var previews: some View {
        SignupViewLandscapeMode(user: $user, formStatus: $formStatus)
    }
}
