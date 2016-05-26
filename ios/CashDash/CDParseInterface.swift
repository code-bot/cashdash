//
//  CDParseInterface.swift
//  CashDash
//
//  Created by Kevin Zhang on 5/26/16.
//  Copyright © 2016 theanimasian. All rights reserved.
//

import UIKit
import Parse

class CDParseInterface: NSObject {
	static func register(username: String, pw: String, phone: Int, first: String, last: String, completion: (() -> ())? = nil) {
		let new_user = PFUser()
		new_user.username = username
		new_user.password = pw
		new_user["first_name"] = first
		new_user["last_name"] = last
		new_user["phone"] = phone
		
		new_user.signUpInBackgroundWithBlock { (success, error) in
			guard error == nil else {
				CDLog("Login in the background failed with error \(error!.localizedDescription)")
				return
			}
			
			NSUserDefaults.standardUserDefaults().setValue(username, forKey: "username")
			NSUserDefaults.standardUserDefaults().setValue(pw, forKey: "password")
			
			CDLog("Sucessfully signed up with username \(username), current user is now \(PFUser.currentUser()!); requesting tracking now")
			self.login()
			
			CDLocationManager.sharedInstance.requestPermissions()
			
			completion?()
		}
	}
	
	static func login() {
		guard CDAuthenticationConstants.username != nil else {
			CDLog("Login failed, stored username is nil")
			return
		}
		guard CDAuthenticationConstants.password != nil else {
			CDLog("Login failed, stored password is nil")
			return
		}
		
		PFUser.logInWithUsernameInBackground(CDAuthenticationConstants.username!, password: CDAuthenticationConstants.password!) { (user, error) in
			guard error == nil else {
				CDLog("Login failed with error \"\(error!.localizedDescription)\"")
				return
			}
			
			print("Successfully logged in")
		}
	}
	
	static func logout() {
		NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "username")
		NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "password")
		PFUser.logOut()
	}
}
