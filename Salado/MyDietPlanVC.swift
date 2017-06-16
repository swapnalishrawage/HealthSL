//
//  MyDietPlanVC.swift
//  Salado
//
//  Created by Rz on 13/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
class MyDietPlanVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tbdiet: UITableView!
    var _proname:String!
    var _proamm:String!
    var _prorating:String!
    var _proimage:String!
    var _proinclude:String!
    var _dinnerinclude:Bool!
    var _lunchinclude:Bool!
    var _dayprogram:dayProgram!
    var _prodes:String!
    var _proid:String!
    var _protype:String!
    var _snacinclude:Bool!
    var _proday:Int!
    var _breakfastinclude:Bool!
    var _customized:Bool!
    
    
    var _endDate:String!
    var _startDate:String!
    var _userId1:String!
    var _day:String!
    
    
    var startdiet=[StartDiet]()
    var dayprog=[dayProgram]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem?.title="< "
        navigationItem.title="MY DIET PROGRAM"
        retrivestandardDietprogram()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backclick(_ sender: Any) {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //tableview func
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell=tableView.dequeueReusableCell(withIdentifier: "MyDietPlanCell", for: indexPath) as? MyDietPlanCell{
            let stdiet=startdiet[indexPath.row]
            cell.view1.layer.borderColor=UIColor.gray.cgColor
            
            cell.view1.layer.borderWidth=2
            //cell.layer.borderColor=UIColor.gray.cgColor
            //cell.layer.borderWidth=2
           // cell.updatecell(name: stdiet.programName, amount: stdiet.programPrice, rating: stdiet.programRating, thum: stdiet.programThumb, programinclude: "Program Include")
            
            
            
            cell.updatecell(name: stdiet.programName, day: stdiet.programdays, rating: stdiet.programRating, thum: stdiet.programThumb, programinclude: "Program Include")
            
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return startdiet.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let st=startdiet[indexPath.row]
        
       performSegue(withIdentifier: "squeday", sender: st)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination=segue.destination as? DayListVC{
            if let doc=sender as?  StartDiet{
                
                
                print(doc.programDescription)
                destination.programdetail=doc
                
                
                print("new")
            }
        }
    }
    
    
    
    
    func retrivestandardDietprogram()
    {
        let dataref=FIRDatabase.database().reference()
        
        
        
        
        
        dataref.child("UserDietProgram").observeSingleEvent(of: .value, with: { (snapshot) in
            
         
            if(snapshot.childrenCount==0)
            {
                //self.tbdocterlist.isHidden=true
                
            }
            else{
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                    self.startdiet.removeAll()
                
                    for child in snapDict{
                        
                        
                        
                        let ID = child.key
                        
                    
                    
                        

                      print(snapshot.childSnapshot(forPath: ID).childSnapshot(forPath: "userId").value)
                      
                        var loginuser:String=UserDefaults.standard.value(forKey: "KEY") as! String
                        
                         // UserDefaults.standard.set(child.key, forKey: "KEY")
                        if let dayprogram1 = child.value as? [String:AnyObject]{
                            
                            
                            
                            print(dayprogram1["userId"] as! String!)
                            self._userId1=dayprogram1["userId"] as! String!
                            
                            
                            if(self._userId1==loginuser){
                                
                            
                            
                            
                            self._endDate=dayprogram1["endDate"] as! String!
                            print(self._endDate)
                          self._startDate=dayprogram1["startDate"] as! String!
                               print(self._startDate)
                          
                            
                         print(dayprogram1)
                       
                            
                            
                            
                            
                            if let value1 = dayprogram1["dietProgram"] as? [String:AnyObject]{
                                
                                
//                                self._userId1=dayprogram1["userId"] as! String
//                                print(self._userId1)
                                
                                
                              self._proname = value1["programName"] as! String!
                                print(self._proname)
                                
                                
                                
                                self._proamm=value1["programPrice"] as! String!
                                     print(self._proamm)
                                self._prodes = value1["programDescription"] as! String!
                                
                                print(  self._prodes)
                                self._proid = value1["programId"] as! String!
                                
                                self._prorating = value1["programRatings"] as! String!
                                
                                self._proimage = value1["programThumbnailUrl"] as! String!
                                self._protype = value1["programType"] as! String!
                                
                                
                                self._proday = value1["programDays"] as! Int!
                                self._dinnerinclude=value1["dinnerInclude"] as! Bool!
                                
                                
                                self._lunchinclude=value1["lunchInclude"] as! Bool!
                                
                                self._snacinclude=value1["snacksInclude"] as! Bool!
                                
                                self._breakfastinclude=value1["breakfastInclude"] as! Bool!
                                
                                
                                
                                
                               
                                self._customized=value1["customized"] as! Bool!
                                
                                if let value0 = value1["dayProgram"] as? [String:AnyObject]{
                                    
                                    self._day=value0["day"] as! String!
                                    
                                    
                                }
                                
                                

                                
                                
                            }
                            
                            
                            
                            
                            
                       
                            
                            // var dp=dayProgram(breakfastDishId: "", day: self._day, dinnerDishId: "", lunchDishId: "", snacksDishId: "")
                            // self.dayprog.append(dp)
                            
                            
                            
                            let m = StartDiet(dinnerinclud: self._dinnerinclude, lunchinclud: self._lunchinclude, programday: self._proday, programdes: self._prodes, programid: self._proid, programName: self._proname, programprice: self._proamm, programrating: self._prorating, programthub: self._proimage, programtype: self._protype, programamount: self._proamm, snackinclude: self._snacinclude, breakfastinclude: self._breakfastinclude, customise: self._customized,ID:ID,Enddate:self._endDate,StartDate:self._startDate,Userid:self._userId1)
                            
                            
                            self.startdiet.append(m)
                            
                            
                        }
                            else{
                                print("not current user")
                            }
                        }
                       
//                        print(self._lunchinclude)
//                        print(self._proimage)
//                        print(self._protype)
//                        print(self._proname)
//                        print(self._proday)
//                        print(self._dinnerinclude)
//                        
//                        print(self._prodes)
//                        print(self._proid)
//                        print(self._proamm)
//                        print(self._prorating)
//                        print(self._snacinclude)
//                        
//                        print(self._breakfastinclude)
//                        print(self._customized)
                        
                        
                    
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    self.tbdiet.dataSource=self
                    self.tbdiet.delegate=self
                    self.tbdiet.reloadData()
                    if(self.startdiet.count>3)
                    {
                        self.tbdiet.isScrollEnabled=true
                    }
                    else{
                        self.tbdiet.isScrollEnabled=false
                    }
                    
                    
                }
                
                
                
                
                
                
                
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
        
        
    }

}
