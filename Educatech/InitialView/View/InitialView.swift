//
//  InitialView.swift
//  Educatech
//
//  Created by Martín Antonio on 17/5/23.
//

import SwiftUI

struct InitialView: View {
    
    //MARK: Environment variables to evaluate wether device is in horizontal mode or vertical mode
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @State var optionSelected: InitOption?
    
    var body: some View{
        
        VStack {
            //For vertical compact: Landscape
            if verticalSizeClass == .compact {
                InitialViewLandscapeMode(optionSelected: $optionSelected)
            }
            //For horizontal compact: Portrait
            else if horizontalSizeClass == .compact {
                InitialViewPortraitMode(optionSelected: $optionSelected)
            }
        }
        .sheet(item: $optionSelected) { optionSelected in
            InitialViewController().selectView(for: optionSelected)
        }
        .onTapGesture {
            // Dissmis keyboard on tap gesture on screeen
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}


