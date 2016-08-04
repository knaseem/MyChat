//
//  LoginInVC.swift
//  MyChat
//
//  Created by naseem on 02/08/2016.
//  Copyright © 2016 naseem. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginInVC: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var anonymousButtonBorder: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set login anonymously button border
        anonymousButtonBorder.layer.borderWidth = 2.0
        anonymousButtonBorder.layer.borderColor = UIColor.whiteColor().CGColor
        
        GIDSignIn.sharedInstance().clientID = "973046665271-91utjckcnk4idcrcgq0osl91fcefjj61.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
       
    }

    @IBAction func LoginAnonymouslyDidTapped(sender: AnyObject) {
        print("login anonymously did tapped.")
        // anonymously log user in and switch view
        // switch view by setting navigation controller as root view controller
        Helper.helper.LoginAnonymously()
        
    }

    @IBAction func GoogleLoginDidTapped(sender: AnyObject) {
        print("google login did tapped.")
        
        GIDSignIn.sharedInstance().signIn()
        
               
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if error != nil {
            print(error.localizedDescription)
            return
        }
        print(user.authentication)
        Helper.helper.loginWithGoogle(user.authentication)
        
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
