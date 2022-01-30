//
//  FeedView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-29.
//

import SwiftUI

struct FeedView: View {
    @State var showNewTweetView: Bool = false
    var body: some View {
        ZStack(alignment:.bottomTrailing){
            ScrollView {
                LazyVStack{
                    ForEach( 1..<10, id: \.self){_ in
                        TweetsRowView()
                            .padding()
                    }
                }
            }
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15, height: 15)
                    .padding()
            }
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }

        }
        
       
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
