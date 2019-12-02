//
//  ViewController.swift
//  Digital Bites
//
//  Created by Digital Bites on 01/12/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit
import Reachability

class ViewController: UIViewController {

    
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var reachability:Reachability?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DesignPart()
    }
    
    
    @IBAction func btnLoginTapped(_ sender: Any) {
        if(txtEmail.text! != "" && txtPassword.text! != ""){
            if(txtEmail.text! == "areeb" && txtPassword.text! == "areeb"){
                let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = mainstoryboard.instantiateViewController(withIdentifier: "TableViewViewController") as! TableViewViewController
                self.navigationController?.pushViewController(newViewController, animated: true)
            }
            else{
                let alert = UIAlertController(title: "ALERT", message: "Enter Correct Credentials", preferredStyle: .alert)
                let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                    print("Close")
                })
                alert.addAction(closeAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
        else{
            let alert = UIAlertController(title: "ALERT", message: "Please fill the required field", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnSignupTapped(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = mainstoryboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    func DesignPart(){
        viewEmail.layer.cornerRadius = 30
        viewEmail.clipsToBounds = true
        
        viewPassword.layer.cornerRadius = 30
        viewEmail.clipsToBounds = true
        
        btnLogin.layer.cornerRadius = 30
        btnLogin.clipsToBounds = true
    }

}



