//
//  OrdersTableViewController.swift
//  DigitalBitesIOS
//
//  Created by Digital Bites on 01/12/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit
import Alamofire

class OrdersTableViewController: UITableViewController {

        var orders: [Order] = []

            override func viewDidLoad() {
                super.viewDidLoad()
                navigationItem.title = "Orders"

                fetchOrders { orders in
                    self.orders = orders!
                    self.tableView.reloadData()
                }
            }

            private func fetchOrders(completion: @escaping([Order]?) -> Void) {
                Alamofire.request("http://127.0.0.1:4000/orders").validate().responseJSON { response in
                    guard response.result.isSuccess else { return completion(nil) }

                    guard let rawOrders = response.result.value as? [[String: Any]?] else { return completion(nil) }

                    let orders = rawOrders.flatMap { ordersDict -> Order? in
                        guard let orderId = ordersDict!["id"] as? String,
                              let orderStatus = ordersDict!["status"] as? String,
                              var pizza = ordersDict!["pizza"] as? [String: Any] else { return nil }

                        pizza["image"] = UIImage(named: pizza["image"] as! String)

                        return Order(
                            id: orderId,
                            pizza: Pizza(data: pizza),
                            status: OrderStatus(rawValue: orderStatus)!
                        )
                    }

                    completion(orders)
                }
            }

            @IBAction func closeButtonPressed(_ sender: Any) {
                dismiss(animated: true, completion: nil)
            }

            override func numberOfSections(in tableView: UITableView) -> Int {
                return 1
            }

            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return orders.count
            }

            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "order", for: indexPath)
                let order = orders[indexPath.row]

                cell.textLabel?.text = order.pizza.name
                cell.imageView?.image = order.pizza.image
                cell.detailTextLabel?.text = "$\(order.pizza.amount) - \(order.status.rawValue)"

                return cell
            }

            override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 100.0
            }

            override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                performSegue(withIdentifier: "order", sender: orders[indexPath.row] as Order)
            }

            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "order" {
                    guard let vc = segue.destination as? OrderViewController else { return }
                    vc.order = sender as? Order
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
