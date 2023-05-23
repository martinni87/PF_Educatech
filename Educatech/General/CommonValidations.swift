//
//  CommonValidations.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import Foundation

struct CommonValidations {
    
    // MARK: Validate Email Syntax: uses the regular expresion to check if it's a valid email format.
    // Returns 'true' for valid email, otherwise 'false'
    public func validEmailSyntax(email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // MARK: Validate Password Syntax: uses regular expression to check if it's a valid password format.
    // Returns 'true' for valid email, otherwise 'false'
    public func validPasswordSyntax(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$" // 8 characters, 1 number, 1 letter, any place
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
}
