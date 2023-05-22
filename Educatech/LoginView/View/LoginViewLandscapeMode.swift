//
//  LoginViewLandscapeMode.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct LoginViewLandscapeMode: View {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var option: EmailOption?
    
    var body: some View {
        
        let loginViewElements = LoginViewElements(email: $email, password: $password, option: $option)
        
        VStack (spacing:30){
            Spacer()
            
            loginViewElements.drawTitleAndIndications()
                .padding()
            Spacer()
            
            HStack {
                VStack {
                    loginViewElements.drawTextField()
                    loginViewElements.drawSecureTextField()
                }
                VStack {
                    
                    loginViewElements.drawSignInButton()
                }
            }

            HStack{
                loginViewElements.drawForgotButton()
                    .padding()
                loginViewElements.drawSignUpButton()
            }
            Spacer()
        }
        .padding(.horizontal,30)
    }
}

struct LoginViewLandscapeMode_Previews: PreviewProvider {
    
    @State static var email: String = ""
    @State static var password: String = ""
    @State static var option: EmailOption?
    
    static var previews: some View {
        LoginViewLandscapeMode(email: $email, password: $password, option: $option)
    }
}
