//
//  ViewController.swift
//  MyFirstApp
//
//  Created by webonise on 25/10/16.
//  Copyright © 2016 Webonise Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onButtonTapped(_ sender: AnyObject) {
        
        let whitespace = NSCharacterSet.whitespaces
        
        let range = textFieldPassword.text?.rangeOfCharacter(from: whitespace)
        
        
        if (textFieldUsername.text!).isEmpty {
            showAlert("username Field should not be empty")
        } else if (textFieldPassword.text!).isEmpty {
            showAlert("Password Field should not be empty")
        } else if range != nil {
            showAlert("Password contains white spaces");
        } else if textFieldUsername.text != "murtaza" && textFieldPassword.text != "murtaza" {
            showAlert("Bad username or Bad password");
        } else {
            showAlert("Logged in successfully");
        }
   
    }
    
    internal func showAlert(_ messageToBeShown: String) {
        let alertController = UIAlertController(title: "Hey AppCoda", message: messageToBeShown, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

