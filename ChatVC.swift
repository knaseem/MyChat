//
//  ChatVC.swift
//  MyChat
//
//  Created by naseem on 02/08/2016.
//  Copyright © 2016 naseem. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutDidTapped(sender: AnyObject) {
        // switch user back to log in view when user logs out
        
        // Create a storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // from main stroy board instiantiate a view controller
        let loginVC = storyboard.instantiateViewControllerWithIdentifier("loginVC") as! LoginInVC
        
        
        // get app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // set login view controller as root view controller
        appDelegate.window?.rootViewController = loginVC
        
        print("User logged out")
        
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
