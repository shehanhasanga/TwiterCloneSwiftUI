//
//  ContentView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-29.
//

import SwiftUI

struct ContentView: View {
    @State var showSidemenu:Bool = false
    var body: some View {
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
                Button {
                    withAnimation(Animation.easeInOut) {
                        showSidemenu.toggle()
                    }
                    
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
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
