//
//  User.swift
//  Educatech
//
//  Created by Martín Antonio on 23/5/23.
//

import Foundation

enum UserRole {
    case student
    case teacher
}

class UserModel {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var passwordCheck: String
    var userRole: UserRole
    
    init(firstName: String, lastName: String,
         email: String, password: String){
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.passwordCheck = ""
        self.userRole = .student
    }
    
    init(){
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.password = ""
        self.passwordCheck = ""
        self.userRole = .student
    }
}
