//
//  SignupController.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI

enum SignupTextFieldTypes {
    case firstName
    case lastName
    case email
    case password
    case passwordCheck
}

enum SignupButtonTypes {
    case submit
    case reset
}

enum ErrorType {
    case firstNameEmpty
    case lastNameEmpty
    case emailEmpty
    case passwordEmpty
    case passwordCheckEmpty
    case emailSyntaxError
    case passwordSyntaxError
    case passwordNoMatchError
    case serverRegistrationError
    case noError
}

struct SignupController {
    
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
    
    private func validatePersonalData(firstName: String, lastName: String) -> ErrorType {
        //All fields completed check
        if firstName.isEmpty {
            return .firstNameEmpty
        }
        if lastName.isEmpty {
            return .lastNameEmpty
        }
        return .noError
    }
    
    private func validateCredentials(email: String, password: String, passwordCheck: String) -> ErrorType {
        //All fields completed check
        if email.isEmpty {
            return .emailEmpty
        }
        if password.isEmpty {
            return .passwordEmpty
        }
        if passwordCheck.isEmpty {
            return .passwordCheckEmpty
        }
        //Syntax check
        if !validEmailSyntax(email: email) {
            return .emailSyntaxError
        }
        if !validPasswordSyntax(password: password) {
            return .passwordSyntaxError
        }
        //Check localy if password and passwordCheck match
        if password != passwordCheck {
            return .passwordNoMatchError
        }
        
        // MARK: Write new code here to access server, get a TOKEN and return false if it's incorrect or true if it's correct
        var serverToken = ""
        guard serverToken == "OK" else { return .serverRegistrationError}
        return .noError
    }
    
    func validateForm (actionType: SignupButtonTypes) -> Bool {
        switch actionType {
        case .submit:
            validatePersonalData(firstName: <#T##String#>, lastName: <#T##String#>)
            return 1 != 1
        case .reset:
            return 1 != 1
        }
    }
}
