//
//  LoginViewController.swift
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

struct LoginViewController {
    
    let commonValidations = CommonValidations()
    
    // MARK: Validate Email Syntax: uses the regular expresion to check if it's a valid email format.
    // Returns 'true' for valid email, otherwise 'false'
    private func validEmailSyntax(email: String) -> Bool {
        commonValidations.validEmailSyntax(email: email)
    }
   
    // MARK: Validate Password Syntax: uses regular expression to check if it's a valid password format.
    // Returns 'true' for valid email, otherwise 'false'
    private func validPasswordSyntax(password: String) -> Bool {
        commonValidations.validPasswordSyntax(password: password)
    }
    
    public func validateCredentials(email: String, password: String) -> Bool {
        
        //Syntax check
        if !validEmailSyntax(email: email) {
            return false
        }
        if !validPasswordSyntax(password: password) {
            return false
        }
        
        //Check token given from server to validate credentials (correct email and password)
        // MARK: Write new code here to access server, get a TOKEN and return false if it's incorrect or true if it's correct
        
        return true
    }
    
    // MARK: Method to show different views based on the selected option
    @ViewBuilder public func selectView(for action: EmailOption) -> some View{
        switch action {
        case .signIn:
            HomeView()
        case .resetPassword:
            Text("Reset Password")
        case .register:
            SignupView()
        }
    }
}
