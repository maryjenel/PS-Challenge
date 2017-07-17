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
    func presentError(_ error: UserRequestModel.Error)
}

protocol UserPresenterOutput: class {
    func displayUsers(_ users:[User])
    func displayError(_ error: UserRequestModel.Error)
}

class UserPresenter: UserPresenterInput {
	weak var output: UserPresenterOutput!
    
    func presentUsers(_ users: [User]){
        self.output.displayUsers(users)
    }
    func presentError(_ error: UserRequestModel.Error) {
        var convertError: UserRequestModel.Error
        switch error {
        case .apiError:
            convertError = UserRequestModel.Error.apiError(message: "API Request Error")
        case .noData:
            convertError = UserRequestModel.Error.noData(message: "No Data Returned Error")
        }
        self.output.displayError(convertError)
    }
}
