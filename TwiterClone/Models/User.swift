//
//  User.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import FirebaseFirestoreSwift
import Firebase

struct User:Identifiable, Codable, Hashable{
    @DocumentID var id: String?
    var username:String
    var email :String
    var fullname: String
    var profileImageUrl:String
    
    var isCurrentUser:Bool{
        return Auth.auth().currentUser?.uid == id
    }
}
