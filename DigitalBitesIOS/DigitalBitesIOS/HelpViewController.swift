//
//  HelpViewController.swift
//  DigitalBitesIOSAPP
//
//  Created by Digital Bites on 08/11/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    let transition = SlideInTransition()
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        case .home:
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = mainstoryboard.instantiateViewController(withIdentifier: "TableViewViewController") as! TableViewViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
        case .camera:
            let view = UIView()
            view.backgroundColor = .green
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .logout:
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
        default:
            break
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
extension HelpViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
