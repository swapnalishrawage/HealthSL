//
//  MyAccountVC.swift
//  Salado
//
//  Created by Rz on 18/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MyAccountVC: UIViewController {
    @IBOutlet weak var btndone: UIButton!
    var uid:String!
     var dataref: FIRDatabaseReference!
    @IBOutlet weak var btnmyorder: UIButton!
    @IBOutlet weak var btnmymonthlyplan: UIButton!
    @IBOutlet weak var imgbg: UIImageView!
    
    @IBOutlet weak var txtaddress: UITextField!
    @IBOutlet weak var txtnumber: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var imgedit: UIImageView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    var isedit:Bool=false
    
    
    
    
    var _username:String!
    var _mobileno:String!
    var _email:String!
    var _add:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
           self.navigationItem.title="MY ACCOUNT"
    btndone.isHidden=true
        btnmyorder.layer.cornerRadius=5
        btnmymonthlyplan.layer.cornerRadius=5
        
        btndone.layer.cornerRadius=5
        imgbg.layer.borderColor=UIColor.gray.cgColor
        imgbg.layer.borderWidth=2
        // Do any additional setup after loading the view.
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(MyAccountVC.selectedit))
        singleTap.numberOfTapsRequired = 1 // you can change this value
       imgedit.isUserInteractionEnabled = true
        imgedit.addGestureRecognizer(singleTap)
        
        
       imgedit.image = UIImage.fontAwesomeIcon(name:.edit, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 35, height: 35))
        
        
        
        view1.layer.borderWidth=2
        view1.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
            .cgColor

        view1.layer.cornerRadius=5
        
        
        
        
        view2.layer.borderWidth=2
        view2.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
            .cgColor
        
        view2.layer.cornerRadius=5
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MyAccountVC.dismissKeyboard))
        
        
        view.addGestureRecognizer(tap)
        
        getuserdata()

    
    }
    func getuserdata(){
   // uid=UserDefaults.standard.value(forKey: "KEY") as! String
        
        uid=UserDefaults.standard.value(forKey: "UserID") as! String
    dataref=FIRDatabase.database().reference()
        
        dataref.child("User").queryOrdered(byChild: "userId").queryEqual(toValue:uid).observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.exists()
            {
                print(snapshot)
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                    for child in snapDict{
                        if let username = child.value as? [String:AnyObject]{
                            
                            self._username = username["userName"] as! String!
                            
                            
                        }
                        
                        
                        if let mobileno = child.value as? [String:AnyObject]{
                            
                            self._mobileno = mobileno["mobileNo"] as! String!
                            
                            
                        }
                        if let email = child.value as? [String:AnyObject]{
                            
                            self._email = email["emailId"] as! String!
                            
                            
                        }
                        
                        
                        
                        self.txtname.text=" "+self._username
                        self.txtemail.text=" "+self._email
                        self.txtnumber.text=" "+self._mobileno
                        
                        print(child.key)
                        
                        
                    }
                

        
        
        
        
                }}
        })
    
    }
    override func viewWillAppear(_ animated: Bool) {
                self.navigationItem.title="MY ACCOUNT"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        
        
        
        view.endEditing(true)
        
        //textmsg.resignFirstResponder()
        
    }
    
func selectedit()
{
    
    view2.layer.borderColor=UIColor.clear.cgColor
    
    txtname.isUserInteractionEnabled=true
    txtemail.isUserInteractionEnabled=true
    txtnumber.isUserInteractionEnabled=true
    txtaddress.isUserInteractionEnabled=true
    btndone.isHidden=false
    
    
    txtname.layer.borderWidth=2
    txtname.layer.cornerRadius=5
    txtname.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
.cgColor
    
    
    txtaddress.layer.borderWidth=2
     txtaddress.layer.cornerRadius=5
     txtaddress.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
        .cgColor

    
    
    txtnumber.layer.borderWidth=2
    txtnumber.layer.cornerRadius=5
    txtnumber.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
        .cgColor
    
    
    
    txtemail.layer.borderWidth=2
    txtemail.layer.cornerRadius=5
    txtemail.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
        .cgColor
    
    
    
    
    }
    @IBAction func backclick(_ sender: Any) {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
        

      
        
        
        
    }
    @IBAction func doneclick(_ sender: Any) {
        
        btndone.isHidden=true
        navigationItem.leftBarButtonItem?.title="<"
        
        view2.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        
        txtname.layer.borderColor=UIColor.clear.cgColor
        txtemail.layer.borderColor=UIColor.clear.cgColor
        txtnumber.layer.borderColor=UIColor.clear.cgColor
        txtaddress.layer.borderColor=UIColor.clear.cgColor
        
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
