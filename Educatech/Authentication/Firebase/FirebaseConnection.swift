//
//  FirebaseConnection.swift
//  Educatech
//
//  Created by Martín Antonio on 18/5/23.
//

import Foundation
import FirebaseAuth
import SwiftUI

struct FirebaseConnection {
    
    private let firebaseAuth = Auth.auth()
     
    // New user register
    func registerNewEmail(user: UserModel, completionBlock: @escaping (ValidationResponse) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, error in
            //In case of success -> Register and go to next View
            if let _ = result, error == nil {
                completionBlock(ValidationResponse(title: Text(LocalizedStringKey("CONNECTION_GRANTED")), message: Text(LocalizedStringKey("CONNECTION_GRANTED")), response: true, alert: false))
            }
            //In case of error -> Alert
            else {
                completionBlock(ValidationResponse(title: Text(LocalizedStringKey("ERROR_SIGNUP")), message: Text(LocalizedStringKey("USER_ALREADY_EXISTS")), response: false, alert: true))
            }
        }
    }
    
    // Login with existing email
    func loginWithEmail(user: UserModel, completionBlock: @escaping (ValidationResponse) -> Void) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, error in
            //In case of success -> Register and go to next View
            if let _ = result, error == nil {
                completionBlock(ValidationResponse(title: Text(LocalizedStringKey("CONNECTION_GRANTED")), message: Text(LocalizedStringKey("CONNECTION_GRANTED")), response: true, alert: false))
            }
            //In case of error -> Alert
            else {
                completionBlock(ValidationResponse(title: Text(LocalizedStringKey("ERROR_SIGNUP")), message: Text(LocalizedStringKey("USER_ALREADY_EXISTS")), response: false, alert: true))
            }
        }
    }
}
