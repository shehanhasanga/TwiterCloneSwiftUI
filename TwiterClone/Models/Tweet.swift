//
//  Tweet.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Tweet:Identifiable, Codable, Hashable{
    @DocumentID var id: String?
    var caption:String
    var uid :String
    var timestamp: Timestamp
    var likes : Int
    
    var user:User?
    
    var didLike: Bool? = false
}
