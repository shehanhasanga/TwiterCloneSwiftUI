//
//  ContentView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-29.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State var showSidemenu:Bool = false
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                LoginView()
            } else{
                maininterfaceView
            }
            
        }
        
    }
}

extension ContentView{
    var maininterfaceView: some View{
        ZStack(alignment:.topLeading) {
            MainTabView()
                .navigationBarHidden(showSidemenu)
            
            if showSidemenu {
                ZStack{
                    Color(.black).opacity(showSidemenu ? 0.25 : 0)
                }
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(Animation.easeInOut){
                        showSidemenu = false
                    }
                }
            }
            SideMenuView()
                .frame(width: 300)
                .offset(x:showSidemenu ? 0 : -300)
                .background(showSidemenu ? .white : .clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(Animation.easeInOut) {
                            showSidemenu.toggle()
                        }
                        
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                          
                    }
                }
                
            }
        }
        .onAppear {
            showSidemenu = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
