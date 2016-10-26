//
//  ViewController.swift
//  MyFirstApp
//
//  Created by webonise on 25/10/16.
//  Copyright © 2016 Webonise Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    @IBAction func OnButtonClicked(_ sender: AnyObject) {
        
        
        let whitespace = NSCharacterSet.whitespaces
       
        let range = passwordTextField.text?.rangeOfCharacter(from: whitespace)
        
        // range will be nil if no whitespace is found
        if range != nil {
            showAlert("Password contains white spaces");
        }
    
        if (passwordTextField.text!).isEmpty {
            showAlert("Password Field should not be empty")
        }
        if (usernameTextField.text!).isEmpty {
            showAlert("username Field should not be empty")
        }
        
        if usernameTextField.text == "murtaza" && passwordTextField.text == "murtaza" {
            showAlert("Logged in successfully");
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func showAlert(_ messageToBeShown: String) {
        let alertController = UIAlertController(title: "Hey AppCoda", message: messageToBeShown, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }


}

