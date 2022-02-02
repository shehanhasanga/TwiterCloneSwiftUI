//
//  ProfileViewModel.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import Foundation

class ProfileViewModel:ObservableObject{
    @Published var usertweets = [Tweet]()
    @Published var userLikedtweets = [Tweet]()
    var tweetService = TweetService()
    var userService = UserService()
    var user : User
    
    var actionBtnTitle : String {
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
   
    init(user:User){
        self.user = user
        fetchUserTweets()
        fetchUserLikedTweets()
    }
    
    func tweets(filter: TweetFilterViewModel) -> [Tweet]{
        switch filter {
        case .tweets:
            return usertweets
        case .replies:
            return usertweets
        case .likes:
            return userLikedtweets
        }
    }
    
    func fetchUserTweets() {
        guard let id = user.id else {return}
        tweetService.fetchTweetByUid(uid: id) { tweets in
            self.usertweets = tweets
            
            for i in 0..<self.usertweets.count {
                self.usertweets[i].user = self.user
            }
        }
    }
    
    func fetchUserLikedTweets() {
        guard let id = user.id else {return}
        tweetService.fetchUserLikedTweets(uid: id) { tweets in
            self.userLikedtweets = tweets
            
//            for i in 0..<self.usertweets.count {
//                self.userLikedtweets[i].user = self.user
//            }
            
            for i in 0..<self.userLikedtweets.count {
                let uid = self.userLikedtweets[i].uid
                self.userService.fetchUser(userId: uid) { user in
                    self.userLikedtweets[i].user = user
                }
            }
        }
    }
    
    
}
