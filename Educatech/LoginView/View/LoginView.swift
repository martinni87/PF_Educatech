//
//  LoginView.swift
//  E-Learning
//
//  Created by Martín Antonio on 13/5/23.
//

import SwiftUI
import UIKit

struct LoginView: View {
    
    //MARK: Environment variables to evaluate wether device is in horizontal mode or vertical mode
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    //MARK: Environment variable to dismiss views
    @Environment(\.dismiss) var dismiss
    
    //MARK: State variables to pass through lower layers of code (Bindings)
    @State var user = UserModel()
    @State var validationResponse = ValidationResponse()
    
    var body: some View {
        
        NavigationView {
            VStack {
                //For vertical compact: Landscape
                if verticalSizeClass == .compact && !validationResponse.response{
                    LoginViewLandscapeMode(user: $user, validationResponse: $validationResponse)
                }
                //For horizontal compact: Portrait
                else if horizontalSizeClass == .compact && !validationResponse.response{
                    LoginViewPortraitMode(user: $user, validationResponse: $validationResponse)
                }
            }
            .fullScreenCover(isPresented: $validationResponse.response) {
                HomeView(user: $user, loginSuccessful: $validationResponse.response)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        dismiss()
                    }) {
                        Label("", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                })
            }
        }
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
