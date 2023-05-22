//
//  InitialViewElements.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct InitialViewElements {
    
    @Binding var optionSelected: InitOption?
    
    @ViewBuilder func drawAppTitle() -> some View {
       Text(LocalizedStringKey("APP_NAME"))
            .font(.system(size: 40, weight: .black, design: .rounded))
            .bold()
            .shadow(radius: 15)
            .padding()
    }
    
    @ViewBuilder func drawPicture(width: CGFloat, height: CGFloat) -> some View {
        Image("app_logo")
            .resizable()
            .frame(width: width,height: height)
            .cornerRadius(25)
            .shadow(radius: 15)
            .padding()
    }
    
    @ViewBuilder func drawSlogan() -> some View {
        Text(LocalizedStringKey("SLOGAN"))
            .font(.body)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    @ViewBuilder func drawButton(option: InitOption) -> some View {
        switch option {
        case .email:
            Button(action: {optionSelected = .email}) {
                Label(LocalizedStringKey("EMAIL_LOGIN"), systemImage: "envelope.fill")
                    .frame(maxWidth: .infinity)
                    .bold()
            }.tint(.gray).buttonStyle(.bordered).controlSize(.large)
        case .facebook:
            Button(action: {optionSelected = .facebook}) {
                Label(LocalizedStringKey("FACEBOOK_LOGIN"), systemImage: "f.cursive.circle.fill")
                    .frame(maxWidth: .infinity)
                    .bold()
            }.tint(.blue).buttonStyle(.borderedProminent).controlSize(.large)
        case .google:
            Button(action: {optionSelected = .google}) {
                Label(LocalizedStringKey("GOOGLE_LOGIN"), systemImage: "g.circle")
                    .frame(maxWidth: .infinity)
                    .bold()
            }.tint(.green).buttonStyle(.borderedProminent).controlSize(.large)
        case .apple:
            Button(action: {optionSelected = .apple}) {
                Label(LocalizedStringKey("APPLE_LOGIN"), systemImage: "apple.logo")
                    .frame(maxWidth: .infinity)
                    .bold()
            }.tint(.black).buttonStyle(.borderedProminent).controlSize(.large)
        }
    }
}
