
//
//  DaySheduleVC.swift
//  Salado
//
//  Created by Rz on 14/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DaySheduleVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private var   _programdetail:dayProgram!
    var dataref: FIRDatabaseReference!
    var dish=[Dish]()
    var  programdetail : dayProgram{
        get {
            return _programdetail
            
        }
        set
        {
            _programdetail = newValue
        }
    }
    
    
    var _dishId:String!
    var _dishIngredients:String!
    var _dishName:String!
    var _dishThumbnail:String!
    
    
    var _brakfastid:String!
    var _day1:String!
    var _lunchid:String!
    var _dinnerid:String!
    var _snackid:String!
    var _breakfastDishID:String!
    var _day:String!
    
    @IBOutlet weak var tbdaysshedule: UITableView!
    
    
    
//    private var   _programdetail1:StartDiet!
//       var  programdetail1 : StartDiet{
//        get {
//            return _programdetail1
//            
//        }
//        set
//        {
//            _programdetail1 = newValue
//        }
//    }

    var daypro=[dayProgram]()
    var category1=[category]()
    var category1sorted=[category]()
    var d=[Dish]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(programdetail.day)
        print(programdetail)
   retrivedishesforday()
    navigationItem.title=programdetail.day
        
        
        
        
        print( programdetail.imgcheckuncheck)
        //("uc", forKey: "img")
            let all3 = FIRDatabase.database().reference(withPath:"Dish")
        all3.keepSynced(true)
       
       
        //getprodetailforday()
        
        
        tbdaysshedule.dataSource=self
        tbdaysshedule.delegate=self
        tbdaysshedule.reloadData()
        // Do any additional setup after loading the view.
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
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "Dayshedulecell", for: indexPath) as? Dayshedulecell{
            
//            if((UserDefaults.standard.value(forKey: "NewDishId") as! String) != nil
//                ){
//            var newdishid:String=UserDefaults.standard.value(forKey: "NewDishId") as! String
//            var newimage:String=UserDefaults.standard.value(forKey: "NewDishImage") as! String
//            var newdishname:String=UserDefaults.standard.value(forKey: "NewDishName") as! String
//            
//            var gpname:String=UserDefaults.standard.value(forKey: "GroupName") as! String
//
//        
//            
//            }
                var m=category1[indexPath.row]
            
//            UserDefaults.standard.set(dish.dishId, forKey: "NewDishId")
//            UserDefaults.standard.set(dish.name, forKey: "NewDishName")
//            UserDefaults.standard.set(dish.image, forKey: "NewDishImage")
//            UserDefaults.standard.set(selectgroupid.groupName, forKey: "GroupName")
            
            
            if(programdetail.imgcheckuncheck=="c")
            {
                cell.isUserInteractionEnabled=false
                cell.btnchange.isHidden=true
            }
            else if(programdetail.imgcheckuncheck=="uc")
            {
                cell.btnchange.isHidden=false
            }
            
            cell.updatecell(image: m.image, name: m.name, desc: m.detail,CU:programdetail.imgcheckuncheck,dat:programdetail.dat)
            
            if(cell.btnchange.isHidden==true){
                cell.isUserInteractionEnabled=false
            }
            
            
            
            cell.btnchange.addTarget(self, action: #selector(DaySheduleVC.clickonbutton(sender:)), for: .allEvents)
            // cell.stepper.addTarget(self, action: #selector(orderDetail.clickonstepper(sender:)), for: .valueChanged)
            return cell
        }
        
        
        
        
        return UITableViewCell()


    }
    
    
    //button click
    func clickonbutton(sender:UIButton)
    {
        
        
        
        UserDefaults.standard.set(programdetail.day, forKey: "Day")
        let pos = sender.convert(CGPoint.zero, to: tbdaysshedule)
        let indexPath = tbdaysshedule.indexPathForRow(at: pos)
        let cell: Dayshedulecell=tbdaysshedule.cellForRow(at: indexPath!) as! Dayshedulecell//tbordermenu.cellForRow(at: indexPath!) as! ordereditemcell
        //        let m=d[indexPath.row]
        
        //let ord1=order[(indexPath?.row)!]
       print(cell.lblname.text!)
        var c:String=cell.lblname.text!.components(separatedBy: ":")[0]
        print(c)
      var dg=[DishGroup]()
        //dg.removeAll()
        if(c == "Lunch"){
            dg.removeAll()
            dg.append(DishGroup(GroupID: programdetail.lunchGroupID, GrupName: c))
            print(programdetail.lunchGroupID)
            
            //var p=dg[(indexPath?.row)!]
           performSegue(withIdentifier: "squeitemchang", sender:dg[0])
        }
        else if(c == "Dinner"){
            print(programdetail.dinnerGroupID)
            
            
            dg.removeAll()
         
             dg.append(DishGroup(GroupID: programdetail.dinnerGroupID, GrupName: c))
           

            performSegue(withIdentifier: "squeitemchang", sender:dg[0])
        }
        else if(c == "Breakfast"){
            print(programdetail.breakfastGroupID)
            
            
            dg.removeAll()
            dg.append(DishGroup(GroupID: programdetail.breakfastGroupID, GrupName: c))
            //var p=dg[(indexPath?.row)!]
            performSegue(withIdentifier: "squeitemchang", sender:dg[0])
        }
        else if(c == "Snack"){
            print(programdetail.snacksGroupID)
            dg.removeAll()
            dg.append(DishGroup(GroupID: programdetail.snacksGroupID, GrupName: c))
            //var p=dg[(indexPath?.row)!]

          
            performSegue(withIdentifier: "squeitemchang", sender:dg[0])
        }
        
        //performSegue(withIdentifier: "squeitemchang", sender: nil)
        print("Change Menu \((indexPath?.row)!) row")
        
        
        
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination=segue.destination as? ChangeMenuVC{
            if let doc=sender as?  DishGroup{
                
                
                
                destination.selectgroupid=doc
                
                
                print("new")
            }
                   }
    }
    func getprodetailforday()
    {
        // UserDefaults.standard.set(programdetail.ID, forKey: "DietProgramKey")
        var dietprokey:String=UserDefaults.standard.value(forKey: "DietProgramKey") as! String
        print(dietprokey)
        
        daypro.removeAll()
        
       // print(programdetail.ID)
        //print(programdetail.programdays)
        
        var ds=programdetail.day.components(separatedBy: " ")[1]
        print(ds)
        var d:Int=Int(ds)!-1
        print(d)
        var day:String=String(d)
        dataref=FIRDatabase.database().reference()
        dataref.child("UserDietProgram").child(dietprokey).child("dietProgram").child("dayProgram").child(day).observe(.value, with: {(snapshot) in
            
            
            print(snapshot)
            
            
                self._brakfastid=snapshot.childSnapshot(forPath: "breakfastDishID").value! as! String
            if(self.programdetail.breakfastDishId==self._brakfastid)
            {
                self._brakfastid=self.programdetail.breakfastDishId
            }
            else{
                self.programdetail.breakfastDishId=self._brakfastid
            }
                print(self._brakfastid)
                
                self._lunchid=snapshot.childSnapshot(forPath: "lunchDishID").value! as! String
            
            
            
            
            if(self._lunchid==self.programdetail.lunchDishId)
            {
                self._lunchid=self.programdetail.lunchDishId
            }
            else{
                self.programdetail.lunchDishId=self._lunchid
            }
                self._dinnerid=snapshot.childSnapshot(forPath: "dinnerDishId").value! as! String
                
            
            
            if(self._dinnerid==self.programdetail.dinnerDishId)
            {
                self._lunchid=self.programdetail.lunchDishId
            }
            else{
                self.programdetail.lunchDishId=self._dinnerid
            }

            
            
                
                self._snackid=snapshot.childSnapshot(forPath: "snacksDishId").value! as! String
            
            
            if(self._snackid==self.programdetail.snacksDishId)
            {
                self._snackid=self.programdetail.snacksDishId
            }
            else{
                self.programdetail.snacksDishId=self._snackid
            }
            

            
            
                self._day1=snapshot.childSnapshot(forPath: "day").value! as! String
                
                
                print( self._snackid)
                
                self.daypro.append(dayProgram(breakfastDishId: self._brakfastid, day:"Day "+self._day1, dinnerDishId: self._dinnerid, lunchDishId: self._lunchid, snacksDishId: self._snackid))
                
                
                
          //}
            
            self.category1.removeAll()
                    let t=self.programdetail.breakfastDishId
                         print(t)
                                //  var d1=self.dayPro[0].day
                                let dinn=self.programdetail.dinnerDishId
                            print(dinn)
                                let lunchid=self.programdetail.lunchDishId
                            print(lunchid)
                                let snackid=self.programdetail.snacksDishId
                                print(snackid)
            
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
            
                                        self.category1.append(category(Name:"Snack:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
                                        
                                    }
                                    
                                    
                                    
                                    
                                    
                              
                            
                               
                               
                                
                           
                        
                        
                        
                        }
 
            print(self.category1.count)
//            
//            if(self.category1.count>1){
//         for i in 0...self.category1.count-1
//         {
//            if(self.category1[i].name.contains("Breakfast")==true){
//                
//                
//                self.category1sorted.insert(self.category1[i], at: 0)
//              //  self.category1sorted.append(self.category1[0])
//               }
//            if(self.category1[i].name.contains("Lunch")==true){
//                 self.category1sorted.insert(self.category1[i], at: 1)
//              //  self.category1sorted.append(self.category1[1])
//            }
//            if(self.category1[i].name.contains("Snack")==true){
//                 self.category1sorted.insert(self.category1[i], at: 2)
//               // self.category1sorted.append(self.category1[2])
//            }
//            if(self.category1[i].name.contains("Dinner")==true){
//                 //self.category1sorted.insert(self.category1[i], at: 3)
//               // self.category1sorted.append(self.category1[3])
//            }
//
//            }
//            }
//            print(self.category1sorted.count)
//            print(self.category1sorted)
            self.tbdaysshedule.dataSource=self
                self.tbdaysshedule.delegate=self
            self.tbdaysshedule.reloadData()
            
          
            
//            if(snapshot.childrenCount==0)
//            {
//                //self.tbdocterlist.isHidden=true
//                
//            }
//            else{
//                if let snapDict = snapshot.value  {
//                    
//                    
//                    print(snapDict)
//                    
//                    
//                    
//                    
//                   
//                    self.tbdaysshedule.dataSource=self
//                    self.tbdaysshedule.delegate=self
//                    self.tbdaysshedule.reloadData()
//                }
//            }
        })
        
        
        
        
        print(daypro.count)

        
    }
    
    
    
    func retrivedishesforday()
    {
        
        d.removeAll()
        
        var ds=programdetail.day.components(separatedBy: " ")[1]
         print(ds)
        var d1:Int=Int(ds)!
        print(d1)
        var day:String=String(d1)
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
                    
                    for child in snapDict{
                        //   _ = child.key as! String
                        //let shotKey = snapshot.children.nextObject() as! NSObject
                        
                        
                        
                        
                        if let  value=child.value as? [String:AnyObject]{
                            
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
            
            
            self.getprodetailforday()
            print(self.daypro.count)
          
//                for i in 0...d1-1
//                {
                var i=1
                    self.category1.removeAll()
                    
                   print(d1)
                
//                let t=self.programdetail.breakfastDishId
//print(t)
//                    //  var d1=self.dayPro[0].day
//                    let dinn=self.programdetail.dinnerDishId
//                print(dinn)
//                    let lunchid=self.programdetail.lunchDishId
//                print(lunchid)
//                    let snackid=self.programdetail.snacksDishId
//                    print(snackid)
//                    
//                    for m in 0...self.d.count-1
//                    {
//                        if(self.d[m]._dishId==t)
//                        {
//                            
//                            self.category1.append(category(Name: "Breakfast:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
//                            
//                        }
//                        if(self.d[m]._dishId==dinn)
//                        {
//                            
//                            self.category1.append(category(Name:"Dinner:\( self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
//                            
//                        }
//                        if(self.d[m]._dishId==lunchid)
//                        {
//                            
//                            self.category1.append(category(Name:"Lunch: \(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image:self.d[m]._dishThumbnail))
//                            
//                        }
//                        if(self.d[m]._dishId==snackid)
//                        {
//                            
//                            self.category1.append(category(Name:" Snack:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail))
//                            
//                        }
//                        
//                        
//                        
//                        
//                        
//                  
//                
//                   
//                   
//                    
//               
//            
//            
//            
//            }
            print(self.category1.count)
            print(self.category1)
            self.tbdaysshedule.delegate=self
            self.tbdaysshedule.dataSource=self
            self.tbdaysshedule.reloadData()
            
        })
        
        
        
        
        
        
        
        
     
        
        
    }

    

}
