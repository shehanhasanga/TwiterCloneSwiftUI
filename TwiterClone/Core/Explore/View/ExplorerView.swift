//
//  ExplorerView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-29.
//

import SwiftUI

struct ExplorerView: View {
    @ObservedObject var viewmodel = ExplorViewModel()
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewmodel.users, id: \.self){
                        user in
                        NavigationLink{
                                ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                        
                    }
                }
            }
        }
        .navigationBarTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ExplorerView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorerView()
    }
}
