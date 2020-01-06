//
//  TableViewViewController.swift
//  DigitalBitesIOSAPP
//
//  Created by Digital Bites on 08/11/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var restaurants: [Table] = []
    
    let transition = SlideInTransition()
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurants = createArray()
        
        self.title = "Home"
        self.navigationItem.hidesBackButton = false
        tableView.showsLargeContentViewer = true
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else {return}
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    func transitionToNew(_ menuType: Menutype){
        let title = String(describing: menuType).capitalized
        self.title = title
        
        topView?.removeFromSuperview()
        switch menuType {
        case .help:
            let view = UIView()
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = mainstoryboard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
            self.title = "Help & Support"
            self.topView = view
        case .camera:
            let view = UIView()
            view.backgroundColor = .green
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .logout:
            let view = UIView()
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
            self.topView = view
        default:
            break
        }
    }
    
    func createArray() -> [Table]{
        var tempRestaurant: [Table] = []
        
        let restaurant1 = Table(image: #imageLiteral(resourceName: "smokey"), title: "Smokey Cauldron")
        let restaurant2 = Table(image: #imageLiteral(resourceName: "mordor"), title: "Mordor Cafe")
        let restaurant3 = Table(image: #imageLiteral(resourceName: "kimmun"), title: "Kim mun")
        let restaurant4 = Table(image: #imageLiteral(resourceName: "meikong"), title: "Mei Kong")
        let restaurant5 = Table(image: #imageLiteral(resourceName: "nandos"), title: "Nandos")
        let restaurant6 = Table(image: #imageLiteral(resourceName: "sattar"), title: "Sattar Baksh")
        
        tempRestaurant.append(restaurant1)
        tempRestaurant.append(restaurant2)
        tempRestaurant.append(restaurant3)
        tempRestaurant.append(restaurant4)
        tempRestaurant.append(restaurant5)
        tempRestaurant.append(restaurant6)
        
        return tempRestaurant
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

extension TableViewViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = restaurants[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        cell.setRestaurant(restaurant: restaurant)
        
        return cell
    }
}

extension TableViewViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
