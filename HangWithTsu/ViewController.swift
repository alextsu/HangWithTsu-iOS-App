//
//  ViewController.swift
//  HangWithTsu
//
//  Created by Alexander Tsu on 5/2/16.
//  Copyright © 2016 Alexander Tsu. All rights reserved.
//

import UIKit




class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            // User is already logged in, do work such as go to next view controller.

            let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name,picture.width(100).height(100)"], tokenString: FBSDKAccessToken.currentAccessToken().tokenString, version: nil, HTTPMethod: "GET")
            req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
                if(error == nil)
                {
                    print("result \(result)")
                }
                else
                {
                    print("error \(error)")
                }
            })
            
            
            
            dispatch_async(dispatch_get_main_queue()) {
                self.performSegueWithIdentifier("continueAfterLogin", sender: nil)
            }
        }
        else {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        print("User Logged In")
        
        if ((error) != nil){
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            returnUserData()
            
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email") {
                // Do work
                
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("log out")
    }
    
    func returnUserData()
    {
        
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                if let userName : NSString = result.valueForKey("name") as? NSString {
                    print("User Name is: \(userName)")
                }
                
                
                
                /*
                let userEmail : NSString = result.valueForKey("email") as! NSString
                print("User Email is: \(userEmail)")*/
            }
        })
    }
}

