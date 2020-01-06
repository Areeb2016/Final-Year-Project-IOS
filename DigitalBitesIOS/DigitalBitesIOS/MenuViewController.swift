//
//  MenuViewController.swift
//  DigitalBitesIOSAPP
//
//  Created by Digital Bites on 08/11/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit

enum Menutype: Int{
    case home
    case camera
    case help
    case logout
}

class MenuViewController: UITableViewController {

    var didTapMenuType: ((Menutype) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = Menutype(rawValue: indexPath.row) else {return}
        dismiss(animated: true){ [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
