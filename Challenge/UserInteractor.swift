//
//  UserInteractor.swift
//  Challenge
//
//  Created by Jenel Myers on 7/14/17.
//  Copyright © 2017 PetSmart. All rights reserved.
//

import Foundation

protocol UserInteractorInput {
    var managerAPIProvider: ManagerAPI! { get set }
     func getUsers()
    
}

protocol UserInteractorOutput {
    func presentUsers(_ users: [User])
}

class UserInteractor: UserInteractorInput {
    var managerAPIProvider: ManagerAPI!
    
	var output: UserInteractorOutput!
    
    func getUsers() {
        managerAPIProvider.getUsers { (users) in
            if users.count > 0 {
                self.output.presentUsers(users)
            }
        }
    }
}
