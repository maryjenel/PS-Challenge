//
//  UserModels.swift
//  Challenge
//
//  Created by Jenel Myers on 7/14/17.
//  Copyright © 2017 PetSmart. All rights reserved.
//

import Foundation

// Models
struct UserRequestModel {
    enum Error {
        case apiError(message:String?)
        case noData(message:String?)
    }
}
