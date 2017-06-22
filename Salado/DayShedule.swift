
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
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
 var category0=[category]()
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

    @IBOutlet weak var img: UIImageView!
    var daypro=[dayProgram]()
    var category1=[category]()
    var category1sorted=[category]()
    var d=[Dish]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(programdetail.day)
        print(programdetail)
        //showActivityIndicator()
   retrivedishesforday()
    navigationItem.title=programdetail.title
        
        
        
        img.image=UIImage.fontAwesomeIcon(name:.refresh , textColor: UIColor(red: 128/255, green: 82/255, blue: 10/255, alpha: 1), size: CGSize(width: 35, height: 35))
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
        return category0.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "Dayshedulecell", for: indexPath) as? Dayshedulecell{
            

                let m=category0[indexPath.row]
            

            
            
            if(programdetail.imgcheckuncheck=="c")
            {
                cell.isUserInteractionEnabled=false
                cell.btnchange.isHidden=true
            }
            else if(programdetail.imgcheckuncheck=="uc")
            {
                cell.btnchange.isHidden=false
                //cell.img.isHidden=false
            }
            
            cell.updatecell(image: m.image, name: m.name, desc: m.detail,CU:programdetail.imgcheckuncheck,dat:programdetail.dat)
            
            if(cell.btnchange.isHidden==true){
                cell.isUserInteractionEnabled=false
            }
            
            cell.setSelected(false, animated: true)
            
            
            
            
            
            
            
            
            
            
//            let singleTap3 = UITapGestureRecognizer(target: self, action: #selector(DaySheduleVC.clickonbutton))
//            singleTap3.numberOfTapsRequired = 1 // you can change this value
//         cell.img.isUserInteractionEnabled = true
//            cell.img.addGestureRecognizer(singleTap3)

            
            
            
           
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
        let c:String=cell.lblname.text!.components(separatedBy: ":")[0]
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
        //showActivityIndicator()
        // UserDefaults.standard.set(programdetail.ID, forKey: "DietProgramKey")
        let dietprokey:String=UserDefaults.standard.value(forKey: "DietProgramKey") as! String
        print(dietprokey)
        
        daypro.removeAll()
        
       // print(programdetail.ID)
        //print(programdetail.programdays)
        
        let ds=programdetail.day.components(separatedBy: " ")[1]
        print(ds)
        let d:Int=Int(ds)!-1
        print(d)
        let day:String=String(d)
        dataref=FIRDatabase.database().reference()
        dataref.child("UserDietProgram").child(dietprokey).child("dietProgram").child("dayProgram").child(day).observe(.value, with: {(snapshot) in
            
            
            print(snapshot)
            
           // self.showActivityIndicator()
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
            
                                        self.category1.append(category(Name: "Breakfast:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail,type: "Breakfast"))
            
                                    }
                                    if(self.d[m]._dishId==dinn)
                                    {
            
                                        self.category1.append(category(Name:"Dinner:\( self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail,type: "Dinner"))
            
                                    }
                                    if(self.d[m]._dishId==lunchid)
                                    {
            
                                        self.category1.append(category(Name:"Lunch: \(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image:self.d[m]._dishThumbnail,type:"Lunch"))
            
                                    }
                                    if(self.d[m]._dishId==snackid)
                                    {
            
                                        self.category1.append(category(Name:"Snack:\(self.d[m]._dishName)", Detail: self.d[m]._dishIngredients, Image: self.d[m]._dishThumbnail,type:"Snack"))
                                        
                                    }
                                    
                                    
                                    
                                    
                                    
                              
                            
                               
                               
                                
                           
                        
                        
                        
                        }
 
            print(self.category1.count)

            
            
            
            
            self.category0.removeAll()
            print(self.category0)
            for i in 0...self.category1.count-1{
                if(self.category1[i].type=="Breakfast")
                {
                    self.category0.insert(self.category1[i], at: 0)
                }
            }
            
            
            for i in 0...self.category1.count-1{
                if(self.category1[i].type=="Lunch")
                {
                    self.category0.insert(self.category1[i], at: 1)
                }
            }
            for i in 0...self.category1.count-1{
                if(self.category1[i].type=="Snack")
                {
                    self.category0.insert(self.category1[i], at: 2)
                }
            }
            for i in 0...self.category1.count-1{
                if(self.category1[i].type=="Dinner")
                {
                    self.category0.insert(self.category1[i], at: 3)
                }
            }
            print(self.category0)
          
            self.tbdaysshedule.dataSource=self
                self.tbdaysshedule.delegate=self
            self.tbdaysshedule.reloadData()
            self.hideActivityIndicator()
          
            

        })
        
        
        
        
        print(daypro.count)

        
    }
    
    
    
    func retrivedishesforday()
    {
        
        d.removeAll()
      showActivityIndicator()
        let ds=programdetail.day.components(separatedBy: " ")[1]
         print(ds)
        let d1:Int=Int(ds)!
        print(d1)
       // var day:String=String(d1)
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
            self.hideActivityIndicator()
            
            self.getprodetailforday()
            print(self.daypro.count)
          
//                for i in 0...d1-1
//                {
               // var i=1
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
             self.hideActivityIndicator()
            print(self.category1.count)
            print(self.category1)
            self.tbdaysshedule.delegate=self
            self.tbdaysshedule.dataSource=self
            self.tbdaysshedule.reloadData()
            self.hideActivityIndicator()
        })
        
        
        
        
        
        
         self.hideActivityIndicator()
        
     
        
        
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
        
        
        
    }
    func hideActivityIndicator() {
        
        // DispatchQueue.main.async {
        loadingView.backgroundColor=UIColor.clear
        self.spinner.stopAnimating()
        self.loadingView.removeFromSuperview()
        //}
    }

}
