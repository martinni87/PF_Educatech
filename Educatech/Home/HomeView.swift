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
    
    //MARK: State variables to save data from lower classes later called
    //These are going to be passed as Bindings later on.
    @State private var textFieldText = ""
    @State private var resultado = ""
        
    var body: some View {
        Group {
            //For vertical compact: Landscape
            if verticalSizeClass == .compact {
                HomeViewLandscapeMode(textFieldText: $textFieldText, resultado: $resultado)
            }
            //For horizontal compact: Portrait
            else if horizontalSizeClass == .compact {
                HomeViewPortraitMode(textFieldText: $textFieldText, resultado: $resultado)
            }
        }
        .onTapGesture {
            // Dissmis keyboard on tap gesture on screeen
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
