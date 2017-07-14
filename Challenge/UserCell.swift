//
//  UserCell.swift
//  Challenge
//
//  Created by Jenel Myers on 7/14/17.
//  Copyright © 2017 PetSmart. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    final func configure(forUser user: User) {
        self.name.text = user.name
        self.username.text = user.username
    }
}
