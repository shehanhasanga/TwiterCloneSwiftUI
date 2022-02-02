//
//  ExplorViewModel.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import Foundation

class ExplorViewModel:ObservableObject{
    @Published var users = [User]()
    @Published var searchTxt = ""
    var userService = UserService()
    
    var searchableUsers : [User]{
        if searchTxt == "" {
            return users
        } else {
            let lowerTxt = searchTxt.lowercased()
            return users.filter { user in
                user.username.contains(lowerTxt) || user.fullname.lowercased().contains(lowerTxt)
            }
        }
        
    }
    init(){
        fetchUsers()
    }
    
    func fetchUsers() {
        userService.fetchUsers { users in
            self.users = users
        }
    }
    
    
}
