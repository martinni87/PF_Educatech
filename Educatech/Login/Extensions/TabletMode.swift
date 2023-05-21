//
//  TabletMode.swift
//  Educatech
//
//  Created by Martín Antonio on 18/5/23.
//

import SwiftUI

extension LoginView {
    
    //Variation of login view for tablet mode detected
    @ViewBuilder func getTabletMode() -> some View{
        //TO DO
        Text("Educatech")
            .font(.largeTitle)
            .bold()
        
        Text("Modo en construcción... 🚧👷🏽‍♂️🚧")
            .foregroundColor(.pink)
        //TO DO
    }
    
}
