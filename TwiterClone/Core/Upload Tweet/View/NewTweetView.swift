//
//  NewTweetView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption : String = ""
    @Environment(\.presentationMode) var mode
    var body: some View {
        VStack{
            HStack{
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical,8)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                        
                }

            }
            .padding()
            HStack(alignment:.top){
                Circle()
                    .frame(width: 64, height: 64)
                TextAreaView("What's happening", text: $caption)
            }.padding()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
