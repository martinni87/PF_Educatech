//
//  ContentView.swift
//  Educatech
//
//  Created by Martín Antonio on 17/5/23.
//

import SwiftUI

struct LoginView: View {
    
    //Environment variables to use as orientation status
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    //Parameter that will store option selected between layers of code in LoginScreen
    @State var option: LoginOption?

    //Body view
    var body: some View {
        //Method loginViewOrientation is an custom made extension for View Object in SwiftUI Package Library to handle orientation in layout
        self.loginViewOrientation(vertical: verticalSizeClass ?? .regular, horizontal: horizontalSizeClass ?? .compact,option: $option)
        .sheet(item: $option) { optionSelected in
            LoginController().selectView(for: optionSelected)
        }
    }
}

//Previews
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
