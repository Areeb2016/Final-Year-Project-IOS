//
//  ResTableViewCell.swift
//  DigitalBitesIOS
//
//  Created by Digital Bites on 01/12/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit

class ResTableViewCell: UITableViewCell {

        @IBOutlet weak var pizzaImageView: UIImageView!
        @IBOutlet weak var name: UILabel!
        @IBOutlet weak var miscellaneousText: UILabel!
        @IBOutlet weak var amount: UILabel!

        override func awakeFromNib() {
            super.awakeFromNib()
        }

}
