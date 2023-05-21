//
//  LandscapeLoginView.swift
//  Educatech
//
//  Created by Martín Antonio on 18/5/23.
//

import SwiftUI

extension LoginView {
    
    //Variation of login view for landscape mode detected
    @ViewBuilder func getLandscapeMode(option: Binding<LoginOption?>) -> some View{
        
        HStack {
            VStack {
                Text("Educatech")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .bold()
                .shadow(radius: 15)

                Image("app_logo")
                    .resizable()
                    .frame(width: 150,height: 150)
                    .cornerRadius(25)
                    .shadow(radius: 15)
                
                Text("Accede a un mundo de conocimiento en la palma de tu mano")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal,30)
            .padding(.vertical, 40)

            getLoginButtons(option: option)
        }
    }
}
