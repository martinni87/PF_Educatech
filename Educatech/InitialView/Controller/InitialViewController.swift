//
//  LoginController.swift
//  Educatech
//
//  Created by Martín Antonio on 21/5/23.
//

import SwiftUI

enum InitOption: String, Identifiable {
    case email
    case facebook
    case google
    case apple
    
    //To conform Identifiable protocol
    var id: String {
        return rawValue
    }
}

struct InitialViewController {

    // Method to show different views based on the selected option
    @ViewBuilder func selectView(for option: InitOption) -> some View{
        switch option {
        case .email:
            LoginView()
        case .facebook:
            Text("facebook")
        case .google:
            Text("google")
        case .apple:
            Text("apple")
        }
    }
}


