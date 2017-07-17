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
    fileprivate func showError(_ title: String, message: String) {
        QueueHelper.executeOnMainQueue {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel) { action in })
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension UserViewController: UserViewInput {
    func displayUsers(_ users: [User]) {
            self.users = users
            self.reloadTable()

    }
    
    func displayError(_ error: UserRequestModel.Error) {
        switch error {
        case let .apiError(.some(message)):
            self.showError("sorry", message: message)
        case let .noData(.some(message)):
            self.showError("sorry", message: message)
        default:
            break
        }
    }
    
}
extension UserViewController: UITableViewDataSource, UITableViewDelegate {
    
    func reloadTable() {
        QueueHelper.executeOnMainQueue {
            self.tableView.reloadData()
        }
    }
    
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
