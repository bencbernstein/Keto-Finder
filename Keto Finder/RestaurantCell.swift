//
//  RestaurantCell.swift
//  Keto Finder
//
//  Created by Benjamin Bernstein on 3/26/17.
//  Copyright © 2017 Burning Flowers. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var categoryField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
