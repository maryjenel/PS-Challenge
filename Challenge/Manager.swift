//
//  Manager.swift
//  Challenge
//
//  Created by Jenel Myers on 7/14/17.
//  Copyright © 2017 PetSmart. All rights reserved.
//

import Foundation

class Manager {
    static let shared = Manager()

    func getUsers(withCompletion: @escaping(_ users: [User]) -> ())  {
        
        _ = Server.sharedServer.GET(withPath: "/users", completion: { (response, error) in
            //TODO: fix optional
            let jsonResponse = try? JSONSerialization.jsonObject(with: response!, options: [])
            //TODO: fix optional
            let json = jsonResponse as? [[String: Any]]
            var usersArray = [User]()
            if let users = json {
                for dict in users {
                    let user = User.init(dict: dict)
                    usersArray.append(user)
                }
                withCompletion(usersArray)
            }
        })
    }
    func getPosts(ForUserId: Int, completion: @escaping (_ posts: Posts) ->()) {
     _ = Server.sharedServer.GET(withPath: "/posts") { (response, error) in
        
        }
    }
}
