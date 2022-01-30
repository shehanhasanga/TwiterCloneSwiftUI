//
//  TweetFilterViewModel.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable{
    case tweets
    case replies
    case likes
    
    var title: String{
        switch self {
        case .tweets : return "Tweets"
        case .replies : return "Replies"
        case .likes : return "Likes"
        }
    }
}
