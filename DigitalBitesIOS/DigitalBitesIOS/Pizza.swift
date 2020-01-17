//
//  Pizza.swift
//  DigitalBitesIOS
//
//  Created by Digital Bites on 01/12/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//
import Foundation
import UIKit

struct Pizza {
    let id: String
    let name: String
    let description: String
    let amount: Float
//    let image: UIImage

    init(data: [String: Any]) {
        self.id = data["id"] as! String
        self.name = data["name"] as! String
        let n = data["amount"] as! NSNumber
        self.amount = n.floatValue
        self.description = data["description"] as! String
//        self.image = data["image"] as! UIImage
    }
}
