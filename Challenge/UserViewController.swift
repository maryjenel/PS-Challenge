//
//  UserViewController.swift
//  Challenge
//
//  Created by Jenel Myers on 7/14/17.
//  Copyright © 2017 PetSmart. All rights reserved.
//

import Foundation
import UIKit

protocol UserViewInput {
    func displayUsers(_ users:[User])
}

protocol UserViewOutput {
    func getUsers()
}

class UserViewController: UIViewController {
	var output: UserViewOutput!
	var router: UserRouterInput!
    var users: [User] = []
 
    @IBOutlet weak var tableView: UITableView!
	override func awakeFromNib() {
		super.awakeFromNib()
		UserConfigurator.sharedInstance.configure(viewController: self)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
        self.output.getUsers()
	}
	
}

extension UserViewController: UserViewInput {
    func displayUsers(_ users: [User]) {
        self.users = users
        self.tableView.reloadData()
    }
    
}
extension UserViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let user = self.users[indexPath.row]
        cell.configure(forUser: user)
        return cell
    }

}
