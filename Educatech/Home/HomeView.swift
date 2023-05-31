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
    @Binding var user: UserModel
    @Binding var loginSuccessful: Bool
    
        
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
        .tint(.green)
    }
}

struct HomeView_Previews: PreviewProvider {
    
    @State static var user = UserModel()
    @State static var loginStatus: Bool = true
    
    static var previews: some View {
        HomeView(user: $user, loginSuccessful: $loginStatus)
    }
}
