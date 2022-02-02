//
//  TwiterCloneApp.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-29.
//

import SwiftUI
import Firebase
@main
struct TwiterCloneApp: App {
    @StateObject var viewModel = AuthViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
//                LoginView()
                ContentView()
//                ProfilePhotoSelectorView()
            }
            .environmentObject(viewModel)
//            MainTabView()
        }
    }
}
