//
//  SignupController.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import SwiftUI

enum CustomTextFieldTypes {
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

enum RegisterStatus {
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
    
    private func validatePersonalData(user: UserModel) -> RegisterStatus {
        //All fields completed check
        if user.firstName.isEmpty {
            return .firstNameEmpty
        }
        if user.lastName.isEmpty {
            return .lastNameEmpty
        }
        return .noError
    }
    
    private func validateCredentials(user: UserModel) -> RegisterStatus {
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
        
        // MARK: Write new code here to access server, get a TOKEN and return false if it's incorrect or true if it's correct
//        var serverToken = ""
//        guard serverToken == "OK" else { return .serverRegistrationError}
        FirebaseAuth().signupNewUser(user: user)
        return .noError
    }
    
    func validateForm (user: UserModel, actionType: SignupButtonTypes) -> RegisterStatus {
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
    
    func sendData(user: UserModel){
        //TODO Function to send data to firebase
    }
}
