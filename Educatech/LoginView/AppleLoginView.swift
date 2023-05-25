//
//  AppleLoginView.swift
//  Educatech
//
//  Created by Martín Antonio on 25/5/23.
//

import SwiftUI

struct AppleLoginView: View {
    
    //MARK: Environment variable to dismiss views
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Apple Login View under construction")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        dismiss()
                    }) {
                        Label("", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                })
            }
        }
    }
}

struct AppleLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AppleLoginView()
    }
}
