//
//  CategoryCollectionViewCell.swift
//  DigitalBitesIOSAPP
//
//  Created by Digital Bites on 02/11/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var ImgView: UIImageView!
    
    func setRestaurant(restaurant: Category){
        ImgView.image = restaurant.image
        labelName.text = restaurant.title
    }
}
