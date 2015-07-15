//
//  SignInViewController.swift
//  AutoLayout
//
//  Created by Saahil Chhabria on 15/07/15.
//  Copyright (c) 2015 Saahil Chhabria. All rights reserved.
//

import UIKit
import Foundation
class SignInViewController: UIViewController
{
    let ob = ViandsAPI()
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logIn(sender: UIButton) {
        if (self.phoneTextField.text != nil && self.passwordTextField.text != nil){
        let qos = Int(QOS_CLASS_USER_INITIATED.value)
        dispatch_async(dispatch_get_global_queue(qos, 0)) { () -> Void in
            self.ob.postLogin(["phone":"8277564501","password":"test"], url:URL.loginServerUrl) { (succeeded, msg) -> () in
                
            }
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.phoneTextField.text = nil
                self.passwordTextField.text = nil
            }

        }
        }
        else {
            println("One of the fields was empty i dare you to find out which")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationController?.navigationBar.barTintColor = UIColor.orangeColor()
        self.navigationController?.navigationItem.title = nil


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
