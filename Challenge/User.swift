//
//  User.swift
//  Challenge
//
//  Created by Jenel Myers on 7/14/17.
//  Copyright © 2017 PetSmart. All rights reserved.
//

import Foundation

class User {
    var id: Int
    var name: String
    var username: String
    var email: String
    
    init(dict: [String : Any]) {
        
        self.id = dict["id"] as! Int
        self.name = dict["name"] as! String
        self.username = dict["username"] as! String
        self.email = dict["email"] as! String
        
    }
}


