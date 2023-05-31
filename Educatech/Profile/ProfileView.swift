//
//  ProfileView.swift
//  Educatech
//
//  Created by Martín Antonio on 30/5/23.
//

import SwiftUI

let courses = ["Curso1", "Curso2", "Curso3", "Curso4", "Curso5",
               "Curso6", "Curso7", "Curso8", "Curso9", "Curso10"]

struct ProfileView: View {
    
    @State var goToEditPage = false
    
    var body: some View {
        VStack {
            Image("profile_pic_sample")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(height: 250)
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white]), startPoint: .top, endPoint: .bottom))
                    .frame(height: 100)
                
                HStack {
                    Text("Nombre de usuario")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Button {
                        goToEditPage = true
                    } label: {
                        Label("", systemImage: "square.and.pencil")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.white)
                    }
                }
                .sheet(isPresented: $goToEditPage) {
                    EditProfile()
                }
            }
            .offset(y:-50)
            NavigationStack {
                ScrollView{
                    ForEach(courses, id: \.self) { course in
                        NavigationLink {
                            VStack (spacing: 30){
                                Image(systemName: "apple.logo")
                                    .resizable()
                                    .frame(width: 25,height: 30)
                                Text(course)
                                Text("Breve descripción curso")
                            }
                        } label: {
                            HStack(alignment: .top) {
                                Image(systemName: "apple.logo")
                                    .resizable()
                                    .frame(width: 25,height: 30)
                                    .padding()
                                VStack (alignment: .leading,spacing: 20) {
                                    Text(course)
                                        .bold()
                                        .font(.title)
                                        .foregroundColor(.black)
                                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor")
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .frame(width: 330)
                            .padding()
                        }
                    }
                }
            }
            .offset(y:-50)
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
