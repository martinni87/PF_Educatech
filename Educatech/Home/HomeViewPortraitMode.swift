//
//  HomePortraitView.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct HomeViewPortraitMode: View {
    
    //MARK: Binding variables from upper classes to share data between view modes
//    @Binding var textFieldText: String
//    @Binding var resultado: String
    @Binding var user: UserModel
    @Binding var loginSuccessful: Bool

    var body: some View {
        TabView {
            NavigationStack {
                NavigationLink {
                    Text("Home view destination. Curso 1")
                } label: {
                    Text("Home view label. Curso 1")
                }
                .navigationTitle("Welcome \(user.email)")
                .padding()
                
                NavigationLink {
                    Text("Home view destination. Curso 2")
                } label: {
                    Text("Home view label. Curso 2")
                }
                .navigationTitle("Welcome \(user.email)")
                .padding()
            }
            .tabItem {
                Label("HOME", systemImage: "house.fill")
            }
            Text("Search View")
                .tabItem {
                    Label("SEARCH", systemImage: "magnifyingglass")
                }
            Text("My Courses View")
                .tabItem {
                    Label("MY COURSES", systemImage: "star.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct HomeViewPortraitMode_Previews: PreviewProvider {
    
//    @State static var textFieldText: String = ""
//    @State static var resultado: String = ""
    @State static var loginSuccessful: Bool = true
    @State static var user = UserModel()
    
    static var previews: some View {
        HomeViewPortraitMode(user: $user, loginSuccessful: $loginSuccessful)
//        HomeViewPortraitMode(textFieldText: $textFieldText, resultado: $resultado)
    }
}
