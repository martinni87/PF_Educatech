//
//  EducatechApp.swift
//  Educatech
//
//  Created by Martín Antonio on 17/5/23.
//

import SwiftUI
import FirebaseCore

//Register of app delegate for Firebase Setup with property wrapper UIApplicationDelegateAdaptor
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct EducatechApp: App {
    //Register of app delegate for Firebase Setup with property wrapper UIApplicationDelegateAdaptor
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                LoginView()
            }
        }
    }
}
