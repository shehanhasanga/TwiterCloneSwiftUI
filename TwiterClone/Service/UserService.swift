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
    
    func fetchUsers(completion: @escaping([User]) -> Void){
        var users = [User]()
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, error in
                guard let documents = try? snapshot?.documents else {return}
                users = documents.compactMap({try? $0.data(as: User.self)})
//                documents.forEach { document in
//                    guard let user = try? document.data(as: User.self) else {return}
//                    users.append(user)
//                }
                completion(users)
            }
    }
}
