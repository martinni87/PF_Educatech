//
//  LoginEmailController.swift
//  Educatech
//
//  Created by Martín Antonio on 21/5/23.
//

import SwiftUI

enum EmailOption: String, Identifiable {
    case signIn
    case resetPassword
    case register
    
    //To conform Identifiable protocol
    var id: String {
        return rawValue
    }
}

struct LoginEmailController {
    
    // MARK: Validate Email Syntax: uses the regular expresion to check if it's a valid email format.
    // Returns 'true' for valid email, otherwise 'false'
    private func validEmailSyntax(email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
   
    // MARK: Validate Password Syntax: uses regular expression to check if it's a valid password format.
    // Returns 'true' for valid email, otherwise 'false'
    private func validPasswordSyntax(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$" // 8 characters, 1 number, 1 letter, any place
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
}
    private func validateCredentials(email: String, password: String) -> Text{
        
        if !validEmailSyntax(email: email){
            return Text("Email syntax not valid")
        }

        if !validPasswordSyntax(password: password){
            return Text("Password syntax not valid")
        }
        
        return Text("Everything is good! 🍀")
    }
    
    // MARK: Method to show different views based on the selected option
    public func selectView(for action: EmailOption) -> AnyView{
        switch action {
        case .signIn:
            return AnyView(HomeView())
        case .resetPassword:
            return AnyView(Text("Reset Password"))
        case .register:
            return AnyView(SignUpEmailView())
        }
        
    }
    
}
