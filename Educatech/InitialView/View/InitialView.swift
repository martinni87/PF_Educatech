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
    
    //MARK: State variables to pass through lower layers of code (Bindings)
    @State var optionSelected: InitOption?
    
    var body: some View{
        
        NavigationStack {
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
            .fullScreenCover(item: $optionSelected) { option in
                InitialViewController().selectView(for: option)
            }
//            .sheet(item: $optionSelected) { optionSelected in
//                if optionSelected == .email{
//                    InitialViewController().selectView(for: optionSelected)
////                        .presentationCompactAdaptation(.fullScreenCover)
//                }
//                else{
//                    InitialViewController().selectView(for: optionSelected)
//                    //not full screen cover by tghe moment
//                }
//            }
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}


