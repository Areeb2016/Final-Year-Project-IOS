//
//  CategoryViewController.swift
//  DigitalBitesIOSAPP
//
//  Created by Digital Bites on 02/11/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var catCollectionView: UICollectionView!
    
    var restaurants: [Category] = []
    
    let transition = SlideInTransition()
    var topView: UIView?
    
    
    var dataInfo:NSMutableArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurants = createArray()
        
        self.title = "Category"
        self.navigationItem.hidesBackButton = false
        catCollectionView.showsLargeContentViewer = true
        
        catCollectionView.delegate = self
        catCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func viewTapped(_ sender: UIBarButtonItem) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = mainstoryboard.instantiateViewController(withIdentifier: "TableViewViewController") as! TableViewViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let restaurant = restaurants[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.setRestaurant(restaurant: restaurant)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 1
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func createArray() -> [Category]{
        var tempRestaurant: [Category] = []
        
        let restaurant1 = Category(image: #imageLiteral(resourceName: "smokey"), title: "Smokey Cauldron")
        let restaurant2 = Category(image: #imageLiteral(resourceName: "mordor"), title: "Mordor Cafe")
        let restaurant3 = Category(image: #imageLiteral(resourceName: "kimmun"), title: "Kim mun")
        let restaurant4 = Category(image: #imageLiteral(resourceName: "meikong"), title: "Mei Kong")
        let restaurant5 = Category(image: #imageLiteral(resourceName: "nandos"), title: "Nandos")
        let restaurant6 = Category(image: #imageLiteral(resourceName: "sattar"), title: "Sattar Baksh")
        
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

extension CategoryViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
