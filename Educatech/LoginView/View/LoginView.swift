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
    @State var email: String = ""
    @State var password: String = ""
    @State var loginSuccessful: Bool = false
    @State var showAlert: Bool = false
    @State var user = UserModel() //Creates empty user that will be filled with data from firebase
    
    var body: some View {
        
        NavigationView {
            VStack {
                //For vertical compact: Landscape
                if verticalSizeClass == .compact && !loginSuccessful{
                    LoginViewLandscapeMode(email: $email, password: $password, loginSuccessful: $loginSuccessful, showAlert: $showAlert, user: $user)
                }
                //For horizontal compact: Portrait
                else if horizontalSizeClass == .compact && !loginSuccessful{
                    LoginViewPortraitMode(email: $email, password: $password, loginSuccessful: $loginSuccessful, showAlert: $showAlert, user: $user)
                }
            }
            .fullScreenCover(isPresented: $loginSuccessful) {
                HomeView(loginSuccessful: $loginSuccessful, user: $user)
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
