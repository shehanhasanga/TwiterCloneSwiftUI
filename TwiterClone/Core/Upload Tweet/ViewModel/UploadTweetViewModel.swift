//
//  UploadTweetViewModel.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import Foundation


class UploadTweetViewModel: ObservableObject{
    let service = TweetService()
    @Published var didUploadTweet = false
    
    func uploadTweet(caption:String){
        service.uploadTweet(caption: caption) { isSuccess in
            if isSuccess {
                self.didUploadTweet = true
            } else {
                self.didUploadTweet = false
            }
        }
    }
    
}
