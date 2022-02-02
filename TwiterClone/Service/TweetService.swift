//
//  TweetService.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import Foundation
import Firebase
import SwiftUI

struct TweetService {
    func uploadTweet(caption:String,  completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid":uid, "caption":caption, "likes":0,
                    "timestamp":Timestamp(date: Date())
        ]  as [String:Any]
        
        Firestore.firestore().collection("tweets")
            .document().setData(data) { error in
                if let error = error {
                    completion(false)
                    return
                }
                completion(true)
            }
        
    }
    
    func fetchTweet(completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                guard let docs = snapshot?.documents else {return}
                
                let tweets = docs.compactMap({ try? $0.data(as: Tweet.self)})
                completion(tweets)
            }
    }
    
    func fetchTweetByUid(uid:String,completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, error in
                guard let docs = snapshot?.documents else {return}
                
                let tweets = docs.compactMap({ try? $0.data(as: Tweet.self)})
                completion(tweets)
            }
    }
    
    func likeTweet(tweet:Tweet,completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        let userreft = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes": tweet.likes + 1]){ _ in
                userreft.document(tweetId).setData([:]) {_ in
                    completion(true)
                }
                
            }
    }
    
    func unlikeTweet(tweet:Tweet,completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        let userreft = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes": tweet.likes - 1]){ _ in
                userreft.document(tweetId).delete {_ in
                    completion(true)
                }
                
            }
    }
    
    func checkUserlikedTweet(tweet:Tweet,completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        let userreft = Firestore.firestore().collection("users").document(uid).collection("user-likes")
            .document(tweetId).getDocument{ snapshot,_ in
                guard let snapshot = snapshot else {return}
                completion(snapshot.exists)
                
            }
       
    }
    
    func fetchUserLikedTweets(uid:String,completion: @escaping([Tweet]) -> Void){
        var tweetsnew = [Tweet]()
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .getDocuments { snapshot, error in
                guard let docs = snapshot?.documents else {return}
                
                docs.forEach { doc in
                    let tweetid = doc.documentID
                    Firestore.firestore().collection("tweets")
                        .document(tweetid)
                        .getDocument(completion: { snapshot, error in
                            guard let tweet = try? snapshot?.data(as: Tweet.self) else {return}
                            
                            tweetsnew.append(tweet)
                            completion(tweetsnew)
                        })
                       
                }
            }
    }
}
