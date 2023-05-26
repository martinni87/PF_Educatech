//
//  FirebaseConnection.swift
//  Educatech
//
//  Created by Martín Antonio on 18/5/23.
//

import Foundation
import FirebaseAuth

struct FirebaseConnection {
    
    // New user register
    func signUpNewUser(user: UserModel) -> LogStatus {
        var result = LogStatus.noError
        Auth.auth().createUser(withEmail: user.email, password: user.password) { _,error in
            if let _ = error {
                result = .serverRegistrationError
            }
        }
        return result
    }
    
    // Login existing user
    
    
    
//    func signupNewUser(user: UserModel) -> RegisterStatus) {
//        Auth.auth().createUser(withEmail: user.email, password: user.password) { _, error in
//            if let _ = error {
////                print("Error creating new user \(error.localizedDescription)")
////                completion(.failure(error))
//                return RegisterStatus.serverRegistrationError
//            }
////            print("New user with email \(user.email)")
////            completion(.success(UserModel(firstName: user.firstName, lastName: user.lastName, email: user.email, password: user.password, passwordCheck: user.passwordCheck, isLoggedIn: true, userRole: .student)))
//        }
//        return RegisterStatus.noError
//    }
//
//    func getResponse(user: UserModel) {
//        self.signupNewUser(user: user) { response in
//            switch response {
//            case .success:
//                self.messageError = .noError
//            case .failure:
//                self.messageError = .serverRegistrationError
//            }
//        }
//    }
}
