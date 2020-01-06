//
//  TableViewCell.swift
//  DigitalBitesIOSAPP
//
//  Created by Digital Bites on 08/11/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var resImage: UIImageView!
    @IBOutlet weak var resTitle: UILabel!
    
    func setRestaurant(restaurant: Table){
        resImage.image = restaurant.image
        resTitle.text = restaurant.title
    }
    
}
