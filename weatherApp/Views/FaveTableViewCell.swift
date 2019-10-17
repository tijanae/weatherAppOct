//
//  FaveTableViewCell.swift
//  weatherApp
//
//  Created by Tia Lendor on 10/17/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import UIKit

class FaveTableViewCell: UITableViewCell {

    @IBOutlet weak var faveCityImages: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
