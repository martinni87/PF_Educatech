//
//  SignupController.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI

enum SignupButtonTypes {
    case submit
    case reset
}

enum LogStatus: String, Identifiable {
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
    case noData
    
    //To conform Identifiable protocol
    var id: String {
        return rawValue
    }
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
    
    private func validatePersonalData(user: UserModel) -> LogStatus {
        //All fields completed check
        if user.firstName.isEmpty {
            return .firstNameEmpty
        }
        if user.lastName.isEmpty {
            return .lastNameEmpty
        }
        return .noError
    }
    
    private func validateCredentials(user: UserModel) -> LogStatus {
        //All fields completed check
        if user.email.isEmpty {
            return .emailEmpty
        }
        if user.password.isEmpty {
            return .passwordEmpty
        }
        if user.passwordCheck.isEmpty {
            return .passwordCheckEmpty
        }
        //Syntax check
        if !validEmailSyntax(email: user.email) {
            return .emailSyntaxError
        }
        if !validPasswordSyntax(password: user.password) {
            return .passwordSyntaxError
        }
        //Check localy if password and passwordCheck match
        if user.password != user.passwordCheck {
            return .passwordNoMatchError
        }
        
        // MARK: Result if connection and creation of new user is VALID. Then no error.
        return .noError
    }
    
    func validateForm (user: UserModel, actionType: SignupButtonTypes) -> LogStatus {
        switch actionType {
        case .submit:
            if validatePersonalData(user: user) == .noError {
                return validateCredentials(user: user)
            }
            else {
                return validatePersonalData(user: user)
            }
        case .reset:
            return .noData
        }
    }
    
    func sendData(user: UserModel) -> LogStatus {
        // MARK: if all previous validations are OK, then try to create new user. Call to firebase for new signup with current credentials
        if FirebaseConnection().signUpNewUser(user: user) == .serverRegistrationError {
            return .serverRegistrationError //Result if connection fails
        }
        return .noError
    }
}
