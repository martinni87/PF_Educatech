//
//  LoginViewController.swift
//  Educatech
//
//  Created by Martín Antonio on 21/5/23.
//

import SwiftUI

//enum LoginValidationResponse: String, Identifiable {
//    case success
//    case fail
//
//    //To conform Identifiable protocol
//    var id: String {
//        return rawValue
//    }
//}

struct LoginViewController {
    
    private func validateLocalCredentials(email: String, password: String) -> Bool {
        //Syntax check
        if !CommonValidations().validEmailSyntax(email: email) {
            return false
        }
        if !CommonValidations().validPasswordSyntax(password: password) {
            return false
        }
        return true
    }
    
    private func validateServerCredentials(email: String, password: String) -> Bool {
        // MARK: TODO -> Write new code here to access server, get a TOKEN and return false if it's incorrect or true if it's correct
        return true
    }
    
    // MARK: Method to show different views based on the selected option
    public func loginAttempt(email: String, password: String) -> Bool {
        if !validateLocalCredentials(email: email, password: password) {
            print("Local credentials fail")
            return false
        }
        if !validateServerCredentials(email: email, password: password) {
            print("Server credentials fail")
            return false
        }
         print("login attempt success")
        return true
    }
}
