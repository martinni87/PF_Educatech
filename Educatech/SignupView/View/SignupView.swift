//
//  RegisterEmailView.swift
//  E-Learning
//
//  Created by Martín Antonio on 15/5/23.
//

import SwiftUI

struct SignupView: View {
    
//    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    //MARK: Environment variables to evaluate wether device is in horizontal mode or vertical mode
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    //MARK: Environment variable to dismiss views
    @Environment(\.dismiss) var dismiss
    
    //MARK: State variables to pass through lower layers of code (Bindings)
    @State var user = UserModel()
    @State var validationResponse = ValidationResponse()
    
    var body: some View {
        NavigationView{
            VStack {
                //For vertical compact: Landscape
                if verticalSizeClass == .compact {
                    SignupViewLandscapeMode(user: $user, validationResponse: $validationResponse)
                }
                //For horizontal compact: Portrait
                else if horizontalSizeClass == .compact {
                    SignupViewLandscapeMode(user: $user, validationResponse: $validationResponse)
                }
            }
            .fullScreenCover(isPresented: $validationResponse.response) {
                HomeView(user: $user, loginSuccessful: $validationResponse.response)
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
