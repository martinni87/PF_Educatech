//
//  HomePortraitView.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct HomeViewPortraitMode: View {
    
    //MARK: Binding variables from upper classes to share data between view modes
    @Binding var textFieldText: String
    @Binding var resultado: String
    
    var body: some View {
        
        //Init homeViewElements, to be able to call methods to draw objects
        let homeViewElements = HomeViewElements(textFieldText: $textFieldText, resultado: $resultado)
        
        //The stack view that's going to show on screen
        NavigationStack {
            VStack {
                Form {
                    homeViewElements.drawTextField()
                    homeViewElements.drawTextResult()
                }
                homeViewElements.drawPrintButton()
            }
            .navigationTitle("HOME SCREEN (Portrait)")
            .navigationBarTitleDisplayMode(.inline)
        }
        .background(Color.gray)
        //End of stack view
    }
}

struct HomeViewPortraitMode_Previews: PreviewProvider {
    
    @State static var textFieldText: String = ""
    @State static var resultado: String = ""
    
    static var previews: some View {
        HomeViewPortraitMode(textFieldText: $textFieldText, resultado: $resultado)
    }
}
