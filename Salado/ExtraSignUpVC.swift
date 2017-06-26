//
//  ExtraSignUpVC.swift
//  Salado
//
//  Created by Rz on 25/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ExtraSignUpVC: UIViewController {

    @IBOutlet weak var btnsignup: UIButton!
    @IBOutlet weak var imgBoth: UIImageView!
    @IBOutlet weak var imgNV: UIImageView!
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var imgm: UIImageView!
    @IBOutlet weak var txtmobile: UITextField!
    @IBOutlet weak var imgf: UIImageView!
    @IBOutlet weak var txtbirthdate: UITextField!
    @IBOutlet weak var viewgender: UIView!
    @IBOutlet weak var viewcategory: UIView!
    
    var keybord:Bool=false
    var viewnew:UIView!
    var viewnewshow:Bool=false
    var category:String!
    var gender:String!
    var isradio1Chk:Bool!
    var otherthandob:Bool=false
    var iscatChk:Bool!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ExtraSignUpVC.dismissKeyboard))
        
        
        view.addGestureRecognizer(tap)
        
       txtmobile.backgroundColor=UIColor.clear
        txtmobile.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
       txtmobile.layer.borderWidth=2
        txtmobile.layer.cornerRadius=5
        
        
        
        txtbirthdate.backgroundColor=UIColor.clear
        txtbirthdate.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        txtbirthdate.layer.borderWidth=2
        txtbirthdate.layer.cornerRadius=5
        
        viewcategory.layer.cornerRadius=5
        viewcategory.layer.borderWidth=2
        viewcategory.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        
        
        viewgender.layer.cornerRadius=5
        viewgender.layer.borderWidth=2
        viewgender.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        
        viewgender.backgroundColor=UIColor.clear
        
        viewcategory.backgroundColor=UIColor.clear
        
        
        
        
        imgf.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        imgm.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        
        
        
        
        
        
        
        imgV.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        imgNV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor:UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        
        
        imgBoth.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        
        
        
        
        
        
        
        
        isradio1Chk = true
        changeCheck(isr1Check: isradio1Chk)
        
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.didTapRadio1))
        singleTap2.numberOfTapsRequired = 1 // you can change this value
        imgf.isUserInteractionEnabled = true
        imgf.addGestureRecognizer(singleTap2)
        
        let singleTap12 = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.didTapRadio2))
        singleTap12.numberOfTapsRequired = 1 // you can change this value
        imgm.isUserInteractionEnabled = true
        imgm.addGestureRecognizer(singleTap12)
        
        
        
        
        
        
        
        iscatChk = true
        changeCheckcat(isr1Check: iscatChk)
        
        let singleTap01 = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.didTapIMGV))
        singleTap01.numberOfTapsRequired = 1 // you can change this value
        imgV.isUserInteractionEnabled = true
        imgV.addGestureRecognizer(singleTap01)
        
        let singleTap02 = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.didTapimgNV))
        singleTap02.numberOfTapsRequired = 1 // you can change this value
        imgNV.isUserInteractionEnabled = true
        imgNV.addGestureRecognizer(singleTap02)
        
        
        
        
        let singleTap03 = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.didTapimgBoth))
        singleTap03.numberOfTapsRequired = 1 // you can change this value
        imgBoth.isUserInteractionEnabled = true
        imgBoth.addGestureRecognizer(singleTap03)
        
        
        


        // Do any additional setup after loading the view.
    }

    func changeCheck(isr1Check:Bool){
        
        if(isr1Check == true){
            gender="Female"
            imgf.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            
            
            
            imgm.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            
        }else{
            gender="Male"
            imgm.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            imgf.image = UIImage.fontAwesomeIcon(name: .circleO, textColor:UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            
            
        }
        
    }
    
    
    
    
    func changeCheckcat(isr1Check:Bool){
        
        if(isr1Check == true){
            imgV.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            
            category="Veg"
            
            imgNV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            imgBoth.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            
        }else{
            imgNV.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            imgBoth.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            imgV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor:UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            
            
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SignupClick(_ sender: Any) {
        
        let uid=NSUUID().uuidString
        
        
        
        print(gender)
        print(category)
        
       // let uname:String=lblfname.text!+" "+lbllname.text!
        
        var m:[String:AnyObject]!
        
        
        
        m=["0":"  A-601 Mega Center,Hadpsar,pune 411028" as AnyObject]
        
        
        
        
        
        let register:[String:AnyObject]=["active":true as AnyObject ,"birthday":txtbirthdate.text! as AnyObject,"emailId":"" as AnyObject ,"firstLogin":true as AnyObject  ,"gender":gender as AnyObject,"isActive":true as AnyObject  ,"isFirstLogin":true as AnyObject,"mobileNo":txtmobile.text! as AnyObject, "password":"123456" as AnyObject ,"userAddress":m as AnyObject,"userDietType":category as AnyObject,"userId":uid as AnyObject,"userLoginID":"" as AnyObject, "userName":"" as AnyObject, "userType":"customer" as AnyObject]
        
        
        
        
        
        
        
        let selectedDate=txtbirthdate.text!
        print(selectedDate)
        
        let d = NSDate()
        print(d)
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd MMM yyyy"
        let dateString = dateFormatter1.string(from: d as Date)
        print(dateString)
        

        registreruser(values: register)
    }
    func dismissKeyboard() {
        
        //lblbirthdate.resignFirstResponder()
        if(viewnewshow==true)
        {
            viewnew.isHidden=true
            viewnewshow=false
            //view.endEditing(true)
        }
        else{
            // viewnew.isHidden=true
            view.endEditing(true)
        }
        //        if(keybord==true)
        //        {
        //
        //             view.endEditing(true)
        //        }
        
        //textmsg.resignFirstResponder()
        
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
            
            self.dismiss(animated: true, completion: nil)
            
            
        })
        
        
        
        register1.addAction(cancelAction)
        
        self.present(register1, animated: true, completion: {  })
        
        //performSegue(withIdentifier: "squelogin", sender: nil)
        
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
