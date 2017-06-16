//
//  DayListVC.swift
//  Salado
//
//  Created by Rz on 14/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DayListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var _brakfastid:String!
    var _day1:String!
    var _lunchid:String!
    var _dinnerid:String!
    var _snackid:String!
    var _breakfastDishID:String!
    var _day:String!
    
    var _breakfastGroupID:String!
    var _dinnerGroupID:String!
    var _lunchGroupID:String!
    var _snacksGroupID:String!
    var _title:String!
    var _desc:String!
    
    var category1=[category]()
    var d=[Dish]()
    var dayPro=[dayProgram]()
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
    

    @IBOutlet weak var tbdays: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
navigationItem.title=programdetail.programName
        print(programdetail.ID)
       print(programdetail.startDate)
        
        print(programdetail.endDate)
        UserDefaults.standard.set(programdetail.ID, forKey: "UserDietId")
         dayPro.removeAll()
      
        getdayprogram()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
        //dayPro.removeAll()
//        
       //getdayprogram()
//        tbdays.delegate=self
//        tbdays.dataSource=self
//        tbdays.reloadData()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        getdayprogram()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //func tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayPro.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell=tableView.dequeueReusableCell(withIdentifier: "DaylistCell", for: indexPath) as? DaylistCell{
            let datp=dayPro[indexPath.row]
            var dt:String=programdetail.startDate
            var p:String=dt.components(separatedBy: "/")[0]
            var p0:String=dt.components(separatedBy: "/")[1]
            var p1:String=dt.components(separatedBy: "/")[2]
            var pinint:Int!//=Int(p)!+1
            
            if(indexPath.row==0)
            {
                pinint=Int(p)!+0
                dt=programdetail.startDate
            }
            else{
                
                pinint=Int(p)!+indexPath.row
                
            }
            var s:String=String(pinint)+"/"+p0+"/"+p1
            
            cell.updatecell(image: "", Day: datp.day, Desc:datp.desc, date1: s)
            datp.dat=s
         print( UserDefaults.standard.value(forKey: "img")! as! String)
           
            datp.imgcheckuncheck=UserDefaults.standard.value(forKey: "img")! as! String
            //cell.updatecell(image: "", Day: datp.day, Desc:"Description")
            
            
            return cell
        }
return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let datp=dayPro[indexPath.row]
        
        performSegue(withIdentifier: "squedayshedule", sender: datp)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination=segue.destination as? DaySheduleVC{
            if let doc=sender as?  dayProgram{
                
            
                
               destination.programdetail=doc
                
                
                print("new")
            }
//            else  if let destination=segue.destination as? DaySheduleVC{
//                if let doc=sender as?  StartDiet{
//                    
//                    
//                    print(doc.programDescription)
//                    destination.programdetail1=doc
//                    
//                    
//                    print("new")
//                }
//            }
        }

    }
    
    
    func getdayprogram()
    {
        dayPro.removeAll()
        print(programdetail.ID)
        UserDefaults.standard.set(programdetail.ID, forKey: "DietProgramKey")
        
        print(programdetail.programdays)
        dataref=FIRDatabase.database().reference()
        dataref.child("UserDietProgram").child(programdetail.ID).child("dietProgram").child("dayProgram").observe(.value, with: {(snapshot) in
            
            
            print(snapshot)
            
            
            for i in 0...self.programdetail.programdays-1{
                
                
                let m:String=(String(i))
                print(m)
                
                
                
                
                
                
                
                
                
                
                self._brakfastid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "breakfastDishID").value! as! String
                print(self._brakfastid)
                
                print(snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "breakfastGroupID").value!)
                
                
                
                
                
                
           var m0=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "breakfastGroupID").value as AnyObject?)
                print(m0)
                if(m0 != nil){
              self._breakfastGroupID=m0 as! String
                }
                else{
                    self._breakfastGroupID=""
                }
                
                
                
                
                self._lunchid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "lunchDishID").value! as! String
                
                
              self._lunchGroupID=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "lunchGroupID").value! as! String
                
                
                
                
                
                self._dinnerid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "dinnerDishId").value! as! String
                
                
                
                
                self._dinnerGroupID=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "dinnerGroupID").value! as! String
                
                
                
                
                let m1=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "snacksDishId").value as AnyObject?)
                print(m1)
                if(m1 != nil){
                    self._snackid=m1 as! String
                }
                else{
                    self._snackid=""
                }
                
                
                
              //  self._snackid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "snacksDishId").value! as! String
                
                
                
                self._snacksGroupID=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "snacksGroupID").value! as! String
                
                
                
                self._day1=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "day").value! as! String
                
                print(self._day1)
                
                
                self._title=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "title").value! as! String
                
                
                
                
                self._desc=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "desc").value! as! String
                
                print( self._snackid)
                
                
                
                self.dayPro.append(dayProgram(breakfastDishId: self._brakfastid, day:"Day "+self._day1, dinnerDishId: self._dinnerid, lunchDishId: self._lunchid, snacksDishId: self._snackid, breakfastGID: self._breakfastGroupID, lunchGID: self._lunchGroupID, dinnerGID: self._dinnerGroupID, SnackGID: self._snacksGroupID, Title: self._title, Desc: self._desc,ImgCU:"",dt:""))
                //self.dayPro.append(dayProgram(breakfastDishId: self._brakfastid, day:"Day "+self._day1, dinnerDishId: self._dinnerid, lunchDishId: self._lunchid, snacksDishId: self._snackid))
                
                
        
                
                
            }
            if(self.dayPro.count>0)
            {
                //self.category1.removeAll()
                self.tbdays.dataSource=self
                self.tbdays.delegate=self
                self.tbdays.reloadData()
                //self.dayPro.removeAll()
            }
            
            
            
          
            
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
                    
                    
//                    self.tbdays.dataSource=self
//                    self.tbdays.delegate=self
//                    self.tbdays.reloadData()
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
