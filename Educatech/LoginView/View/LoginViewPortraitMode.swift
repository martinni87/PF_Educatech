//
//  LoginViewPortraitMode.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct LoginViewPortraitMode: View {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var option: EmailOption?
    @Binding var showAlert: Bool
    
    var body: some View {
        
        let loginViewElements = LoginViewElements(email: $email, password: $password, option: $option, showAlert: $showAlert)
        
        VStack (spacing:30){
            Spacer()
            
            loginViewElements.drawTitleAndIndications()
                .padding()
            Spacer()
            
            loginViewElements.drawTextField()
            loginViewElements.drawSecureTextField()
            loginViewElements.drawForgotButton()
            loginViewElements.drawSignInButton()

            Spacer()
            loginViewElements.drawSignUpButton()
        }
        .padding(.horizontal,30)
    }
}

struct LoginViewPortraitMode_Previews: PreviewProvider {
    
    @State static var email: String = ""
    @State static var password: String = ""
    @State static var option: EmailOption?
    @State static var showAlert: Bool = false
    
    static var previews: some View {
        LoginViewPortraitMode(email: $email, password: $password, option: $option, showAlert: $showAlert)
    }
}
