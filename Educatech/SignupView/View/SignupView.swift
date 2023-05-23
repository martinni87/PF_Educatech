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
    
    //MARK: State variables to pass through lower layers of code (Bindings)
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordCheck: String = ""
    
    var body: some View {
        VStack{
            //For vertical compact: Landscape
            if verticalSizeClass == .compact {
                SignupViewLandscapeMode(firstName: $firstName, lastName: $lastName, email: $email, password: $password, passwordCheck: $passwordCheck)
            }
            //For horizontal compact: Portrait
            else if horizontalSizeClass == .compact {
                SignupViewPortraitMode(firstName: $firstName, lastName: $lastName, email: $email, password: $password, passwordCheck: $passwordCheck)
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
