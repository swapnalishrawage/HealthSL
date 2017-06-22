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
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()

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
    var dts=[String]()
    var  programdetail : StartDiet{
        get {
            return _programdetail
            
        }
        set
        {
            _programdetail = newValue
        }
    }
    

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tbdays: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
navigationItem.title=programdetail.programName
        print(programdetail.ID)
       print(programdetail.startDate)
        
        
        
         img.image = UIImage.fontAwesomeIcon(name:.checkCircle, textColor:UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1), size: CGSize(width: 35, height: 35))
        dts.removeAll()
      //  let calendar = NSCalendar.current
        
        
        //var date = programdetail.startDate // first date
        //let endDate = programdetail.endDate //Date() // last date
        
        // Formatter for printing the date, adjust it according to your needs:
        let fmt = DateFormatter()
        fmt.dateFormat = "dd/MM/yyyy"
        
        
          let s=fmt.date(from: programdetail.startDate)
        let endDate1=fmt.date(from: programdetail.endDate)
        print(s!)
        print(endDate1!)
        
//        while s <= endDate1 {
//           // print(fmt.string(from: date))
//            s = calendar.date(byAdding: .day, value: 1, to: s!)!
//            print(s)
//        }
        
        
        
        printDatesBetweenInterval(s!, endDate1!)
        
        
        print(programdetail.endDate)
        
        
        
        
        UserDefaults.standard.set(programdetail.ID, forKey: "UserDietId")
         dayPro.removeAll()
      showActivityIndicator()
        getdayprogram()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        
//tbdays.reloadData()
//        tbdays.delegate=self
//        tbdays.dataSource=self
//        
        
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
            let p:String=dt.components(separatedBy: "/")[0]
         //   let p0:String=dt.components(separatedBy: "/")[1]
         //   let p1:String=dt.components(separatedBy: "/")[2]
            var pinint:Int!//=Int(p)!+1
            
            
            
//            let days = getDaysInMonth(month: Int(p0)!, year: Int(p1)!) // April 2015 has 30 days
//            print(days)
            
//            if(String(days)==p){
//                pinint=1
//                p0=String(Int(p0)!+1)
//                
//            }
//            else if(String(days)<=p){
//                
//                
//            }

            
            if(indexPath.row==0)
            {
                pinint=Int(p)!+0
                dt=programdetail.startDate
            }
            else{
                
                pinint=Int(p)!+indexPath.row
                
            }
           // let s:String=String(pinint)+"/"+p0+"/"+p1
            
            print(pinint)
            
  
            //dateformat1.dateFormat="dd MMM yyyy"//"EEE"
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"//this your string date format
            //dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
            //let date1 = dateFormatter.date(from: s)
           // var d1:Date=dateformat1.date(from: s!) as Date!
          //  print(date1!)
       //  print( formatDate(date: date1 ))
            cell.updatecell(image: "", Day: datp.day, Desc:datp.desc, date1: dts[indexPath.row],title:datp.title)
            //datp.dat=s
            datp.dat=dts[indexPath.row]
         print( UserDefaults.standard.value(forKey: "img")! as! String)
           
            datp.imgcheckuncheck=UserDefaults.standard.value(forKey: "img")! as! String
            //cell.updatecell(image: "", Day: datp.day, Desc:"Description")
            
            
            return cell
        }
return UITableViewCell()
    }
    func formatDate(date: NSDate) -> String {
        let format = "dd MMM yyyy"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date as Date)
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
        
        
        
//        dataref.child("UserRegistration").queryOrdered(byChild: "userid").queryEqual(toValue: txtuserid.text).observeSingleEvent(of: .value, with: { snapshot in
//            if snapshot.exists()
//            {

        
        
        dataref.child("UserDietProgram").child(programdetail.ID).child("dietProgram").child("dayProgram").observe(.value, with: {(snapshot) in
            
            
            print(snapshot)
            
        //    var j:String!
            for i in 0...self.programdetail.programdays-1{
                
                
                let mc:String=(String(i))
                print(mc)
                
                //
                var m:String!
                
                
                let mk=self.nullToNil(value: snapshot.childSnapshot(forPath: mc).value as AnyObject?)
                print(mk!)
                if(mk != nil){
                   //j=mk as! String
                }
                else{
                   // j=""
                }
                
                if(mk==nil){
                    let mp:Int=Int(mc)!+1
                    
                     m=String(mp)
                }
                else
                {
                    m=(String(i))
                }
                
                
                let m2=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "breakfastDishID").value as AnyObject?)
                print(m2!)
                if(m2 != nil){
                    self._breakfastGroupID=m2 as! String
                }
                else{
                    self._breakfastGroupID=""
                }
                

                
                
               // self._brakfastid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "breakfastDishID").value! as! String
                //print(self._brakfastid)
                
               // print(snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "breakfastGroupID").value!)
                
                
                
                
                
                
           let m0=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "breakfastGroupID").value as AnyObject?)
               
                if(m0 != nil){
              self._brakfastid=m0 as! String
                }
                else{
                    self._brakfastid=""
                }
                
                
                
                let m20=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "lunchDishID").value as AnyObject?)
                
                if(m20 != nil){
                   self._lunchid=m20 as! String
                }
                else{
                    self._lunchid=""
                }

                
                
                
                let m3=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "lunchGroupID").value as AnyObject?)
              
                if(m2 != nil){
                   self._lunchGroupID=m3 as! String
                }
                else{
                    self._lunchGroupID=""
                }
                
                
                //self._lunchid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "lunchDishID").value! as! String
                
                
              //self._lunchGroupID=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "lunchGroupID").value! as! String
                
                
                
                
                let m4=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "dinnerDishId").value as AnyObject?)
             
                if(m4 != nil){
                    self._dinnerid=m4 as! String
                }
                else{
                    self._dinnerid=""
                }
                
                
                
                
                //self._dinnerid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "dinnerDishId").value! as! String
                
                
                
                let m6=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "dinnerGroupID").value as AnyObject?)
               
                if(m6 != nil){
                    self._dinnerGroupID=m6 as! String
                }
                else{
                    self._dinnerGroupID=""
                }
                
                
                //self._dinnerGroupID=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "dinnerGroupID").value! as! String
                
                
                
                
                let m1=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "snacksDishId").value as AnyObject?)
             
                if(m1 != nil){
                    self._snackid=m1 as! String
                }
                else{
                    self._snackid=""
                }
                
                
                
              //  self._snackid=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "snacksDishId").value! as! String
                
                
                
                
                let m5=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "snacksGroupID").value as AnyObject?)
                
                if(m5 != nil){
                    self._snacksGroupID=m5 as! String
                }
                else{
                    self._snacksGroupID=""
                }

                
                
               // self._snacksGroupID=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "snacksGroupID").value! as! String
                
                
                
                let m7=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "day").value as AnyObject?)
                
                if(m7 != nil){
                    self._day1=m7 as! String
                }
                else{
                    self._day1=""
                }

                
               // self._day1=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "day").value! as! String
                
                //print(self._day1)
                
                
                let m8=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "title").value as AnyObject?)
              
                if(m8 != nil){
                    self._title=m8 as! String
                }
                else{
                    self._title=""
                }
                
                //self._title=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "title").value! as! String
                
                
                
                
                let m9=self.nullToNil(value: snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "desc").value as AnyObject?)
              
                if(m9 != nil){
                    self._desc=m9 as! String
                }
                else{
                    self._desc=""
                }

                
                //self._desc=snapshot.childSnapshot(forPath: m).childSnapshot(forPath: "desc").value! as! String
                
                //print( self._snackid)
                
                
                print(self._brakfastid)
                print(self._day1)
                print(self._dinnerGroupID)
                print(self._snacksGroupID)
                print(self._lunchGroupID)
                print(self._breakfastGroupID)
                print(self._dinnerid)
                print(self._desc)
                print(self._title)
                
                
                if(m=="0" && self._lunchGroupID==nil){
                    
                }
                else{
                
                self.dayPro.append(dayProgram(breakfastDishId: self._brakfastid, day:"Day "+self._day1, dinnerDishId: self._dinnerid, lunchDishId: self._lunchid, snacksDishId: self._snackid, breakfastGID: self._breakfastGroupID, lunchGID: self._lunchGroupID, dinnerGID: self._dinnerGroupID, SnackGID: self._snacksGroupID, Title: self._title, Desc: self._desc,ImgCU:"",dt:""))
                }
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
            
            self.hideActivityIndicator()
        })
        
        
        
        
        
        
        
    }
    

    
    func nullToNil(value : AnyObject?) -> AnyObject? {
        if value is NSNull {
            return nil
        } else {
            return value
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
//    func getDaysInMonth(month: Int, year: Int) -> Int
//    {
//        let calendar = NSCalendar.current
//        
//        let startComps = NSDateComponents()
//        startComps.day = 1
//        startComps.month = month
//        startComps.year = year
//        
//        let endComps = NSDateComponents()
//        endComps.day = 1
//        endComps.month = month == 12 ? 1 : month + 1
//        endComps.year = month == 12 ? year + 1 : year
//        
//        let startDate = calendar.date(from: startComps as DateComponents) //calendar.dateFromComponents(startComps)!
//        let endDate =  calendar.date(from: endComps as DateComponents) //calendar.dateFromComponents(endComps)!
//        
//        let diff =calendar.component(<#T##component: Calendar.Component##Calendar.Component#>, from: <#T##Date#>) //calendar.components(NSCalendar.Unit.Day, fromDate: startDate, toDate: endDate, options: NSCalendar.Options.MatchFirst)
//        
//        return diff.day
//    }
    
     // Prints 30
    
    
   func printDatesBetweenInterval(_ startDate: Date, _ endDate: Date) {
        var startDate = startDate
        let calendar = Calendar.current
        
        let fmt = DateFormatter()
        fmt.dateFormat = "dd MMM yyyy"
        
        while startDate <= endDate {
            print(fmt.string(from: startDate))
            dts.append(fmt.string(from: startDate))
            startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        }
    }
    
   func dateFromString(_ dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return dateFormatter.date(from: dateString)!
    }

}
