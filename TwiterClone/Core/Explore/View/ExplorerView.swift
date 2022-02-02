//
//  ExplorerView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-29.
//

import SwiftUI

struct ExplorerView: View {
    @ObservedObject var viewmodel = ExplorViewModel()
    @State var searchTxt = ""
    var body: some View {
        VStack{
            SearchBar(text: $viewmodel.searchTxt)
                .padding()
            ScrollView{
                LazyVStack{
                    ForEach(viewmodel.searchableUsers){
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
