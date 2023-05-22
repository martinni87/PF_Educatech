//
//  LoginLandscapeModeView.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

extension LoginView {
    
    //Variation of login view for landscape mode detected
    func getLandscapeMode(option: Binding<InitOption?>) -> some View{
        HStack {
            Spacer()
            
            VStack {
//                appName()
//                appImage()
//                appSlogan()
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            getLoginButtons(option: option)
            
            Spacer()
        }
    }
}
