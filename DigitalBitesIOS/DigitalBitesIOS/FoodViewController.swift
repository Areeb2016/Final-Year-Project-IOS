//
//  FoodViewController.swift
//  DigitalBitesIOS
//
//  Created by Digital Bites on 01/12/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit
import Alamofire

class FoodViewController: UIViewController {

    var pizza: Pizza?

        @IBOutlet weak var amount: UILabel!
        @IBOutlet weak var pizzaDescription: UILabel!
        @IBOutlet weak var pizzaImageView: UIImageView!

        override func viewDidLoad() {
            super.viewDidLoad()

            navigationItem.title = pizza!.name
            pizzaImageView.image = pizza!.image
            pizzaDescription.text = pizza!.description
            amount.text = "$\(String(describing: pizza!.amount))"
        }

        @IBAction func buyButtonPressed(_ sender: Any) {
            let parameters = [
                "pizza_id": pizza!.id,
                //"user_id": AppMisc.USER_ID
            ]

//            Alamofire.request("http://127.0.0.1:4000/orders", method: .post, parameters: parameters)
//                .validate()
//                .responseJSON { response in
//                    guard response.result.isSuccess else { return self.alertError() }
//
//                    guard let status = response.result.value as? [String: Bool],
//                          let successful = status["status"] else { return self.alertError() }
//
//                    successful ? self.alertSuccess() : self.alertError()
//                }
//        }

//        private func alertError() {
//            return self.alert(
//                title: "Purchase unsuccessful!",
//                message: "Unable to complete purchase please try again later."
//            )
//        }
//
//        private func alertSuccess() {
//            return self.alert(
//                title: "Purchase Successful",
//                message: "You have ordered successfully, your order will be confirmed soon."
//            )
//        }
//
//        private func alert(title: String, message: String) {
//            let alertCtrl = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//            alertCtrl.addAction(UIAlertAction(title: "Okay", style: .cancel) { action in
//                self.navigationController?.popViewController(animated: true)
//            })
//
//            present(alertCtrl, animated: true, completion: nil)
//        }
    }
}
