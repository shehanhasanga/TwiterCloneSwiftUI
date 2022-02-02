//
//  UserService.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserService{
    
    func fetchUser(userId:String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("users")
            .document(userId)
            .getDocument { snapshot, error in
                guard let data = try? snapshot?.data(as: User.self) else {return}
                completion(data)
            }
    }
}
