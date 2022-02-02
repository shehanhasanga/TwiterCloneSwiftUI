//
//  NewTweetView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption : String = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel : AuthViewModel
    
    @ObservedObject var tweetViewModel = UploadTweetViewModel()
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
                    tweetViewModel.uploadTweet(caption: caption)
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
                if let user = viewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                    
                }
                    
                TextAreaView("What's happening", text: $caption)
            }.padding()
        }
        .onReceive(tweetViewModel.$didUploadTweet) { success in
            if success {
                mode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
