//
//  HomeLandscapeView.swift
//  Educatech
//
//  Created by Martín Antonio on 22/5/23.
//

import SwiftUI

struct HomeViewLandscapeMode: View {
    
    //MARK: Binding variables from upper classes to share data between view modes
//    @Binding var textFieldText: String
//    @Binding var resultado: String
    @Binding var user: UserModel
    @Binding var loginSuccessful: Bool
    
    var body: some View {
        
        NavigationStack{
            VStack (alignment: .trailing) {
                Button("Cerrar sesión"){
                    loginSuccessful = !loginSuccessful
                }
                .tint(.mint)
                TabView {
                    Text("Home View with recommendations")
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
                    Text("Profile View")
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                }
            }
            .tint(.mint)
            .padding(.horizontal, 40)
            .navigationTitle("Welcome \(user.email)")
            .navigationBarTitleDisplayMode(.inline)
        }
        
//        //Init homeViewElements, to be able to call methods to draw objects
//        let homeViewElements = HomeViewElements(textFieldText: $textFieldText, resultado: $resultado)
//
//        //The stack view that's going to show on screen
//        NavigationStack {
//            HStack {
//                Form {
//                    homeViewElements.drawTextField()
//                    homeViewElements.drawTextResult()
//                }
//                homeViewElements.drawPrintButton()
//            }
//            .navigationTitle("HOME SCREEN (Landscape)")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        .background(Color.gray)
//        //End of stack view
    }
}


struct HomeViewLandscapeMode_Previews: PreviewProvider {
    
//    @State static var textFieldText: String = ""
//    @State static var resultado: String = ""
    @State static var loginSuccessful: Bool = true
    @State static var user = UserModel()
    
    static var previews: some View {
        HomeViewLandscapeMode(user: $user, loginSuccessful: $loginSuccessful)
//        HomeViewLandscapeMode(textFieldText: $textFieldText, resultado: $resultado)
    }
}


//
//struct HomeLandscapeView: View {
//    
//    let elements: HomeViewElements?
//    
//    @State var text1: String = ""
//    @State var text2: String = ""
//    
//    var body: some View {
//        HStack{
//            Form {
//                elements?.textField1(element1: $text1)
//                elements?.textField2(element2: $text2)
//            }
//            .colorMultiply(.yellow)
//            VStack {
//                Group {
//                    elements?.setButton(titulo: "ENTER", texto: "Entrando")
//                        .tint(.orange)
//                        .frame(maxWidth: .infinity)
//                        .controlSize(.large)
//                    elements?.setButton(titulo: "SALIR", texto: "Saliendo")
//                        .tint(.pink)
//                        .frame(maxWidth: .infinity)
//                        .controlSize(.large)
//                }
//                .frame(width: 100)
//            }
//            .buttonStyle(.borderedProminent)
//        }
//        .background(Color.black)
//    }
//}
//

