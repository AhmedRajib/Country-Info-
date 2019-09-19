//
//  customTableViewCell.swift
//  jsonParse&Search
//
//  Created by Md Kamrul Hasan on 19/3/19.
//  Copyright © 2019 Md Kamrul Hasan. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {
    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
