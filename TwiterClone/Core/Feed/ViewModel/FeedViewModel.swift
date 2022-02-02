//
//  FeedViewModel.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import Foundation

class FeedViewModel:ObservableObject{
    var service = TweetService()
    var userService = UserService()
    @Published var tweets = [Tweet]()
    
    init(){
        fetchTweets()
    }
    
    func fetchTweets(){
        service.fetchTweet { tweets in
            self.tweets = tweets
            for i in 0..<tweets.count {
                let uid = tweets[i].uid
                self.userService.fetchUser(userId: uid) { user in
                    self.tweets[i].user = user
                }
            }
            
        }
    }
}
