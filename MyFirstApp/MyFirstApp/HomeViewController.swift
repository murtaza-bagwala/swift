//
//  HomeViewController.swift
//  MyFirstApp
//
//  Created by webonise on 27/10/16.
//  Copyright © 2016 Webonise Lab. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var labelSuccess: UILabel!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        // let controllers : [UIViewController] = (self.navigationController?.viewControllers)!
        
        }
        
    

    @IBAction func buttonTapped(_ sender: AnyObject) {
        let button = sender as? UIButton
        print("Button clicked" + (button?.currentTitle)!)
        if button == buttonNext {
            let editViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController
            self.navigationController?.pushViewController(editViewController!, animated: true)
        } else {
            
            self.navigationController!.popViewController(animated: true);

        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
