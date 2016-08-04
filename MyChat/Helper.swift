//
//  Helper.swift
//  MyChat
//
//  Created by naseem on 03/08/2016.
//  Copyright © 2016 naseem. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit
import GoogleSignIn

class Helper {
    static let helper = Helper()
    
    func LoginAnonymously() {
        print("login anonymously did tapped.")
        // anonymously log user in and switch view
        // switch view by setting navigation controller as root view controller
        
        // handles user authentication in our app
        FIRAuth.auth()?.signInAnonymouslyWithCompletion({ (anonymousUser: FIRUser?, error: NSError?) in
            if error == nil {
                print("UserId: \(anonymousUser!.uid)")
                
               self.switchToViewController()
                
            } else {
                print(error!.localizedDescription)
                return
            }
        })
    }

    func loginWithGoogle(authentication: GIDAuthentication) {
        
        let credintial = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken, accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signInWithCredential(credintial, completion: {(user: FIRUser?, error: NSError?) in
            if error != nil {
                print(error?.localizedDescription)
                return
            } else {
                print(user?.email)
                print(user?.displayName)
                self.switchToViewController()
            }
            
        })
    }
    
    private func switchToViewController() {
        
        // Create a storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // from main stroy board instiantiate a navigation controller
        let navVC = storyboard.instantiateViewControllerWithIdentifier("NavigationVC") as! UINavigationController
        
        
        // get app delegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // set navigation controller as root view controller
        appDelegate.window?.rootViewController = navVC
        
    }

}

