//
//  AuthViewModel.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import Foundation
import Firebase
import UIKit
import SwiftUI

class AuthViewModel :ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var authenticateuser: Bool = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    private var userService = UserService()
    init(){
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func fetchUser(){
        guard let userId = userSession?.uid else {return}
        userService.fetchUser(userId: userId) { user in
            self.currentUser = user
        }
    }
    
    func login(email:String, password:String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            print(password)
            if let error = error {
                print(error)
                return
            }
            guard let user =  result?.user else {return}
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(email:String, password:String, fullName:String, userName:String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                return
            }
            guard let user =  result?.user else {return}
            self.tempUserSession = user
//            self.userSession = user
            let data = ["email":email, "username":userName.lowercased(),"fullname":fullName,"uid":user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.authenticateuser = true
                }
        }
    }
    
    func signOut(){
        userSession = nil
        do{
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
    }
    
    func uploadProfileImage(image:UIImage){
        guard let uid = tempUserSession?.uid else {return}
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]){_ in
                   
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
            
        }
    }
}
