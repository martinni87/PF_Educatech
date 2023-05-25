////
////  FirebaseConnectionRepository.swift
////  Educatech
////
////  Created by Martín Antonio on 24/5/23.
////
//
//import Foundation
//
//class FirebaseConnectionController {
//
//    var messageError: RegisterStatus
//
//    init (){
//        messageError = .noError
//    }
//
//    func signupNewUser(user: UserModel) {
//        FirebaseConnectionDataSource().signupNewUser(user: user) { response in
//            switch response {
//            case .success:
//                self.messageError = .noError
//            case .failure:
//                self.messageError = .serverRegistrationError
//            }
//        }
//    }
//}
