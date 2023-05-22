//
//  LoginPortraitModeView.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

extension LoginView {
    
    //Variation of login view for portrait mode detected
    @ViewBuilder func getPortraitMode(option: Binding<InitOption?>) -> some View{
        VStack {
            VStack {
                Image("app_logo")
                    .resizable()
                    .frame(width: 200,height: 200)
                    .cornerRadius(25)
                    .shadow(radius: 15)
                    .padding(.top, 30)
                
                Text(LocalizedStringKey("APP_NAME"))
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .bold()
                .shadow(radius: 15)
                
                Text(LocalizedStringKey("SLOGAN"))
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            getLoginButtons(option: option)
        }
    }
}
