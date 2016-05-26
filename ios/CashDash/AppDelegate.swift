//
//  AppDelegate.swift
//  CashDash
//
//  Created by Kevin Zhang on 5/26/16.
//  Copyright © 2016 theanimasian. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		
		window = UIWindow(frame: UIScreen.mainScreen().bounds)
		
		let config = ParseClientConfiguration(block: {
			(ParseMutableClientConfiguration) -> Void in
			ParseMutableClientConfiguration.applicationId = "KeSeybm7QVaTSxFmYrQ2UEaCUJPSdyrWjeaZqHWq"
			ParseMutableClientConfiguration.clientKey = "2j5rMI29tTCLHb01lXxqUo64pWOeLeFT4l3b5BUI"
			ParseMutableClientConfiguration.server = "http://cap-cashdash.herokuapp.com/parse"
		})
		
		Parse.initializeWithConfiguration(config)
		
		var loggedIn = false
		
		// check for existing PFUser
		if !loggedIn {
			if let user = PFUser.currentUser() {
				CDAuthenticationConstants.user = user
				loggedIn = true
				
				print("Found existing user \(user.username); logging in and going to home screen!")
			} else {
				print("Unable to find existing user; searching in stored memory for login credentials")
			}
		}
		
		// check for stored credentials in NSUserDefaults
		if !loggedIn {
			// find username
			if let username = NSUserDefaults.standardUserDefaults().valueForKey("username") as? String {
				// save username
				CDAuthenticationConstants.username = username
				
				print("Username \(username) was found")
			} else {
				print("No username was found")
			}
			
			// find password
			if let password = NSUserDefaults.standardUserDefaults().valueForKey("password") as? String {
				// save password
				CDAuthenticationConstants.password = password
				loggedIn = true
				
				print("Password was found")
			} else {
				print("No password was found")
			}
			
			print("Attempting to login now")
			
			// TODO ======================================================================================================
			// TODO ======================================================================================================
			// TODO ======================================================================================================
			// TODO ======================================================================================================
			// TODO ======================================================================================================
			// TODO ======================================================================================================
		}
		
		window?.rootViewController = loggedIn ? CDHomeScreenController() : CDLoginViewController()
		window?.makeKeyAndVisible()
		
		//		let q = PFUser.query()
		//		q?.findObjectsInBackgroundWithBlock({ (objs, error) in
		//			guard error == nil else {
		//				print("Parse query failed with error \(error!)")
		//				return
		//			}
		//			
		//			print(objs)
		//		})
		
		return true
	}
	
	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}
	
	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}
	
	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}
	
	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}
	
	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
	
	
}

