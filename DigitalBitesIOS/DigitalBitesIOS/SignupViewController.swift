//
//  SignupViewController.swift
//  DigitalBitesIOSAPP
//
//  Created by Digital Bites on 25/10/2019.
//  Copyright © 2019 Digital Bites. All rights reserved.
//

import UIKit
import Reachability

class SignupViewController: UIViewController {

    @IBOutlet weak var viewUsername: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var viewReEnterPass: UIView!
    @IBOutlet weak var btnSignup: UIButton!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtReEnterPass: UITextField!
    
    var reachability: Reachability?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DesignPart()
    }
    
    @IBAction func btnSignupTapped(_ sender: Any) {
        if txtUsername.text! != "" && txtEmail.text! != "" && txtPhone.text! != "" && txtPassword.text! != "" && txtReEnterPass.text! != ""{
            if isValidEmailAddress(emailAddressString: txtEmail.text!){
                let alert = UIAlertController(title: "ALERT", message: "Please enter correct email address", preferredStyle: .alert)
                let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                    print("Close")
                })
                alert.addAction(closeAction)
                self.present(alert, animated: true, completion: nil)
            }
            else if txtPassword.text! != txtReEnterPass.text!{
                let alert = UIAlertController(title: "ALERT", message: "Password donot match", preferredStyle: .alert)
                    let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
                        print("Close")
                    })
                    alert.addAction(closeAction)
                    self.present(alert, animated: true, completion: nil)
            }
            else if isValidPhoneNumber(phoneNumberString: txtPhone.text!){
                let alert = UIAlertController(title: "ALERT", message: "Please enter your correct phone number", preferredStyle: .alert)
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
    func DesignPart(){
        viewUsername.layer.cornerRadius = 30
        viewUsername.clipsToBounds = true
        
        viewEmail.layer.cornerRadius = 30
        viewEmail.clipsToBounds = true
        
        viewPhone.layer.cornerRadius = 30
        viewPhone.clipsToBounds = true
        
        viewPassword.layer.cornerRadius = 30
        viewPassword.clipsToBounds = true
        
        viewReEnterPass.layer.cornerRadius = 30
        viewReEnterPass.clipsToBounds = true
        
        btnSignup.layer.cornerRadius = 30
        btnSignup.clipsToBounds = true
    }
    
      func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    func isValidPhoneNumber(phoneNumberString: String) -> Bool {
        
        var returnValue = true
        let phoneRegEx = "^\\d{4}-\\d{7}$"
        
        do {
            let regex = try NSRegularExpression(pattern: phoneRegEx)
            let nsString = phoneNumberString as NSString
            let results = regex.matches(in: phoneNumberString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
//    func apiCalling(){
//        do{
//            self.reachability = try Reachability.init()
//        }
//        catch{
//            print("Unable to start notifier")
//        }
//        if((reachability!.connection) != .none){
//           // MBProgressHUD.showAdded(to: self.view, animated: true)
//
//            let params = [
//                "name":self.txtUsername.text!.trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject,
//                "email":self.txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject,
//                "mobile_no":self.txtPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject,
//                "password":self.txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject,
//                "device_id":"123456".trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject,
//                "device":"iphone".trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject,
//            ]
//
//            let encodeURL = apiSignup
//
        //    let requestofAPI = AF_ROUTE.request(encodeURL, method: .post, parameters: params, encoding: JSONEncoder.default, headers: nil, interceptor: nil)
            
       //     requestofAPI.responseJSON(completionHandler: {(response)  -> Void in
        //        print(response.request!)
        //        print(response.result)
        //          print(response.response)
                
//                switch response.result{
//                case .success(let payload):
//                   // MBProgressHUD.hide(for: self.view, animated: true)
//                    if let x = payload as? Dictionary<String,AnyObject>
//                    {
//                        print(x)
//                        let resultValue = x as NSDictionary
//                        let code = resultValue["result"] as! String
//                        let message = resultValue["message"] as! String
//
//                        if code == "1"
//                        {
//                            let data = resultValue["data"] as! NSDictionary
//                            let token = resultValue["token"] as! String
//                            let userId = data["id"] as! Int
//
//
//
//                        }
//                        else{
//                            let alert = UIAlertController(title: "ALERT", message: "\(message)", preferredStyle: .alert)
//                            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                                print("Close")
//                            })
//                            alert.addAction(closeAction)
//                            self.present(alert, animated: true, completion: nil)
//                        }
//                    }
//                case .failure(let error):
//                    print(error)
//                    let alert = UIAlertController(title: "ALERT", message: "App can't connect to server", preferredStyle: .alert)
//                    let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                        print("Close")
//                    })
//                    alert.addAction(closeAction)
//                    self.present(alert, animated: true, completion: nil)
//                }
//            })
//        }
//        else{
//            let alert = UIAlertController(title: "ALERT", message: "Please check your Internet connection", preferredStyle: .alert)
//            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: {action in
//                print("Close")
//            })
//            alert.addAction(closeAction)
//            self.present(alert, animated: true, completion: nil)
//        }
//    }

}
