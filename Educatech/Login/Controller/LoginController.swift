//
//  LoginController.swift
//  Educatech
//
//  Created by Martín Antonio on 21/5/23.
//

import SwiftUI

struct LoginController {

    // Method to show different views based on the selected option
    func selectView(for option: LoginOption) -> AnyView{
        switch option {
        case .emailLogin:
            return AnyView(LoginEmailView())
        case .facebook:
            return AnyView(Text("facebook"))
        case .google:
            return AnyView(Text("google"))
        case .apple:
            return AnyView(Text("apple"))
        case .register:
            return AnyView(SignUpEmailView())
        case .lost:
            return AnyView(Text("lost"))
        case .empty:
            return AnyView(Text("Just for developer: If you see this screen, there's an error! ⚠️"))
        }
    }
}
