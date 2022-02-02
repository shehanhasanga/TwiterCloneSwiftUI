//
//  TweetViewModel.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import Foundation

class TweetRowViewModel : ObservableObject{
    var tweetService = TweetService()
    @Published var  tweet: Tweet
    
    init(tweet:Tweet){
        self.tweet = tweet
        checkUserlikedTweet()
    }
    
    func likeTweet(){
        tweetService.likeTweet(tweet: tweet) { iscompleted in
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet(){
        tweetService.likeTweet(tweet: tweet) { iscompleted in
            self.tweet.didLike = false
        }
    }
    
    func checkUserlikedTweet(){
        tweetService.checkUserlikedTweet(tweet: tweet) { iscompleted in
            if iscompleted {
                self.tweet.didLike = true
            }
          
        }
    }
    
}
