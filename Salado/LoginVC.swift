//
//  ViewController.swift
//  Salado
//
//  Created by Rz on 17/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import FBSDKShareKit
import GoogleSignIn
import Google
import Firebase
import FirebaseDatabase
struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6_7          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P_7P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
}
class ViewController: UIViewController,FBSDKLoginButtonDelegate,GIDSignInDelegate,GIDSignInUIDelegate {
    @IBOutlet weak var btnlogin: UIButton!
    
    
    @IBOutlet weak var gmailtop: NSLayoutConstraint!
    @IBOutlet weak var cenerx: NSLayoutConstraint!
    @IBOutlet weak var width: NSLayoutConstraint!
    
    @IBOutlet weak var logincrbg: UIImageView!
    @IBOutlet weak var txtpass: UITextField!
    @IBOutlet weak var txtuname: UITextField!
    @IBOutlet weak var btngmail: GIDSignInButton!
    var u=[String]()
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    var _email:String!
    var _username:String!
    var _mobileno:String!
    var _address:String!
    var _userid:String!
    var _userloginId:String!
    var dataref: FIRDatabaseReference!
    @IBOutlet weak var btnfb: FBSDKLoginButton!
    var obj:User!
    let login: FBSDKLoginManager = FBSDKLoginManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        self.btnfb.delegate = self
        
        if (FBSDKAccessToken.current() != nil)
        {
            //performSegueWithIdentifier("unwindToViewOtherController", sender: self)
        }
        else
        {
            btnfb.readPermissions = ["public_profile", "email", "user_friends"]
        }
        
        
       
       txtuname.backgroundColor=UIColor.clear
        txtuname.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        txtuname.layer.borderWidth=2
        txtuname.layer.cornerRadius=5
        
        //navigationController?.navigationBar.barTintColor=UIColor(red: 2/255, green: 174/255, blue: 239/255, alpha: 1)
        navigationController?.navigationBar.isHidden=true
        
        btnlogin.layer.cornerRadius=5
        self.navigationController?.navigationBar.tintColor=UIColor.white
     
       
     
       let gmail=GIDSignInButton.init()
        
        
        
        
        
//        var verspace=NSLayoutConstraint(item:gmail, attribute: .top, relatedBy: .equal, toItem:btnfb, attribute: .bottom, multiplier: 1, constant: 10)
//        
//        NSLayoutConstraint.activate([verspace])
        
        
        
//        GIDSignIn.sharedInstance().signIn()
   
        GIDSignIn.sharedInstance().delegate=self
         // GIDSignIn.sharedInstance().uiDelegate = self
       GIDSignIn.sharedInstance().clientID="524319677684-e2eo103dg1pr76h3nmc0bjfli7rugnu1.apps.googleusercontent.com"
        // Do any additional setup after loading the view, typically from a nib.
      
          gmail.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(gmail)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        
        view.addGestureRecognizer(tap)
              GIDSignIn.sharedInstance().uiDelegate = self
        
       
        
        
        
        
        let newView = UIView()
        newView.backgroundColor = UIColor.red
     gmail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newView)
        
        let horizontalConstraint = NSLayoutConstraint(item: gmail, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: gmail, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: btnfb, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant:25)
        let w=(logincrbg.bounds.width*0.7)
        var widthgmail:CGFloat!
        
        
        
        let modelName = UIDevice.current.modelName
        
        print(modelName)
        if DeviceType.IS_IPHONE_6P_7P {
            widthgmail=btnfb.bounds.width
            print("IS_IPHONE_6P_7P")
        }
        else if DeviceType.IS_IPHONE_5{
            print("IS_IPHONE_5")
            widthgmail=w-30
            
        }
        else if DeviceType.IS_IPHONE_4_OR_LESS
        {
            widthgmail=w-20
            print("IS_IPHONE_4 less")
        }
        else{
            widthgmail=btnfb.bounds.width-20
        }
        let widthConstraint = NSLayoutConstraint(item: gmail, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem:nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:widthgmail)
     
        let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 20)
        
        view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
  
        
        
        
        
    
        
        
        
        
        
        
        btnfb.addTarget(self, action: #selector(handleCustomFBLogin), for: UIControlEvents.touchUpInside)
    }
    
        func handleCustomFBLogin(){
            
            //  FBSDKLoginManager().logIn(withReadPermissions: ["email","public_profile"], from: self)
            //   { (result, error) -> Void in
            //  if error != nil {
            //   print("custom FB Login Failed",error)
            //       }
            //}
            //signInWithFacebook()
          self.showEmail()
            print(123)
        }
    func logInToBackendServerAuthIdToken(){
        let user = GIDSignIn.sharedInstance().currentUser
       // print(user!) // fatal error: unexpectedly found nil
    }
    func signInWithFacebook()
    {
        if (FBSDKAccessToken.current() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            print("already logged in ")
            self.returnUserData()
            
            return
        }
        let faceBookLoginManger = FBSDKLoginManager()
        faceBookLoginManger.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], handler: { (result, error)-> Void in
            //result is FBSDKLoginManagerLoginResult
            if (error != nil)
            {
                print("error is \(error)")
            }
            if (result?.isCancelled)!
            {
                //handle cancelations
            }
            if (result?.grantedPermissions.contains("email"))!
            {
                self.returnUserData()
            }
        })
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("the access token is \(FBSDKAccessToken.current().tokenString)")
                
                var accessToken = FBSDKAccessToken.current().tokenString
                
               // var userID = result. //result.valueForKey("id") as! AnyObject
                //var facebookProfileUrl = "http://graph.facebook.com/\(userID)/picture?type=large"
                
                
                
                print("fetched user: \(result)")
                
                
            }
        })
    }
    
        func showEmail()
        {
            
            
            login.logIn(withReadPermissions: ["email", "public_profile"], from: self, handler: {(result, error) -> Void in
                
                if error != nil {
                    // Handle Error
                    NSLog("Process error")
                } else if (result?.isCancelled)! {
                    // If process is cancel
                    NSLog("Cancelled")
                }
                else {
                    // Parameters for Graph Request
                    let parameters = ["fields": "email, name"]
                    
                    FBSDKGraphRequest(graphPath: "me", parameters: parameters).start {(connection, result, error) -> Void in
                        if error != nil {
                            NSLog(error.debugDescription)
                            return
                        }
                        
                        // Result
                        print("Result: \(result)")
                        
                        // Handle vars
                        if let result = result as? [String:String],
                            let email: String = result["email"],
                            let fbId: String = result["id"] {
                            print("Email: \(email)")
                            print("fbID: \(fbId)")
                        }
                    }
                }
            })
            
//            FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "email, id, name"]).start {
//                (connection, result, err) in
//                if(err == nil)
//                {
//                    print("result \(result)")
//                }
//                else
//                {
//                    print("error \(err)")
//                }
//            }
            
        }

    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        //myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
        logInToBackendServerAuthIdToken()
        print("Sign in presented")
        
    }
    
    
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let name = user.profile.name
            let email = user.profile.email
            
            let url = NSURL(string:  "https://www.googleapis.com/oauth2/v3/userinfo?access_token=\(user.authentication.accessToken)")
            let session = URLSession.shared
            session.dataTask(with: url! as URL) {(data, response, error) -> Void in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                do {
                    let userData = try JSONSerialization.jsonObject(with: data!, options:[]) as? [String:AnyObject]
                    /*
                     Get the account information you want here from the dictionary
                     Possible values are
                     "id": "...",
                     "email": "...",
                     "verified_email": ...,
                     "name": "...",
                     "given_name": "...",
                     "family_name": "...",
                     "link": "https://plus.google.com/...",
                     "picture": "https://lh5.googleuserco...",
                     "gender": "...",
                     "locale": "..."
                     
                     so in my case:
                     */
                    let gender = userData!["gender"] as! String
                    let locale = userData!["locale"] as! String
                    
                    
                    
                    print(gender)
                } catch {
                    NSLog("Account Information could not be loaded")
                }
            }
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
        
        print("Sign in dismissed")
    }
    
    

    
    
    override func viewDidAppear(_ animated: Bool) {
        let nav:UINavigationController=UINavigationController.init()
        let userDefault = UserDefaults.standard
        let savedData = userDefault.bool(forKey: "ISLOGGEDIN")
        
              if(savedData){
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
            
            nav.pushViewController(des, animated: true)
        }else{
            print("not allow")
            
        }

    }
    
    func registreruser(values:[String:AnyObject])
    {
        
        
        let dataref=FIRDatabase.database().reference()
        
        // let chref=FIRDatabase.database().reference(withPath: "Registration")
        dataref.child("User").childByAutoId().setValue(values)
        let key=dataref.key
        print(key)
        print("In post")
        
        let register1 = UIAlertController(title: "Registration Succesfull...!", message: "Congratulations, You have Registered Sucessfully...!! ", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .default, handler:{
            action in
            
            //self.dismiss(animated: true, completion: nil)
            
            
        })
        
        
        
        register1.addAction(cancelAction)
        
        self.present(register1, animated: true, completion: {  })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Loginclick(_ sender: Any) {
        
        
        
        
        if(txtuname.text=="" )
        {
            let passwordcheck = UIAlertController(title: "Error", message: "Please Enter Mobile Number", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            present(passwordcheck, animated: true, completion: {  })
            
        }
       
        
        else{
            
            if((txtuname.text?.characters.count)! < 10 || (txtuname.text?.characters.count)! < 10)
            {
                let passwordcheck = UIAlertController(title: "Error", message: "Please Enter Correct Mobile Number", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                present(passwordcheck, animated: true, completion: {  })
            }
            
            if((txtuname.text?.characters.count)! == 10 )
            {

            
            self.userlogin()
            }


            
        }

        
        
        
        
        
       // performSegue(withIdentifier: "squetoDashborad", sender: nil)
    }
    func dismissKeyboard() {
        
        
        
        view.endEditing(true)
        
        //textmsg.resignFirstResponder()
        
    }
   func configureFacebook()
    {
    btnfb.readPermissions = ["public_profile", "email", "user_friends"];
    btnfb.delegate = self
    }
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
    
    
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    
    }
    
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name"]).start { (connection, result, error) -> Void in
            print(result!)
            

    }
    }
    
        func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
        {
            let loginManager: FBSDKLoginManager = FBSDKLoginManager()
            loginManager.logOut()
            
        }
        
   
    
    
    // pressed the Sign In button
    
  
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        
    }
    
    
    
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
 
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error) != nil{
            print(error)
        }
        else{
            //performSegue(withIdentifier: "", sender: <#T##Any?#>)
        }
    }
    
    
    
    
    
    
    func userlogin()
    {
        
        
        showActivityIndicator()
        dataref=FIRDatabase.database().reference()
        UserDefaults.standard.set("1", forKey: "Login")
        
        dataref.child("User").queryOrdered(byChild: "mobileNo").queryEqual(toValue:txtuname.text).observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.exists()
            {
                print(snapshot)
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                    for child in snapDict{
                        
                        if let Email = child.value as? [String:AnyObject]{
                            
                            self._email = Email["emailId"] as! String!
                            
                            
                            
                        }
                        //                            if let Flogin = child.value as? [String:AnyObject]{
                        //
                        //                                obj.firstLogin = ((Flogin["firstLogin"] as! String!) != nil)
                        //
                        //
                        //                            }
                        //                            if let IsActive = child.value as? [String:AnyObject]{
                        //
                        //                              obj.isactive = ((IsActive["isActive"] as! String!) != nil)
                        //
                        //
                        //                            }
                        //                            if let IsFLogin = child.value as? [String:AnyObject]{
                        //
                        //                                obj.isFirstLogin = ((IsFLogin["isFirstLogin"] as! String!) != nil)
                        //
                        //
                        //                            }
                        
                        if let mobileNo = child.value as? [String:AnyObject]{
                            
                            self._mobileno = mobileNo["mobileNo"] as! String!
                            
                            
                        }
                        //                            if let password = child.value as? [String:AnyObject]{
                        //
                        //                                obj.password = password["password"] as! String!
                        //
                        //
                        //                            }
                        //                            if let userDietType = child.value as? [String:AnyObject]{
                        //
                        //                                obj.userDietType = userDietType["userDietType"] as! String!
                        //
                        //
                        //                            }
                        //
                                                    if let userId = child.value as? [String:AnyObject]{
                        
                                                        self._userid = userId["userId"] as! String!
                        
                        
                                                    }
                        
                        if let userLoginID = child.value as? [String:AnyObject]{
                            
                            self._userloginId = userLoginID["userLoginID"] as! String!
                            
                            
                        }
                        
                        if let userName = child.value as? [String:AnyObject]{
                            
                            self._username = userName["userName"] as! String!
                            
                            
                        }
                        
                        //                            if let userType = child.value as? [String:AnyObject]{
                        //
                        //                                obj.userType = userType["userType"] as! String!
                        //
                        //
                        //                            }
                        
                        
                        //                            if let url=child.value as? [String:AnyObject]{
                        //                                self._thumbnailurl=url["profileimage"] as! String
                        //                            }
                        
                        
                        //                            if(self.txtuname.text==obj.userLoginID && self.txtpass.text==obj.password){
                        //                               
                        UserDefaults.standard.set(self._username, forKey: "uame")
                        UserDefaults.standard.set(child.key, forKey: "KEY")
                        
                        
                        
                        UserDefaults.standard.set(self._userid, forKey: "UserID")
                        
                        
                       // User.init(active: true, EmailId: self._email, firstLogin: true, isActive: true, isFirstLogin: true, mobileNo: self._mobileno, password: "", userDietType: "", userId: "", userLoginID: self._userloginId, userName: self._username, userType: "")
                        
                        self.u.append("1")
                        //}
                        
                        print(child.key)
                        
                        
                    }
                }
                
                
                
                if(self.u.count>0)
                {
                    
                    print("valid")
                    self.u.removeAll()
                    
                    
                    
                    
                    
                    UserDefaults.standard.set(true, forKey: "ISLOGGEDIN")
                    UserDefaults.standard.synchronize()
                    
                   self.hideActivityIndicator()
                    self.performSegue(withIdentifier: "squetoDashborad", sender: nil)
                    
                    
                    
                }
                else{
                    
                          self.hideActivityIndicator()
                        let passwordcheck = UIAlertController(title: "Error", message: "Not valid ", preferredStyle: .alert)
                                    let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                    
                    
                    
                                    passwordcheck.addAction(cancelAction)
                    
                    
                                    self.present(passwordcheck, animated: true, completion: {  })
                                    
                                    print("not valid")
                }
                
                

                
                
            }
            else{
                      self.hideActivityIndicator()
                let passwordcheck = UIAlertController(title: "Error", message: "Incorrect Mobile Number ", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                
                
                
                passwordcheck.addAction(cancelAction)
                
                
                self.present(passwordcheck, animated: true, completion: {  })
                
                print("not valid")
                self.hideActivityIndicator()
                self.txtuname.text=""
            }
            
        })
        
    }
    
    @IBAction func btnsignup(_ sender: Any) {
        performSegue(withIdentifier: "squeregister", sender: nil)
    }
    
    func showActivityIndicator() {
        
        
        
       // DispatchQueue.main.async {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
            self.loadingView.alpha = 0.7
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10
            
            self.spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
            
            self.loadingView.addSubview(self.spinner)
            self.view.addSubview(self.loadingView)
            self.spinner.startAnimating()
            
        //}
        
    }
    func hideActivityIndicator() {
        
       // DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.loadingView.removeFromSuperview()
        //}
    }
    
    }
extension String
{
    func containsNumbers() -> Bool
    {
        let numberRegEx  = ".*[0-9]+.*"
        let testCase     = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return testCase.evaluate(with: self)
    }
}

extension String
{
    func containsCharacters() -> Bool
    {
        let numberRegEx  = ".*[a-zA-Z]+.*"
        let testCase     = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return testCase.evaluate(with: self)
    }
}

extension String
{
    func containsNumberCharacters() -> Bool
    {
        let numberRegEx  = ".*[0-9a-zA-Z]+.*"
        let testCase     = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return testCase.evaluate(with: self)
    }
}

extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
}
