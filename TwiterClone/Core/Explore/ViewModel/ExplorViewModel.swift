//
//  ExplorViewModel.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-02.
//

import Foundation

class ExplorViewModel:ObservableObject{
    @Published var users = [User]()
    var userService = UserService()
    init(){
        fetchUsers()
    }
    
    func fetchUsers() {
        userService.fetchUsers { users in
            self.users = users
        }
    }
    
    
}
