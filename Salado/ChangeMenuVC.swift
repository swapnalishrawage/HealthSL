//
//  ChangeMenuVC.swift
//  Salado
//
//  Created by Rz on 14/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ChangeMenuVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var _dishId:String!
    var _dishIngredients:String!
    var _dishName:String!
    var _dishThumbnail:String!
    @IBOutlet weak var tbchangemenu: UITableView!
    @IBOutlet weak var changemenuview: UIView!
    
    @IBOutlet weak var btncancle: UIButton!
    
    @IBOutlet weak var btndone: UIButton!
    var _grname:String!
    var _grpid:String!
    var dishitem=[String]()
    private var   _selectgroupid:DishGroup!
    var dataref: FIRDatabaseReference!

    var category1=[category]()
    var d=[Dish]()
    var dayPro=[dayProgram]()
    var _dishID:String!
    var  selectgroupid : DishGroup{
        get {
            return _selectgroupid
            
        }
        set
        {
            _selectgroupid = newValue
        }
    }
var dg1=[DishGroup]()
    override func viewDidLoad() {
        super.viewDidLoad()

        print(selectgroupid.groupID)
         print(selectgroupid.groupName)
        changemenuview.layer.cornerRadius=5
        changemenuview.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        changemenuview.layer.borderWidth=2
        
        
        btncancle.layer.cornerRadius=5
        btndone.layer.cornerRadius=5
        
        //getdishitem()
       retrivedishes()
       getdishgroupdata()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//delegation func
    override func viewWillAppear(_ animated: Bool) {
      //  getdishgroupdata()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell=tableView.dequeueReusableCell(withIdentifier: "ChangemenuCell", for: indexPath) as? ChangemenuCell{
            var dish=category1[indexPath.row]
            
            cell.updatecell(image: dish.image, name: dish.name)
            //var m=dg[indexPath.row]
            //cell.updatecell(image: m.image, name: m.name, desc: m.detail)
        //    print(dg[0].KeyID)
           // cell.lblname.text="Menu 1"
         //cell.imgmenu.image=#imageLiteral(resourceName: "image3")
            return cell
        }

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        var dish=category1[indexPath.row]
     
       UserDefaults.standard.set(dish.dishId, forKey: "NewDishId")
        UserDefaults.standard.set(dish.name, forKey: "NewDishName")
        UserDefaults.standard.set(dish.image, forKey: "NewDishImage")
        UserDefaults.standard.set(selectgroupid.groupName, forKey: "GroupName")
        
        
       // let dish1=Dish(_dContent: "1", _dDescription: "" ,_dId: self._dishId, _dIngredients:"1", _dName: self._dishName, _dRating:"99%", _dPrice: "", _dThumbnail: self._dishThumbnail, _dType: "Veg", _fPreparationTime: "1")
        
        
        

        
    }
    @IBAction func doneclick(_ sender: Any) {

        var days:String=UserDefaults.standard.value(forKey: "Day") as! String
        var n:String=days.components(separatedBy: " ")[1]
        print(n)
        
        var d1:Int=Int(n)!-1
        
        var sd1:String=String(d1)
        var Ndishid:String=UserDefaults.standard.value(forKey: "NewDishId") as! String
        
        
        
        
        let key:String=UserDefaults.standard.value(forKey: "UserDietId") as! String//UserDefaults.standard.set(programdetail.ID, forKey: "UserDietId")
               // UserDefaults.standard.set(programdetail.day, forKey: "Day")
        let ref = FIRDatabase.database().reference()
        print(key)
        
        let userRef = ref.child("UserDietProgram").child(key).child("dietProgram").child("dayProgram").child(sd1)//.observe(.value, with: {(snapshot) in
       // print(snapshot)})
        
        
   
        
        if(selectgroupid.groupName=="Lunch"){
            userRef.updateChildValues(["lunchDishID": Ndishid])
        }
        else if(selectgroupid.groupName=="Breakfast")
        {
            userRef.updateChildValues(["breakfastDishID": Ndishid])
            
            // userRef.setValue(Ndishid, forUndefinedKey: "breakfastDishID")
        }
        else if(selectgroupid.groupName=="Snack")
        {
            userRef.updateChildValues(["snacksDishId": Ndishid])
        }
        else if(selectgroupid.groupName=="Dinner")
        {
            userRef.updateChildValues(["dinnerDishId": Ndishid])
        }
        
        let all3 = FIRDatabase.database().reference(withPath:"Dish")
        all3.keepSynced(true)
       
              
           dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancleclick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func getdishitem()
    {
        dataref=FIRDatabase.database().reference()
        
        dataref.child("DishGroup").child(dg1[0].KeyID).child("dishItems").observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot)
            
            if(snapshot.childrenCount==0)
            {
                
            }
            else{
            
                
            
                    
                for i in 0...2{
                    
                    let m:String=(String(i))
                    print(m)

                    self._dishID=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "dishID").value! as! String
                    print(self._dishID)
                        self.dishitem.append(self._dishID)
                }
                
                    
                    if(self.dishitem.count>0)
                    {
                        
                        
                        print(self.dishitem.count)
                        print(self.d.count)
                        
                        self.showdata()
                        
                        
                  }
                    
                    
                    
                    
                    
                    
                    
                
                    
                    
                    
                    

                
                
            
            }
            
            
        })
     print(dishitem.count                                                                                               )
    }
    
    
    
    func showdata(){
        
        print(d.count)
        print(dishitem.count)
        
        
        if(self.d.count>0){
                            for i in 0...self.d.count-1
                            {
            
                                
                                let t=self.d[i]._dishId
                        
                                if(self.dishitem.count>1){
                                for m in 0...self.dishitem.count-1
                                {
                                    if(self.dishitem[m]==t)
                                    {
            
                                        self.category1.append(category(Name: self.d[i]._dishName, Image: self.d[i]._dishThumbnail,Dishid:self.dishitem[m]))
                                        
            
                                    }
                        
            
            
            
            
                                    
                                }
                                    
                                    self.tbchangemenu.delegate=self
                                    self.tbchangemenu.dataSource=self
                                    self.tbchangemenu.reloadData()
                                }
                                
                                
                                print(self.category1.count)
                                print(self.category1)
                                
                                
                            }
                        }
            

    }
    
    
    func retrivedishes()
    {
        
        print("dishitem count\(dishitem.count)")
        d.removeAll()
        
        dataref=FIRDatabase.database().reference()
        let all3 = FIRDatabase.database().reference(withPath:"Dish")
        all3.keepSynced(true)
        dataref.child("Dish").observeSingleEvent(of: .value, with: { (snapshot) in
            
            print(snapshot)
            
            
            
            if(snapshot.childrenCount==0)
            {
                
            }
            else{
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                    print(snapDict)
                    print("dishitem count\(self.dishitem.count)")
                    for child in snapDict{
                        //   _ = child.key as! String
                        //let shotKey = snapshot.children.nextObject() as! NSObject
                        
                        
                        
                        
                        if let  value=child.value as? [String:AnyObject]{
                            
        
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
            
//            
//            if(self.d.count>0){
//                for i in 0...self.d.count-1
//                {
//                    
//                    //self.category1.removeAll()
//                    let t=self.d[i]._dishId
//                    //  var d1=self.dayPro[0].day
////                    let dinn=self.dayPro[0].dinnerDishId
////                    let lunchid=self.dayPro[0].lunchDishId
////                    let snackid=self.dayPro[0].snacksDishId
//                    
//                    if(self.dishitem.count>1){
//                    for m in 0...self.dishitem.count-1
//                    {
//                        if(self.dishitem[m]==t)
//                        {
//                            
//                            self.category1.append(category(Name: self.d[i]._dishName, Image: self.d[i]._dishThumbnail))
//                            //self.category1.append(category(Name: "Breakfast:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
//                            
//                        }
////                        if(self.d[m]._dishId==dinn)
////                        {
////                            
////                            self.category1.append(category(Name:"Dinner:\( self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
////                            
////                        }
////                        if(self.d[m]._dishId==lunchid)
////                        {
////                            
////                            self.category1.append(category(Name:"Lunch: \(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image:self.d[m]._dishThumbnail))
////                            
////                        }
////                        if(self.d[m]._dishId==snackid)
////                        {
////                            
////                            self.category1.append(category(Name:" Snack:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
////                            
////                        }
//                        
//                        
//                        
//                        
//                        
//                        
//                    }
//                        
//                        self.tbchangemenu.delegate=self
//                        self.tbchangemenu.dataSource=self
//                        self.tbchangemenu.reloadData()
//                    }
//                    
//                    
//                    print(self.category1.count)
//                    print(self.category1)
//                    
//                    
//                }
//            }
            
            
            
            
            
        })
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    func getdishgroupdata()
    {
        dataref=FIRDatabase.database().reference()
        
        dataref.child("DishGroup").observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            if(snapshot.childrenCount==0)
            {
                
            }
            else{
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    print(snapshot.childSnapshot(forPath: "0").childSnapshot(forPath: "dishID").value!)
                    
                    for child in snapDict{
                        var ID = child.key as! String
                        //let shotKey = snapshot.children.nextObject() as! NSObject
                        
                        if let dayprogram1 = child.value as? [String:AnyObject]{
                            

                        self._grpid = dayprogram1["groupID"] as! String!
                            
                            print(self._grpid)
                       self._grname=dayprogram1["groupName"] as! String!
                            
                            print(self._grname)
                            
                            
                            
                            
                            
                            
//                            if let value1 = dayprogram1["dishItems"] {
//                                
//                                print(value1)
//                                for i in 0...2{
//                                    let m:String=(String(i))
//                                    print(m)
//                                    
//                                    
//                                    let m0=self.nullToNil(value: snapshot.childSnapshot(forPath: "dishID").value as AnyObject?)
//                                    print(m0!)
//                                    if(m0 != nil){
//                                        self._dishID=m0 as! String
//                                    }
//                                    else{
//                                        self._dishID=""
//                                    }
//
//                                    
//                                        print(self._dishID)
//                                    self.dishitem.append(self._dishID)
//
//                                }
//                                
//
//                            }

                            
                            print(self._grname.contains(self.selectgroupid.groupName))
                            var m:Bool=self._grname.contains(self.selectgroupid.groupName)
                            
                            if(self._grpid==self.selectgroupid.groupID)
                            {
                                
                               print("Enter")
                                
                                
                              //  self.dg1.append(DishGroup(GroupID: self._grpid, GrupName: self._grname, ID: ID, dishitem: self.dishitem ))
                                self.dg1.append(DishGroup(GroupID: self.selectgroupid.groupID, GrupName: self._grname, ID: ID))
                                
                              
                                
                            }
                        
                        }
                        
                        
                        
                        
                        
                        
                        
                            }
                }
                
                
                
                if(self.dg1.count>0)
                {
                       self.getdishitem()
                }
            }
        })
        
        
    }
    
    func nullToNil(value : AnyObject?) -> AnyObject? {
        if value is NSNull {
            return nil
        } else {
            return value
        }
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
