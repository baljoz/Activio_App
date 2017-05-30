//
//  TraningPlayerTableViewCell.swift
//  Activio App
//
//  Created by Milos Stosic on 5/12/17.
//  Copyright © 2017 Milos Stosic. All rights reserved.
//

import UIKit

class TraningPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerSurname: UILabel!
    @IBOutlet weak var pear: UIButton!
    @IBOutlet weak var playerPosition: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
