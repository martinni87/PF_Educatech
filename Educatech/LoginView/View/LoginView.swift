//
//  LoginView.swift
//  E-Learning
//
//  Created by Martín Antonio on 13/5/23.
//

import SwiftUI
import UIKit

struct LoginView: View {
    
//    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    //MARK: Environment variables to evaluate wether device is in horizontal mode or vertical mode
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    //MARK: Environment variable to dismiss views
    @Environment(\.dismiss) var dismiss
    
    //MARK: State variables to pass through lower layers of code (Bindings)
    @State var email: String = ""
    @State var password: String = ""
    @State var option: EmailOption?
    @State var showAlert = false
    
    var body: some View {
        NavigationStack {
            VStack{
                //For vertical compact: Landscape
                if verticalSizeClass == .compact {
                    LoginViewLandscapeMode(email: $email, password: $password, option: $option, showAlert: $showAlert)
                }
                //For horizontal compact: Portrait
                else if horizontalSizeClass == .compact {
                    LoginViewPortraitMode(email: $email, password: $password, option: $option, showAlert: $showAlert)
                }
            }
            .sheet(item: $option) { option in
                LoginViewController().selectView(for: option)
                    .presentationCompactAdaptation(.fullScreenCover)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        dismiss()
                    }) {
                        Label("Cerrar", systemImage: "xmark")
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
//        LoginEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
