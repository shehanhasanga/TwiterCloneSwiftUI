//
//  TweetsRowView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-29.
//

import SwiftUI
import Kingfisher
struct TweetsRowView: View {
//    let tweet: Tweet
    @ObservedObject var tweetRowViewModel :TweetRowViewModel
    init (tweet:Tweet){
//        self.tweet = tweet
        self.tweetRowViewModel = TweetRowViewModel(tweet: tweet)
    }
    var body: some View {
        VStack(alignment: .leading){
            if let user = tweetRowViewModel.tweet.user {
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 4){
                        HStack{
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Text("2W")
                                .foregroundColor(.gray)
                                .font(.caption).bold()
                        }
                       
                        Text(tweetRowViewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                       
                    }
                }
            }
           
            
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    tweetRowViewModel.tweet.didLike ?? false ? tweetRowViewModel.unlikeTweet() : tweetRowViewModel.likeTweet( )
                } label: {
                    Image(systemName: tweetRowViewModel.tweet.didLike ?? false ? "heart.fill": "heart")
                        .font(.subheadline)
                        .foregroundColor(tweetRowViewModel.tweet.didLike ?? false ? .red : .gray)
                }
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                

            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
            
            
        }
     
      
    }
}

//struct TweetsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetsRowView()
//    }
//}
