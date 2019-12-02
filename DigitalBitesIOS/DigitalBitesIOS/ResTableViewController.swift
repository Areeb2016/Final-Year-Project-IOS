//
//  ResTableViewController.swift
//  DigitalBitesIOS
//
//  Created by Digital Bites on 01/12/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit
import Alamofire

class ResTableViewController: UITableViewController {

    var pizzas: [Pizza] = []

        override func viewDidLoad() {
            super.viewDidLoad()

            navigationItem.title = "Select Pizza"

//            fetchInventory { pizzas in
//                guard pizzas != nil else { return }
//                self.pizzas = pizzas!
//                self.tableView.reloadData()
//            }
        }
    

        @IBAction func ordersButtonPressed(_ sender: Any) {
            performSegue(withIdentifier: "orders", sender: nil)
        }

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pizzas.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Pizza", for: indexPath) as! ResTableViewCell

            cell.name.text = pizzas[indexPath.row].name
            cell.imageView?.image = pizzas[indexPath.row].image
            cell.amount.text = "$\(pizzas[indexPath.row].amount)"
            cell.miscellaneousText.text = pizzas[indexPath.row].description

            return cell
        }

        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100.0
        }

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "pizza", sender: self.pizzas[indexPath.row] as Pizza)
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "pizza" {
                guard let vc = segue.destination as? FoodViewController else { return }
                vc.pizza = sender as? Pizza
            }
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
