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
    @State var formStatus = RegisterStatus.noData
    
    var body: some View {
        NavigationStack{
            VStack {
                //For vertical compact: Landscape
                if verticalSizeClass == .compact {

                    SignupViewLandscapeMode(user: $user, formStatus: $formStatus)
                }
                //For horizontal compact: Portrait
                else if horizontalSizeClass == .compact {
                    SignupViewLandscapeMode(user: $user, formStatus: $formStatus)
                }
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
//        SignUpEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
