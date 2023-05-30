//
//  SignupController.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI

struct SignupController {
    
    @Binding var user: UserModel
    
    private func validateCredentials(completionBlock: @escaping (ValidationResponse) -> Void) {
        //All fields completed check
        if user.email.isEmpty || user.password.isEmpty || user.passwordCheck.isEmpty {
            completionBlock(ValidationResponse(title: Text(LocalizedStringKey("ERROR_SIGNUP")), message: Text(LocalizedStringKey("ALL_FIELDS_MANDATORY")), response: false, alert: true))
        }
        //Syntax check email
        else if !CommonValidations().validEmailSyntax(email: user.email) {
            completionBlock(ValidationResponse(title: Text(LocalizedStringKey("ERROR_SIGNUP")), message: Text(LocalizedStringKey("WRONG_EMAIL_FORMAT")), response: false, alert: true))
        }
        //Syntax check password
        else if !CommonValidations().validPasswordSyntax(password: user.password) {
            completionBlock(ValidationResponse(title: Text(LocalizedStringKey("ERROR_SIGNUP")), message: Text(LocalizedStringKey("WRONG_PASSWORD_FORMAT")), response: false, alert: true))
        }
        //Check password match
        else if user.password != user.passwordCheck {
            completionBlock(ValidationResponse(title: Text(LocalizedStringKey("ERROR_SIGNUP")), message: Text(LocalizedStringKey("WRONG_PASSWORD_MATCH")), response: false, alert: true))
        }
        //If previous checks are ok, then attempt to sign up new user
        else {
            FirebaseConnection().registerNewEmail(user: user) { result in
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
        else if actionType == .reset {
            user = UserModel() //Reset user data in form
            completionBlock(ValidationResponse(title: Text(""), message: Text(""), response: false, alert: false))
        }
    }
}
