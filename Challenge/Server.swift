//
//  Server.swift
//  Challenge
//
//  Created by Jenel Myers on 7/14/17.
//  Copyright © 2017 PetSmart. All rights reserved.
//

import Foundation

class Server {
    static let sharedServer = Server()
    var host = "jsonplaceholder.typicode.com"

    fileprivate var urlProtocol:String {
        return "https://"
    }
    enum ServerFuncType : String {
        case Delete = "DELETE"
        case Get = "GET"
        case Post = "POST"
        case Put = "PUT"
    }
    typealias ServerCompletion = (_ responseObject: Data?, _ error: Error?) -> ()

    
    func GET (withPath path: String, completion: @escaping ServerCompletion) -> URLSessionDataTask {
        let urlStr = "\(urlProtocol)\(host)\(path)"
        // Set up the URL request
        guard let url = URL(string: urlStr) else {
            print("Error: cannot create URL")
            return URLSessionDataTask()
        }
        let urlRequest = URLRequest(url: url)
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            completion(data, error)
            
        })
        task.resume()
        return task 
    }
    
    
}
