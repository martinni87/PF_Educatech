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
    
    @Binding var user: UserModel
    
    private func validateCredentials(completionBlock: @escaping (ValidationResponse) -> Void) {
        //Syntax check
        if !CommonValidations().validEmailSyntax(email: user.email) {
            completionBlock(ValidationResponse(title: Text(LocalizedStringKey("ERROR_LOGIN")), message: Text(LocalizedStringKey("WRONG_EMAIL_FORMAT")), response: false, alert: true))
        }
        else if !CommonValidations().validPasswordSyntax(password: user.password) {
            completionBlock(ValidationResponse(title: Text(LocalizedStringKey("ERROR_LOGIN")), message: Text(LocalizedStringKey("WRONG_PASSWORD_FORMAT")), response: false, alert: true))
        }
        else {
            FirebaseConnection().loginWithEmail(user: user) { result in
                completionBlock(result)
            }
        }
    }
    
    func actionButton (actionType: ButtonTypes, completionBlock: @escaping (ValidationResponse) -> Void) {
        if actionType == .submit {
            validateCredentials(){ result in
                completionBlock(result)
            }
        }
    }
}
