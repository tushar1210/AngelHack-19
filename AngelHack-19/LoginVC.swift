//
//  LoginVC.swift
//  AngelHack-19
//
//  Created by Tushar Singh on 04/05/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON
class LoginVC: UIViewController {

    @IBOutlet weak var userNameTf: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendButton(_ sender: Any) {
        if userNameTf.text != "" && passwordTF.text != ""{
            let userRef = Database.database().reference().child("User").child(userNameTf.text!)
            userRef.observe(.value) { (data) in
                let json = JSON(data.value)
                print(json)
                if self.userNameTf.text == json["userName"].stringValue && self.passwordTF.text == json["pass"].stringValue {
                    //segue
                    self.performSegue(withIdentifier: "1", sender: nil)
                    print("sdfsS")
                }
                else{
                    let alert = UIAlertController(title: "Invalid Credentials", message: "Please enter valid Username or Password", preferredStyle: .alert)
                    alert.view.tintColor = .red
                    let alertAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
                    alert.addAction(alertAction)
                    self.present(alert,animated: true)
                }
            }
        }else{
            let alert = UIAlertController(title: "Required Fields Missing", message: "Username and Password fields can't be empty ", preferredStyle: .alert)
            alert.view.tintColor = .red
            let alertAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert,animated: true)
        }
    }
}
