//
//  FirebaseConnection.swift
//  Educatech
//
//  Created by Martín Antonio on 18/5/23.
//

import SwiftUI
import FirebaseAuth

struct FirebaseAuth {
    
    // New user register
    func signupNewUser(user: UserModel, completionBlock: @escaping (Result<UserModel, Error>) -> Void) -> RegisterStatus {
        var status = RegisterStatus.noError
        Auth.auth().createUser(withEmail: user.email, password: user.password) { response, error in
            if let error = error {
                print("Error creating new user \(error.localizedDescription)")
                completionBlock(.failure(error))
                status = .serverRegistrationError
                return
            }
            print("New user with email \(user.email)")
            completionBlock(.success(UserModel(firstName: user.firstName, lastName: user.lastName, email: user.email, password: user.password, passwordCheck: user.passwordCheck, isLoggedIn: user.isLoggedIn, userRole: user.userRole)))
        }
        return status
    }
}
