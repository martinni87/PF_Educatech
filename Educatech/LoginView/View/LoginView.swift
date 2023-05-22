//
//  LoginView.swift
//  E-Learning
//
//  Created by Martín Antonio on 13/5/23.
//

import SwiftUI

struct LoginView: View {
    
//    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State var email: String = ""
    @State var password: String = ""
    @State var option: EmailOption?
    
    var body: some View {
        VStack{
            //For vertical compact: Landscape
            if verticalSizeClass == .compact {
                LoginViewLandscapeMode(email: $email, password: $password, option: $option)
            }
            //For horizontal compact: Portrait
            else if horizontalSizeClass == .compact {
                LoginViewPortraitMode(email: $email, password: $password, option: $option)
            }
        }
//        .onTapGesture {
//            // Dissmis keyboard on tap gesture on screeen
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//        }
        .sheet(item: $option) { option in
            LoginViewController().selectView(for: option)
        }
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
//        LoginEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
