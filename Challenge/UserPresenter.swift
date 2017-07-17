//
//  UserPresenter.swift
//  Challenge
//
//  Created by Jenel Myers on 7/14/17.
//  Copyright © 2017 PetSmart. All rights reserved.
//

import Foundation

protocol UserPresenterInput {
	func presentUsers(_ users: [User])
}

protocol UserPresenterOutput: class {
    func displayUsers(_ users:[User])

}

class UserPresenter: UserPresenterInput {
	weak var output: UserPresenterOutput!
    
    func presentUsers(_ users: [User]){
        self.output.displayUsers(users)
    }
}
