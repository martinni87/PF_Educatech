//
//  PortraitLoginView.swift
//  Educatech
//
//  Created by Martín Antonio on 18/5/23.
//

import SwiftUI

extension LoginView {
    
    //Variation of login view for portrait mode detected
    @ViewBuilder func getPortraitMode(option: Binding<LoginOption?>) -> some View{
        VStack {
            VStack {
                Image("app_logo")
                    .resizable()
                    .frame(width: 200,height: 200)
                    .cornerRadius(25)
                    .shadow(radius: 15)
                    .padding(.top, 30)
                
                Text("Educatech")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .bold()
                .shadow(radius: 15)
                
                Text("Accede a un mundo de conocimiento en la palma de tu mano")
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
