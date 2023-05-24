//
//  User.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import Foundation

enum UserRole {
    case notDefined
    case student
    case teacher
    case administrator
}

class UserModel {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var passwordCheck: String
    var isLoggedIn: Bool
    var userRole: UserRole
    
    init(firstName: String, lastName: String,
         email: String, password: String, passwordCheck: String, isLoggedIn: Bool, userRole: UserRole){
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.passwordCheck = passwordCheck
        self.isLoggedIn = isLoggedIn
        self.userRole = userRole
    }
    
    init(){
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.password = ""
        self.passwordCheck = ""
        self.isLoggedIn = false
        self.userRole = .notDefined
    }
}
