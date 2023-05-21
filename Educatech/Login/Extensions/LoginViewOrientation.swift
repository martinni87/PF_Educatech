//
//  ViewExtension_loginViewOrientation.swift
//  Educatech
//
//  Created by Martín Antonio on 18/5/23.
//

import SwiftUI

extension LoginView {
    
    @ViewBuilder
    func loginViewOrientation(vertical: UserInterfaceSizeClass, horizontal: UserInterfaceSizeClass, option: Binding<LoginOption?>) -> some View {
        if vertical == .compact {
            getLandscapeMode(option: option)
        }
        else if horizontal == .compact {
            getPortraitMode(option: option)
        }
        else {
            getTabletMode()
        }
    }
}
