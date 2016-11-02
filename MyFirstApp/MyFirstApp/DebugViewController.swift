//
//  DebugViewController.swift
//  MyFirstApp
//
//  Created by webonise on 02/11/16.
//  Copyright © 2016 Webonise Lab. All rights reserved.
//

import UIKit

class DebugViewController: UIViewController {

    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: AnyObject) {
        let button = sender as? UIButton
        if button == buttonNext {
            let fileViewController = self.storyboard?.instantiateViewController(withIdentifier: "FileViewController") as? FileViewController
            self.navigationController?.pushViewController(fileViewController!, animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
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
