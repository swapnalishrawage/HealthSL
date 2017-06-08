//
//  CrashDetailVC.swift
//  Salado
//
//  Created by Rz on 22/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import ObjectMapper
class CrashDetailVC: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var lblprogram: UILabel!
   
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var txtdetail1: UITextView!
    var _dishId:String!
    var _dishIngredients:String!
    var _dishName:String!
    var _dishThumbnail:String!
    
    
    @IBOutlet weak var dayview: UIView!
    var _brakfastid:String!
    var _day1:String!
    var _lunchid:String!
    var _dinnerid:String!
    var _snackid:String!
    @IBOutlet weak var btnnext: UIButton!
    @IBOutlet weak var lblday: UILabel!
    
    @IBOutlet weak var btnprv: UIButton!
    private var   _programdetail:StartDiet!
     var dataref: FIRDatabaseReference!
    
    var  programdetail : StartDiet{
        get {
            return _programdetail
            
        }
        set
        {
            _programdetail = newValue
        }
    }

    
    
    var _breakfastDishID:String!
    var _day:String!
    @IBOutlet weak var tblistnew: UITableView!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var txtdetail: UITextView!
    
  var category1=[category]()
   var d=[Dish]()
    var dayPro=[dayProgram]()
    override func viewDidLoad() {
        super.viewDidLoad()
navigationItem.title=programdetail.programName
        txtdetail.setContentOffset(.zero, animated: false)
        txtdetail.scrollsToTop=true
               view1.layer.cornerRadius=5
        view2.layer.cornerRadius=5
        lblname.isHidden=true
               lblname.text=programdetail.programName
       btnprv.layer.cornerRadius=5
        btnnext.layer.cornerRadius=5
        btnprv.layer.borderWidth=2
       
        
        
        dayview.layer.cornerRadius=5
        btnprv.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor

        
        lblday.layer.cornerRadius=5
        btnnext.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor

        btnnext.layer.borderWidth=2
        
        txtdetail.text=programdetail.programDescription
      
       
   
   
        getdayprogram()
        retrivedishes()
        

        
        
        
        
     

        
        tblistnew.dataSource=self
      tblistnew.delegate=self
        tblistnew.reloadData()
        // Do any additional setup after loading the view.
    }

    @IBAction func backclick(_ sender: Any) {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "StartDietVC") as! StartDietVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
        
    }
    @IBAction func bookplanclick(_ sender: Any) {
        
        
        dataref=FIRDatabase.database().reference()
        
        
        dataref.child("DoctorAppintments").observeSingleEvent(of: .value, with: { (snapshot) in
            
            print(snapshot)
          //
            
            
           // let r=Mapper<sample>().map
            
               // let res = Mapper<ThreadDetailModel>().map(JSONObject: dict)
            
            
           
            
            
            
            if(snapshot.childrenCount==0)
            {
                //self.tbdocterlist.isHidden=true
                
            }
            else{
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                    print(snapshot.value!)
                    
                   
                    for child in snapDict{
                        //let ID = child.key
                        
                        print(child)
                        
                       print(child.value)
                      
                        let res = Mapper<sample>().map(JSONObject: child.value)
                        print(res!)
              
                    }
                    
                }
            }
            
        })
        

        
        
        
        //performSegue(withIdentifier: "squebookplan", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btnnextclick(_ sender: Any) {
        
        
        
        clicknext()
        
        
    }
    @IBAction func btnprvclick(_ sender: Any) {
        clickpre()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell",for:indexPath) as? categorycell{
            
            //var m=category1[indexPath.row]
            
            
            //let m=dayPro[indexPath.row]
            let m=category1[indexPath.row]
            
            
            
            
            
          cell.updatecell(name: m.name, detail: m.detail, image:m.image)
            
            
            return cell
        }
        
        
        
        
        return UITableViewCell()
    }
    

    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.alpha=0
//        let t=CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
//        
//        cell.layer.transform=t
//    
//        UIView.animate(withDuration: 2.3, animations: {
//        
//            cell.alpha=1.0
//            cell.layer.transform=CATransform3DIdentity
//        
//        })
//        
//        
//    }
    
    func getdayprogram()
    {
        dayPro.removeAll()
        print(programdetail.ID)
        print(programdetail.programdays)
        dataref=FIRDatabase.database().reference()
        dataref.child("StandardDietProgram").child(programdetail.ID).child("dayProgram").observe(.value, with: {(snapshot) in
        
        
         print(snapshot)
        
        
            for i in 0...self.programdetail.programdays-1{
               
                
                let m:String=(String(i))
                print(m)
                
                
              
                
                
                
                
                
                
                
                self._brakfastid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "breakfastDishID").value! as! String
                
                
                self._lunchid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "lunchDishID").value! as! String
                
                self._dinnerid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "dinnerDishId").value! as! String
                
                
                
                self._snackid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "snacksDishId").value! as! String
                self._day1=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "day").value! as! String
                
                
                print( self._snackid)
                
                self.dayPro.append(dayProgram(breakfastDishId: self._brakfastid, day: self._day1, dinnerDishId: self._dinnerid, lunchDishId: self._lunchid, snacksDishId: self._snackid))
                //self.dayPro.append(dayProgram(breakfastDishId: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "breakfastDishID").value! as! String, day: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "day").value! as! String, dinnerDishId: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "dinnerDishId").value! as! String, lunchDishId: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "lunchDishId").value! as! String, snacksDishId: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "snacksDishId").value! as! String))
                
                
            }
   
        

            
         
            
           print(snapshot.childSnapshot(forPath: "0").childSnapshot(forPath: "breakfastDishID").value!)
          
            if(snapshot.childrenCount==0)
            {
                //self.tbdocterlist.isHidden=true
                
            }
            else{
                if let snapDict = snapshot.value  {
                    
                    
                    print(snapDict)
                    
                   
                    
                    
                    
//                    for child in snapDict{
//                        
//                        
//                        
//                        var ID = child.key as! String
//                        let shotKey = snapshot.children.nextObject() as! FIRDataSnapshot
//                        
//                        
//                        
//                        
//                        
//                        if let dayprogram1 = child.value as? [String:AnyObject]{
//                            
//                            self._breakfastDishID=dayprogram1["breakfastDishID"] as! String
//                            print(self._breakfastDishID)
//                            
//                            
//                            
//                        }
//                        
//                        
//                        
//                        self.category1.append(category(Name: "Snack", Detail: "kjhdskjfh", Image: ""))
//                    }
                    self.tblistnew.dataSource=self
                    self.tblistnew.delegate=self
                    self.tblistnew.reloadData()
                }
            }
        })
        
                            

        
        
        
        
    }
    
    func clicknext()
    {
        
        
        
        let t=CATransform3DTranslate(CATransform3DIdentity, 250, 20, 0)
        
      tblistnew.layer.transform=t
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.tblistnew.alpha=1.0
            self.tblistnew.layer.transform=CATransform3DIdentity
            
        })
        
        
        
        let day = lblday.text?.components(separatedBy: " ")[1]
        print(day!)
        var dayInt:Int=Int(day!)!
        
        if(Int(day!)!==dayPro.count)
        {
            dayInt=0
        }
        
print(dayInt)
        
        
        
        if(self.dayPro.count>0){
            for _ in 0...self.dayPro.count-1
            {
                
                self.category1.removeAll()
                let t=self.dayPro[dayInt].breakfastDishId
                let d1=Int(self.dayPro[dayInt].day)
                let dinn=self.dayPro[dayInt].dinnerDishId
                let lunchid=self.dayPro[dayInt].lunchDishId
                let snackid=self.dayPro[dayInt].snacksDishId
                lblday.text="Day \(d1!)"
                
                for m in 0...self.d.count-1
                {
                    lblprogram.font=UIFont(name: "Avenir-Heavy", size: 17)
                    if(self.d[m]._dishId==t)
                    {
                        
                        lblprogram.text="Breakfast:"
                        self.category1.append(category(Name: "\(lblprogram.text!)\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                        
                    }
                    if(self.d[m]._dishId==lunchid)
                    {
                        lblprogram.text="Lunch:"
                        self.category1.append(category(Name:"\(lblprogram.text!) \(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image:self.d[m]._dishThumbnail))
                        
                    }
                    if(self.d[m]._dishId==dinn)
                    {
                        lblprogram.text="Dinner:"
                        self.category1.append(category(Name:"\(lblprogram.text!)\( self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                        
                    }
                    
                    if(self.d[m]._dishId==snackid)
                    {
                        lblprogram.text="Snack:"

                        self.category1.append(category(Name:" \(lblprogram.text!)\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                        
                    }
                    
                    
                    
                    
                    
                    
                }
                
                
                print(self.category1.count)
                print(self.category1)
                self.tblistnew.delegate=self
                self.tblistnew.dataSource=self
                self.tblistnew.reloadData()
                
            }
        }
    }
    func clickpre()
    {
        
        
        
        let t=CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        
        tblistnew.layer.transform=t
        
        UIView.animate(withDuration:0.5, animations: {
            
            self.tblistnew.alpha=1.0
            self.tblistnew.layer.transform=CATransform3DIdentity
            
        })
        
      let day = lblday.text?.components(separatedBy: " ")[1]
        var dayInt:Int=Int(day!)!-1
        print(day!)
        if(Int(day!)!==1)
        {
           dayInt=dayPro.count-1
        }
        
        print(dayInt)
        if(self.dayPro.count>0){
            for _ in 0...self.dayPro.count-1
            {
                
                self.category1.removeAll()
                let t=self.dayPro[dayInt].breakfastDishId
                let d1=self.dayPro[dayInt].day
                let dinn=self.dayPro[dayInt].dinnerDishId
                let lunchid=self.dayPro[dayInt].lunchDishId
                let snackid=self.dayPro[dayInt].snacksDishId
                
                lblday.text="Day \(Int(d1)!-1)"
                for m in 0...self.d.count-1
                {
                    if(self.d[m]._dishId==t)
                    {
                        
                        self.category1.append(category(Name: "Breakfast:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                        
                    }
                    if(self.d[m]._dishId==dinn)
                    {
                        
                        self.category1.append(category(Name:"Dinner:\( self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                        
                    }
                    if(self.d[m]._dishId==lunchid)
                    {
                        
                        self.category1.append(category(Name:"Lunch: \(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                        
                    }
                    if(self.d[m]._dishId==snackid)
                    {
                        
                        self.category1.append(category(Name:" Snack:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                        
                    }
                    
                    
                    
                    
                    
                    
                }
                
                
                print(self.category1.count)
                print(self.category1)
                self.tblistnew.delegate=self
                self.tblistnew.dataSource=self
                self.tblistnew.reloadData()
                
            }
        }
    }
    
    func retrivedishes()
    {
        
        d.removeAll()
        
        dataref=FIRDatabase.database().reference()
        
        dataref.child("Dish").observeSingleEvent(of: .value, with: { (snapshot) in
            
            print(snapshot)
            
            
            
            if(snapshot.childrenCount==0)
            {
                
            }
            else{
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                    print(snapDict)
                    
                    for child in snapDict{
                    //   _ = child.key as! String
                        //let shotKey = snapshot.children.nextObject() as! NSObject
                        
                        
                        
                        
                        if let  value=child.value as? [String:AnyObject]{
                            
//                            if let dishdata = value["dishContent"]  as? String{
//                                
//                                
//                                print(dishdata)
//                                
//                                self._dishContent=dishdata
//                                
//                                
//                            }
//                            
//                            if let dishdata = value["dishDescription"]  as? String{
//                                
//                                
//                                print(dishdata)
//                                
//                                self._dishDescription=dishdata
//                                
//                                
//                            }
//                            
                            if let dishId = value["dishId"]  as? String{
                                
                                
                                print(dishId)
                                
                                self._dishId=dishId
                                
                                
                            }
                            
                            if let dishIngredients = value["dishIngredients"] {
                                
                                
                                print(dishIngredients)
                                
                                self._dishIngredients=String(describing: dishIngredients)
                                
                                
                            }
                            
                            if let dishName = value["dishName"]  as? String{
                                
                                
                                print(dishName)
                                
                                self._dishName=dishName
                                
                                
                            }
//                            if let dishdata = value["dishPrice"]  as? String{
//                                
//                                
//                                print(dishdata)
//                                
//                                self._dishPrice=dishdata
//                                
//                                
//                            }
//                            if let dishdata = value["dishRatings"]  as? String{
//                                
//                                
//                                print(dishdata)
//                                
//                                self._dishRatings=dishdata
//                                
//                                
//                            }
                            if let dishdata = value["dishThumbnail"]  as? String{
                                
                                
                                print(dishdata)
                                
                                self._dishThumbnail=dishdata
                                
                                
                            }
//                            if let dishdata = value["dishType"]  as? String{
//                                
//                                
//                                print(dishdata)
//                                
//                                self._dishType=dishdata
//                                
//                                
//                            }
//                            if let dishdata = value["foodPreparationTime"]  as? String{
//                                
//                                
//                                print(dishdata)
//                                
//                                self._foodPreparationTime=dishdata
//                                
//                                
//                            }
                            
                            
                            print(self._dishName)
                            print(self._dishId)
                            print(self._dishThumbnail)
                            
            let dish1=Dish(_dContent: "1", _dDescription: "" ,_dId: self._dishId, _dIngredients:"1", _dName: self._dishName, _dRating:"99%", _dPrice: "", _dThumbnail: self._dishThumbnail, _dType: "Veg", _fPreparationTime: "1")
                            
                            
                            self.d.append(dish1)
                            
                            
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                }
                
                
                            }
            
            
            if(self.dayPro.count>0){
                for _ in 0...self.dayPro.count-1
                {
                    
                    self.category1.removeAll()
                    let t=self.dayPro[0].breakfastDishId
                  //  var d1=self.dayPro[0].day
                    let dinn=self.dayPro[0].dinnerDishId
                    let lunchid=self.dayPro[0].lunchDishId
                    let snackid=self.dayPro[0].snacksDishId
                    
                    
                    for m in 0...self.d.count-1
                    {
                        if(self.d[m]._dishId==t)
                        {
                            
                            self.category1.append(category(Name: "Breakfast:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                            
                        }
                        if(self.d[m]._dishId==dinn)
                        {
                            
                            self.category1.append(category(Name:"Dinner:\( self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                            
                        }
                        if(self.d[m]._dishId==lunchid)
                        {
                            
                            self.category1.append(category(Name:"Lunch: \(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image:self.d[m]._dishThumbnail))
                            
                        }
                        if(self.d[m]._dishId==snackid)
                        {
                            
                            self.category1.append(category(Name:" Snack:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                            
                        }
                    
                    
                    
                    
                    
                    
                    }
                    
                    
                    print(self.category1.count)
                    print(self.category1)
                    self.tblistnew.delegate=self
                    self.tblistnew.dataSource=self
                    self.tblistnew.reloadData()
                    
                }
            }
            
            
            
            
            
        })
        
       
        
        
        


        
        
        
        
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
