//
//  User.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import FirebaseFirestoreSwift

struct User:Identifiable, Codable{
    @DocumentID var id: String?
    var username:String
    var email :String
    var fullname: String
    var profileImageUrl:String
}