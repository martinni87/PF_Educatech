//
//  InitialViewPortraitMode.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct InitialViewPortraitMode: View {
    
    @Binding var optionSelected: InitOption?
    
    var body: some View {
        
        //Init homeViewElements, to be able to call methods to draw objects
        let initialViewElements = InitialViewElements(optionSelected: $optionSelected)
        
        VStack {
            Spacer()
            
            VStack {
                initialViewElements.drawPicture(width: 150, height: 150)
                initialViewElements.drawAppTitle()
                initialViewElements.drawSlogan()
            }
            .padding(.horizontal, 30)
            
            Spacer()
            
            VStack {
                initialViewElements.drawButton(option: .email)
                initialViewElements.drawButton(option: .facebook)
                initialViewElements.drawButton(option: .google)
                initialViewElements.drawButton(option: .apple)
            }
            .padding(.horizontal,30)
            
            Spacer()
        }
    }
}

struct InitialViewPortraitMode_Previews: PreviewProvider {
    
    @State static var optionSelected: InitOption?
    
    static var previews: some View {
        InitialViewPortraitMode(optionSelected: $optionSelected)
    }
}
