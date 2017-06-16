 //
//  StartDietVC.swift
//  Salado
//
//  Created by Rz on 18/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseMessaging
 


class StartDietVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
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
    
    
    var _day:String!
    
    
    var startdiet=[StartDiet]()
    var dayprog=[dayProgram]()
    @IBOutlet weak var tbstartdiet: UITableView!

    @IBOutlet weak var lblwtgainprogram: UILabel!
    @IBOutlet weak var lblwtgainm: UILabel!
    @IBOutlet weak var blbwtgain: UILabel!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var lblwtloss: UILabel!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lblrate: UILabel!
    @IBOutlet weak var lblwtlossm: UILabel!
    var dataref: FIRDatabaseReference!
    
    @IBOutlet weak var lblwtlossprograminclude: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem?.title="< "
         navigationItem.title="DIET PROGRAM"
        retrivestandardDietprogram()
        
    
       
//                view3.layer.borderWidth=2
//        view3.layer.borderColor=UIColor.gray.cgColor
//        view2.layer.borderWidth=2
//        view2.layer.borderColor=UIColor.gray.cgColor
//        view1.layer.borderWidth=2
//        view1.layer.borderColor=UIColor.gray.cgColor
        // Do any additional setup after loading the view.
    }

    @IBAction func backclick(_ sender: Any) {
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "MonthlydietClickVC") as! MonthlydietClickVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tableviewdelegate functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return startdiet.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "startdietcell",for:indexPath) as? startdietcell
        {
            
            let stdiet=startdiet[indexPath.row]
            cell.view1.layer.borderColor=UIColor.gray.cgColor
            cell.view1.layer.borderWidth=2
            //cell.layer.borderColor=UIColor.gray.cgColor
            //cell.layer.borderWidth=2
         cell.updatecell(name: stdiet.programName, amount: stdiet.programPrice, rating: stdiet.programRating, thum: stdiet.programThumb, programinclude: "Program Include")
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stdiet=startdiet[indexPath.row]
        print(stdiet.programdays)
       print(stdiet.programDescription)
        performSegue(withIdentifier: "squedetailclick", sender:stdiet)

    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination=segue.destination as? CrashDetailVC{
            if let doc=sender as?  StartDiet{
                
                
            print(doc.programDescription)
                destination.programdetail=doc
                
                print("new")
            }
        }

    }
    func setborder(view:UIView)
    {
        view.layer.borderWidth=2
        view.layer.borderColor=UIColor.gray.cgColor
    }

    
    
    func retrivestandardDietprogram()
    {
        let dataref=FIRDatabase.database().reference()
        
        

        
        
        dataref.child("StandardDietProgram").observeSingleEvent(of: .value, with: { (snapshot) in
            
            print(snapshot)
            if(snapshot.childrenCount==0)
            {
                //self.tbdocterlist.isHidden=true
                
            }
            else{
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                    self.startdiet.removeAll()
                    print(snapDict)
                    for child in snapDict{
                        
                        
                        
                        let ID = child.key 
                       
                        
                        
                        
                        
                        
                        if let dayprogram1 = child.value as? [String:AnyObject]{
                            
                            
                            
                            
                            
                            
                                
                                
                                self._proname = dayprogram1["programName"] as! String!
                                
                                self._proamm=dayprogram1["programPrice"] as! String!
                                
                                self._prodes = dayprogram1["programDescription"] as! String!
                                
                                
                                self._proid = dayprogram1["programId"] as! String!
                                
                                self._prorating = dayprogram1["programRatings"] as! String!
                                
                                self._proimage = dayprogram1["programThumbnailUrl"] as! String!
                                self._protype = dayprogram1["programType"] as! String!
                                
                                
                                 self._proday = dayprogram1["programDays"] as! Int!
                                self._dinnerinclude=dayprogram1["dinnerInclude"] as! Bool!
                                
                                
                                self._lunchinclude=dayprogram1["lunchInclude"] as! Bool!
                                
                                self._snacinclude=dayprogram1["snacksInclude"] as! Bool!
                            
                            self._breakfastinclude=dayprogram1["breakfastInclude"] as! Bool!
                           
                            
                            
                            self._customized=dayprogram1["customized"] as! Bool!

                               if let value1 = dayprogram1["dayProgram"] as? [String:AnyObject]{
                                
                                self._day=value1["day"] as! String!
                                
                                
                                  }
                            
                            
                            
                           if let    dayprogram=dayprogram1["dayProgram"]                            {
                            
                            print(dayprogram)
                            for _ in 0...self._proday{
                                //self._day=dayprogram["day"] as? String
                                     //print(self._day)
                            }
                            
                          //  print(self._day)
                            
                            
                            }
                            
                               // var dp=dayProgram(breakfastDishId: "", day: self._day, dinnerDishId: "", lunchDishId: "", snacksDishId: "")
                           // self.dayprog.append(dp)
                          
                            
                            
                            
                            
                            
                        }
                        print(self._lunchinclude)
                        print(self._proimage)
                        print(self._protype)
                        print(self._proname)
                             print(self._proday)
                      print(self._dinnerinclude)
                        
                        print(self._prodes)
                        print(self._proid)
                           print(self._proamm)
                         print(self._prorating)
                        print(self._snacinclude)
                        
                        print(self._breakfastinclude)
                          print(self._customized)
                        
                        
                        let m = StartDiet(dinnerinclud: self._dinnerinclude, lunchinclud: self._lunchinclude, programday: self._proday, programdes: self._prodes, programid: self._proid, programName: self._proname, programprice: self._proamm, programrating: self._prorating, programthub: self._proimage, programtype: self._protype, programamount: self._proamm, snackinclude: self._snacinclude, breakfastinclude: self._breakfastinclude, customise: self._customized,ID:ID)
                        
            
                        self.startdiet.append(m)
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    self.tbstartdiet.dataSource=self
                    self.tbstartdiet.delegate=self
                    self.tbstartdiet.reloadData()
                    if(self.startdiet.count>3)
                    {
                        self.tbstartdiet.isScrollEnabled=true
                    }
                    else{
                        self.tbstartdiet.isScrollEnabled=false
                    }
                    
                    
                                  }
                
                
                
                
                
                
        
            }
            
        }) { (error) in
            print(error.localizedDescription)
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

    @IBAction func weightgaindetailclick(_ sender: Any) {
       // performSegue(withIdentifier: "squedetailclick", sender: nil)
    }
    
    @IBAction func weightlossdetailclick(_ sender: Any) {
         // performSegue(withIdentifier: "squedetailclick", sender: nil)
    }
    
    @IBAction func athlaticdetailclick(_ sender: Any) {
        //  performSegue(withIdentifier: "squedetailclick", sender: nil)
    }
 
    
    
}
