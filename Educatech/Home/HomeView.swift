//
//  HomeView.swift
//  Educatech
//
//  Created by Martín Antonio on 21/5/23.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: Environment variables to evaluate wether device is in horizontal mode or vertical mode
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    //MARK: Binding from previous View to keep updated the login status
    @Binding var loginSuccessful: Bool
    @Binding var user: UserModel
    
    //MARK: State variables to save data from lower classes later called
    //These are going to be passed as Bindings later on.
//    @State private var textFieldText = ""
//    @State private var resultado = ""
        
    var body: some View {
        NavigationStack {
            //For vertical compact: Landscape
            if verticalSizeClass == .compact {
                HomeViewLandscapeMode(user: $user, loginSuccessful: $loginSuccessful)
            }
            //For horizontal compact: Portrait
            else if horizontalSizeClass == .compact {
                HomeViewPortraitMode(user: $user, loginSuccessful: $loginSuccessful)
            }
        }
//        MARK: ON tap gesture commented because it caused a problem in which a user couldn't select different tab views.
//        .onTapGesture {
//            // Dissmis keyboard on tap gesture on screeen
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    @State static var loginStatus: Bool = true
    @State static var user = UserModel()
    
    static var previews: some View {
        HomeView(loginSuccessful: $loginStatus, user: $user)
    }
}
