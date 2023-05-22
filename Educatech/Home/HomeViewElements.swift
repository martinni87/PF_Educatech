//
//  HomeViewElements.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.


import SwiftUI

struct HomeViewElements {
    
    //MARK: Binding variables from upper classes to share data between view modes
    @Binding var textFieldText: String
    @Binding var resultado: String
    
    //MARK: View Builders
    //TextField
    @ViewBuilder func drawTextField() -> some View {
        TextField("Escriba su nombre", text: $textFieldText)
            .onSubmit {
                submitResult()
            }
    }
    
    //Place for Text result
    @ViewBuilder func drawTextResult() -> some View {
        Text(resultado)
    }
    
    //Button submit
    @ViewBuilder func drawPrintButton() -> some View{
        Button("Imprimir"){
            submitResult()
        }
        .buttonStyle(.borderedProminent)
        .tint(.black)
    }
    
    //MARK: Private methods
    // Method to update resultado by tapping on submit button, or submit from keyboard
    private func submitResult(){
        resultado += textFieldText + " "
    }

}
