//
//  AppDelegate.swift
//  Salado
//
//  Created by Rz on 17/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import CoreData
import FBSDKCoreKit
import FBSDKCoreKit
import Firebase
import FirebaseCore
import FirebaseMessaging
import FirebaseMessaging
import FBSDKLoginKit
import GGLSignIn
import Google
import GoogleSignIn
import GoogleToolboxForMac
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate  {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        

        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar=false

        UserDefaults.standard.set("D", forKey: "Click")
        UserDefaults.standard.set("D", forKey: "BackClick")
   
        
            let nav:UINavigationController=UINavigationController.init()

        //first time login
        
        let isUserLoggedIn:Bool = UserDefaults.standard.bool(forKey: "ISLOGGEDIN")
       
        print(isUserLoggedIn)
        if(isUserLoggedIn==true) {
            
  
          
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
            
            
            
            
            let protectedPageNav = UINavigationController(rootViewController: des)
            protectedPageNav.navigationBar.tintColor=UIColor.white
            protectedPageNav.navigationBar.barTintColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
            
            self.window?.rootViewController = protectedPageNav
            
            
        }
        else {
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "ViewController") as! ViewController
         nav.pushViewController(des, animated: true)
            
        }
        

        
        
        
        
        
        
        //facebook
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        FIRApp.configure()
        
                FIRDatabase.database().persistenceEnabled = true
        
        
        let all0 = FIRDatabase.database().reference(withPath:"User")
        all0.keepSynced(true)
        
                let all = FIRDatabase.database().reference(withPath:"OrderFood")
                all.keepSynced(true)
        
        
        
        let all2 = FIRDatabase.database().reference(withPath:"DoctorAppintments")
              all2.keepSynced(true)
        
        
        let all3 = FIRDatabase.database().reference(withPath:"Dish")
               all3.keepSynced(true)
        
        let all4 = FIRDatabase.database().reference(withPath:"MedicalPanelData")
           all4.keepSynced(true)

        
        let all1 = FIRDatabase.database().reference(withPath:"StandardDietProgram")
                all1.keepSynced(true)
        
        
        let al6 = FIRDatabase.database().reference(withPath:"UserDietProgram")
        al6.keepSynced(true)
        
        

        
        let al5 = FIRDatabase.database().reference(withPath:"DishGroup")
        al5.keepSynced(true)
        
        //gmail
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
        
       // GIDSignIn.sharedInstance().clientID="524319677684-e2eo103dg1pr76h3nmc0bjfli7rugnu1.apps.googleusercontent.com"//FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
         GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        


        return true
    }
    func application(_ application: UIApplication,
                      open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,
                                                    sourceApplication: sourceApplication,
                                                    annotation: annotation)
    }
    

    
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            //let userId = user.userID                  // For client-side use only!
            //let idToken = user.authentication.idToken // Safe to send to the server
            let name = user.profile.name
            //let email = user.profile.email
            
            print("User name \(name)")
            
            
            // [START_EXCLUDE]
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: "ToggleAuthUINotification"),
                object: nil,
                userInfo: ["statusText": "Signed in user:\n\(name)"])
            
            
            
            
            // [END_EXCLUDE]
            
            
//            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
//            let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
//            
//            
//            
//            
//            let protectedPageNav = UINavigationController(rootViewController: des)
//            
//            self.window?.rootViewController = protectedPageNav
            
            
//            
        } else {
            print("\(error.localizedDescription)")
            // [START_EXCLUDE silent]
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: "ToggleAuthUINotification"), object: nil, userInfo: nil)
            // [END_EXCLUDE]
        }
    }
//    func signIn(_ signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
//                withError error: NSError!) {
//        if (error == nil) {
//            // Perform any operations on signed in user here.
//            //let userId = user.userID                  // For client-side use only!
//            //let idToken = user.authentication.idToken // Safe to send to the server
//            let name = user.profile.name
//            //let email = user.profile.email
//            
//            print("User name \(name)")
//            
//            
//            // [START_EXCLUDE]
//            NotificationCenter.default.post(
//                name: Notification.Name(rawValue: "ToggleAuthUINotification"),
//                object: nil,
//                userInfo: ["statusText": "Signed in user:\n\(name)"])
//            
//            
//            
//  
//            // [END_EXCLUDE]
//            
//            
//            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
//            let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
//            
//            
//     
//            
//            let protectedPageNav = UINavigationController(rootViewController: des)
//            
//            self.window?.rootViewController = protectedPageNav
//            
//        } else {
//            print("\(error.localizedDescription)")
//            // [START_EXCLUDE silent]
//            NotificationCenter.default.post(
//                name: Notification.Name(rawValue: "ToggleAuthUINotification"), object: nil, userInfo: nil)
//            // [END_EXCLUDE]
//        }
//    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: "ToggleAuthUINotification"),
            object: nil,
            userInfo: ["statusText": "User has disconnected."])
    }
   func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    
    func applicationWillTerminate(application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
    }
    
    
    
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool
    {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url as URL!, sourceApplication: sourceApplication, annotation: annotation)
    }

  
    

    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url as URL!,
                                                          sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                           annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
    
    
    
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
//              withError error: Error!) {
//        // Perform any operations when the user disconnects from app here.
//        // [START_EXCLUDE]
//        NotificationCenter.default.post(
//            name: Notification.Name(rawValue: "ToggleAuthUINotification"),
//            object: nil,
//            userInfo: ["statusText": "User has disconnected."])
//        // [END_EXCLUDE]
//    }
    

    

    
       // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Salado")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

