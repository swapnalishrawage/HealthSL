//
//  RegisterVC.swift
//  Salado
//
//  Created by Rz on 01/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FontAwesome_swift

class RegisterVC: UIViewController, UITextFieldDelegate {
    
    var datePickerView:UIDatePicker!
    var keybord:Bool=false
    var viewnew:UIView!
   var viewnewshow:Bool=false
    @IBOutlet weak var imgclose: UIImageView!
    @IBOutlet weak var viewgender: UIView!
    @IBOutlet weak var lblemailid: UITextField!
    @IBOutlet weak var viewcategory: UIView!
    @IBOutlet weak var lblfname: UITextField!

    @IBOutlet weak var btnsignup: UIButton!
    @IBOutlet weak var txtmobile: UITextField!
    @IBOutlet weak var lblbirthdate: UITextField!
    @IBOutlet weak var lbllname: UITextField!
    var category:String!
    var gender:String!
    var isradio1Chk:Bool!
    var otherthandob:Bool=false
     var iscatChk:Bool!
    @IBOutlet weak var imgf: UIImageView!
    
    @IBOutlet weak var imgm: UIImageView!
    
    @IBOutlet weak var imgNV: UIImageView!
    
    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var imgBOTH: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 viewnew=UIView(frame: CGRect(x: 0, y:view.bounds.height-200, width: view.bounds.width, height: 200))
        viewnew.layer.cornerRadius=5
        viewnew.layer.borderColor=UIColor.lightGray.cgColor
        viewnew.layer.borderWidth=2
        
       
      
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterVC.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(RegisterVC.keyboardWillHide(sender:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        
        
        
        datePickerView = UIDatePicker(frame: CGRect(x: 0, y: 0, width: viewnew.frame.width, height: viewnew.frame.height)) //UIDatePicker(x: 0, y:, width: view.bounds.width, height: 200)
       
        datePickerView.backgroundColor = UIColor(red: 198/255, green: 212/255, blue: 193/255, alpha: 1)
        datePickerView.datePickerMode = .date
        viewnew.addSubview(datePickerView)
        
        
        viewcategory.layer.cornerRadius=5
        viewcategory.layer.borderWidth=2
        viewcategory.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        
        
        viewgender.layer.cornerRadius=5
        viewgender.layer.borderWidth=2
        viewgender.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        
        
        
        
        imgf.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        imgm.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        
        
        
        
        
        
        
        imgV.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        imgNV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor:UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        

         imgBOTH.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.close))
        singleTap.numberOfTapsRequired = 1 // you can change this value
        imgclose.isUserInteractionEnabled = true
        imgclose.addGestureRecognizer(singleTap)
        
        
        
        
        
       imgclose.image = UIImage.fontAwesomeIcon(name:.remove , textColor: UIColor(red: 128/255, green: 82/255, blue: 10/255, alpha: 1), size: CGSize(width: 35, height: 35))
        
        
        lblfname.backgroundColor=UIColor.clear
       lblfname.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        lblfname.layer.borderWidth=2
        lblfname.layer.cornerRadius=5
        
        
        
        
        
        
        lbllname.backgroundColor=UIColor.clear
        lbllname.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        lbllname.layer.borderWidth=2
        lbllname.layer.cornerRadius=5

        
        
         lblbirthdate.inputView = datePickerView
        lblbirthdate.inputView = viewnew

        
        
        
//        let singleTap3 = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.birthdate))
//        singleTap3.numberOfTapsRequired = 1 // you can change this value
//       viewnew.isUserInteractionEnabled = true
//        viewnew.addGestureRecognizer(singleTap3)
        

        
        
        
        datePickerView.addTarget(self, action: #selector(RegisterVC.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
       
        datePickerView.maximumDate=NSDate() as Date
        
        
        
        lblbirthdate.backgroundColor=UIColor.clear
        lblbirthdate.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        lblbirthdate.layer.borderWidth=2
        lblbirthdate.layer.cornerRadius=5
        lblbirthdate.delegate=self
        

   
        
        
        
        
        
        
        viewgender.backgroundColor=UIColor.clear
        
        viewcategory.backgroundColor=UIColor.clear
        
       lblemailid.backgroundColor=UIColor.clear
        lblemailid.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        lblemailid.layer.borderWidth=2
        lblemailid.layer.cornerRadius=5

        
        txtmobile.backgroundColor=UIColor.clear
        txtmobile.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        txtmobile.layer.borderWidth=2
        txtmobile.layer.cornerRadius=5

        
        
        btnsignup.layer.cornerRadius=5
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.dismissKeyboard))
        
        
        view.addGestureRecognizer(tap)
        
        
        
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
        imgBOTH.isUserInteractionEnabled = true
        imgBOTH.addGestureRecognizer(singleTap03)
        
        
        
        
        let tap1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegisterVC.dismissKeyboard))
        
        
        lblbirthdate.addGestureRecognizer(tap1)

        // Do any additional setup after loading the view.
    }
    
    func keyboardWillShow(sender: NSNotification) {
       // self.view.frame.origin.y = -150 // Move view 150 points upward
        keybord=true
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
          keybord=false
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
       
   //dismissKeyboard()
        
        if textField == lblbirthdate {
            //lblbirthdate.text=" "
        
            
//            lblbirthdate.resignFirstResponder()
//            txtmobile.resignFirstResponder()
//            lblfname.resignFirstResponder()
//            lbllname.resignFirstResponder()
//            lblemailid.resignFirstResponder()
//            view.endEditing(true)

            
            
            
        if(keybord==false)
        {
            viewnewshow=true
            lblbirthdate.placeholder="Birth Date"
            
            print("okk")
            view.addSubview(viewnew)
            viewnew.isHidden=false
            datePickerView.isHidden=false
            view.endEditing(true)
            }
        else if(keybord==true){
              viewnewshow=false
               view.endEditing(true)
            dismissKeyboard()
         
            }
            
            //view.isUserInteractionEnabled=false
           // myTextField was touched
        }
//        else{
//            
//            otherthandob=true
//            if(keybord==true)
//            {
//               dismissKeyboard()
//            }
//            //dismissKeyboard()
//        }

    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == lblbirthdate {
//        
//        viewnew.isHidden=false
//        
//        }
//    
//        
//    }
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
//        if textField == lblbirthdate {
//            
//           viewnewshow=false
//            
//        }
//
//    }
    
    
    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        if textField == lblbirthdate {
//            dismissKeyboard()
//            print("okk")
//      
//             view.addSubview(viewnew
//            // myTextField was touched
//        }
//return true
//    }
   
           func datePickerValueChanged(sender:UIDatePicker) {
        lblbirthdate.placeholder="Birth Date"
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
          dateFormatter.dateFormat="dd MMM yyyy"
            print(dateFormatter.string(from: sender.date))
            
   let m = dateFormatter.string(from: sender.date)
      lblbirthdate.text = m.replacingOccurrences(of: ",", with: "")

           //view.isUserInteractionEnabled=true
        
        datePickerView.isHidden=true
            viewnew.isHidden=true
    }
    func birthdate()
    {
        print("ohhh")
       performSegue(withIdentifier: "squedate", sender: nil)
        
        
        
    }
    
    func imgfclick()
    {
//        if(imgf.Image == UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30)) )
//        {
//            // var m:String="Male"
//            //btnradiofemale.setImage(#imageLiteral(resourceName: "unselect"), for:UIControlState.normal)
//            //btnradiomale.setImage(#imageLiteral(resourceName: "unselect"), for:UIControlState.normal)
//            
//            
//            imgf.Image==UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
//            imgm.image==UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
//        }
//        else
//        {
//            btnradiomale.setImage(#imageLiteral(resourceName: "selected.jpg"), for:UIControlState.normal)
//            if(btnradiofemale.currentImage==#imageLiteral(resourceName: "selected"))
//            {
//                btnradiofemale.setImage(#imageLiteral(resourceName: "unselect"), for:UIControlState.normal)
//            }
//        }
//        btnradiomale.setTitle("Male", for:UIControlState.normal)
//        btnradiomale.titleLabel?.isHidden=true
    }
    
    
    func imgmclick()
    {
       
    }
    
    func didTapRadio1() {
        
        
        if(isradio1Chk == false){
            isradio1Chk = true
            changeCheck(isr1Check: isradio1Chk)
//            favPickerView.isHidden = true
//            nameAddressSV.isHidden = false
//            nameadrsMainView.isHidden = false
//            addFriendTable.isHidden = true
        }
        
    }
    
    func didTapRadio2() {
        
        if(isradio1Chk == true)
        {
            isradio1Chk = false
            changeCheck(isr1Check: isradio1Chk)
            
//            favPickerView.isHidden = false
//            nameAddressSV.isHidden = true
//            nameadrsMainView.isHidden = true
        }
    }
    
    
    func didTapIMGV() {
        
//        if(isradio1Chk == true)
//        {
//            isradio1Chk = false
//            changeCheckcat(isr1Check: isradio1Chk)
//            
//            //            favPickerView.isHidden = false
//            //            nameAddressSV.isHidden = true
//            //            nameadrsMainView.isHidden = true
//        }
        if(imgV.image==UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30)))
        {
            
            
            imgNV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            imgBOTH.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
        }
        else{
            category="Veg"
            imgV.image=UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            imgNV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            imgBOTH.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
        }
    }
    func didTapimgNV() {
        
//        if(isradio1Chk == true)
//        {
//            isradio1Chk = false
//           changeCheckcat(isr1Check: isradio1Chk)
//            
//            //            favPickerView.isHidden = false
//            //            nameAddressSV.isHidden = true
//            //            nameadrsMainView.isHidden = true
//        }
        
        
        if(imgNV.image==UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30)))
        {
            
           
            imgV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            imgBOTH.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
        }
        else{
             category="NonVeg"
            imgNV.image=UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            imgV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            imgBOTH.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
        }
    }

    func didTapimgBoth() {
//        
//        if(isradio1Chk == true)
//        {
//            isradio1Chk = false
//            changeCheckcat(isr1Check: isradio1Chk)
//            
//            //            favPickerView.isHidden = false
//            //            nameAddressSV.isHidden = true
//            //            nameadrsMainView.isHidden = true
//        }
        
        if(imgBOTH.image==UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30)))
        {
            
           
            imgV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            imgNV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
        }
        else{
             category="Both"
            imgBOTH.image=UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            imgV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            imgNV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
        }
    }
    func close()
    {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //let frontview=UINavigationController.init(rootViewController:des)
        
        self.navigationController?.pushViewController(des, animated: true)
        self.dismiss(animated: true, completion: nil)
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
            imgBOTH.image = UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
        
        }else{
            imgNV.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
             imgBOTH.image = UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            imgV.image = UIImage.fontAwesomeIcon(name: .circleO, textColor:UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))
            
            
            
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         lblbirthdate.resignFirstResponder()
        view.endEditing(true)
        if(viewnewshow==true)
        {
            
        }
     return true
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //lblbirthdate.resignFirstResponder()
//        view.endEditing(true)
//    }
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
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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
        
        performSegue(withIdentifier: "squelogin", sender: nil)
        
    }

    @IBAction func signupclick(_ sender: Any) {
        
        
        let uid=NSUUID().uuidString
       
        
        
        
        
//        if(imgf.image==UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))){
//            g="Female"
//        }
//        if(imgf.image==UIImage.fontAwesomeIcon(name: .circleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30))){
//            g="Male"
//        }
//        else /*if(imgm.image==UIImage.fontAwesomeIcon(name: .checkCircleO, textColor: UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 30, height: 30)))*/{
//           g="Female"
//            
//        }
//        
        
        
        
        
        print(gender)
        print(category)
        
        let uname:String=lblfname.text!+" "+lbllname.text!
        
        var m:[String:AnyObject]!
        
        
            
            m=["0":"  A-601 Mega Center,Hadpsar,pune 411028" as AnyObject]
            
     

        
        
        let register:[String:AnyObject]=["active":true as AnyObject ,"birthday":lblbirthdate.text! as AnyObject,"emailId":lblemailid.text! as AnyObject ,"firstLogin":true as AnyObject  ,"gender":gender as AnyObject,"isActive":true as AnyObject  ,"isFirstLogin":true as AnyObject,"mobileNo":txtmobile.text! as AnyObject, "password":"123456" as AnyObject ,"userAddress":m as AnyObject,"userDietType":category as AnyObject,"userId":uid as AnyObject,"userLoginID":lblemailid.text! as AnyObject, "userName":uname as AnyObject, "userType":"customer" as AnyObject]
        
        
        
        
        
      
        
        let selectedDate=lblbirthdate.text!
        print(selectedDate)
        
        let d = NSDate()
        print(d)
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd MMM yyyy"
        let dateString = dateFormatter1.string(from: d as Date)
        print(dateString)
        
        
        if(lblfname.text == "" && lbllname.text == "" && lblemailid.text == ""   && txtmobile.text == "" && lblbirthdate.text == "")
        {
            let register1 = UIAlertController(title: "Error", message: "Please Enter all Information", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .default, handler:{
                action in
                
              
                
                
            })
            
            
            
            register1.addAction(cancelAction)
            
            self.present(register1, animated: true, completion: {  })

        }
        else if(lblfname.text == "" || lbllname.text == "" || lblemailid.text == ""   || txtmobile.text == "" || lblbirthdate.text == ""){
            let mb=txtmobile.text
            
            if(lblfname.text=="")
            {
                
                let register1 = UIAlertController(title: "Error", message: "Please Enter First Name", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .default, handler:{
                    action in
                    
                    //self.dismiss(animated: true, completion: nil)
                    
                    
                })
                
                
                
                register1.addAction(cancelAction)
                
                self.present(register1, animated: true, completion: {  })
            }
            else if(lbllname.text=="")
            {
                
                let register1 = UIAlertController(title: "Error", message: "Please Enter Last Name ", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .default, handler:{
                    action in
                    
                    //self.dismiss(animated: true, completion: nil)
                    
                    
                })
                
                
                
                register1.addAction(cancelAction)
                
                self.present(register1, animated: true, completion: {  })
            }
            else if(lblbirthdate.text==""){
                let register1 = UIAlertController(title: "Error", message: "Please Enter Birth Date ", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .default, handler:{
                    action in
                    
                    //self.dismiss(animated: true, completion: nil)
                    
                    
                })
                
                
                
                register1.addAction(cancelAction)
                
                self.present(register1, animated: true, completion: {  })
            }
            else if(selectedDate==dateString)
            {
                let check = UIAlertController(title: "Error", message: "Please enter Date of Birth", preferredStyle: .alert )
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                present(check, animated: true, completion: {  })
                
                
            }
            else if(txtmobile.text=="")
            {
                let register1 = UIAlertController(title: "Error", message: "Please Enter Mobile Number ", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .default, handler:{
                    action in
                    
                    //self.dismiss(animated: true, completion: nil)
                    
                    
                })
                
                
                
                register1.addAction(cancelAction)
                
                self.present(register1, animated: true, completion: {  })
            }
            else  if( (txtmobile.text?.characters.count)! < 10 || (txtmobile.text?.characters.count)! > 10 || !((mb?.containsNumbers())!) ||  (mb?.containsCharacters())!)
            {
                let check = UIAlertController(title: "Error", message: "Please enter Mobile Number with 10 digit", preferredStyle: .alert )
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
                
                
                check.addAction(okAction)
                
                present(check, animated: true, completion: {  })
            }

            else if(lblemailid.text=="")
            {
                let register1 = UIAlertController(title: "Error", message: "Please Email ID ", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Ok", style: .default, handler:{
                    action in
                    
                    //self.dismiss(animated: true, completion: nil)
                    
                    
                })
                
                
                
                register1.addAction(cancelAction)
                
                self.present(register1, animated: true, completion: {  })
            }
                        else if (!isValidEmail(testStr:lblemailid.text!)) {
                
                
                let emailBtn = UIAlertController(title: "Verify Email", message: "Incorrect Email", preferredStyle: .alert )
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                
                emailBtn.addAction(cancelAction)
                emailBtn.addAction(okAction)
                
                
                present(emailBtn, animated: true, completion: {  })
               
                
            }

            
            

        }
        else{
            registreruser(values: register)
        }
        
        
        
        
        
    }
    func isValidEmail(testStr:String) -> Bool {
        
        
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
