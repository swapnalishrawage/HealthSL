//
//  BookAppoitmentVC.swift
//  Salado
//
//  Created by Mac on 28/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class BookAppoitmentVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var s:Int!
    var e:Int!
    var hide:Bool=true
    var daystd=[String]()
    @IBOutlet weak var btnbook: UIButton!
    @IBOutlet weak var viewcoll: UIView!
    @IBOutlet weak var lblholiday: UILabel!
    @IBOutlet weak var v7: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var colltime: UICollectionView!
    var singletab:Bool=false
    var docava=[doctorAvalabilities]()
    
    @IBOutlet weak var rightclick: UIBarButtonItem!
    @IBOutlet weak var lbldate6: UILabel!
    @IBOutlet weak var lblday6: UILabel!
    @IBOutlet weak var lbldate5: UILabel!
    
    @IBOutlet weak var lbldate7: UILabel!
    @IBOutlet weak var lblday7: UILabel!
    @IBOutlet weak var lblday5: UILabel!
    
    @IBOutlet weak var lbldate4: UILabel!
    @IBOutlet weak var lblday4: UILabel!
    @IBOutlet weak var lbldate3: UILabel!
    @IBOutlet weak var lblday3: UILabel!
    @IBOutlet weak var lbldate2: UILabel!
    @IBOutlet weak var lblday2: UILabel!
    @IBOutlet weak var lbldate1: UILabel!
    @IBOutlet weak var lblday1: UILabel!
    
    
    
    var slot=[String]()
    var slotset:String!
    var weekstart:String!
    var weekend:String!
    var start1:String!
    var start2:String!
    var end1:String!
    var end2:String!
    var _docid:String!
    var _avaEn2Time:String!
    var _avaEnTime:String!
    var _avaStart2Time:String!
    var _avaStartTime:String!
    var _doctorId:String!
    var _locationId:String!
    var _WeekDayStart:String!
    var _weekDayEnd:String!
    var dataref: FIRDatabaseReference!
    var formateddate=[String]()
    var date1=[Date]()
    var day=[String]()
    var m=["9:00 AM","9:20 AM,9:40 AM,10:00 AM","10:20 AM","10:40 AM","11:00 AM","11:20 AM","11:40 AM,12:00 PM,12:20 PM,12:40 PM,1:00 PM,1:20 PM,1:40 PM"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        rightclick.image=UIImage.fontAwesomeIcon(name: .check, textColor: UIColor.white, size: CGSize(width: 25, height: 25))
        daystd=["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
        self.navigationItem.backBarButtonItem?.title="< "
        self.navigationItem.title="BOOK APPOINTMENT"
        
        print(Date().dayofweek()!)
   print(formatDate(date: Date() as NSDate))
        slot.removeAll()
        
        var tenDaysfromNow: Date {
            return (Calendar.current as NSCalendar).date(byAdding: .day, value: 0, to: Date(), options: [])!
            
        }
        self.date1.append(tenDaysfromNow)
        self.day.append(date1[0].dayofweek()!)
        self.formateddate.append(formatDate(date: date1[0] as NSDate))
        
        for i in 0...5
        {
            var tenDaysfromNow: Date {
                return (Calendar.current as NSCalendar).date(byAdding: .day, value: i+1, to: Date(), options: [])!
                
            }
            self.date1.append(tenDaysfromNow)
            
            self.day.append(date1[i+1].dayofweek()!)
          
          
            self.formateddate.append(formatDate(date: date1[i+1] as NSDate))
            print(tenDaysfromNow)
        }
        
        let std:String=UserDefaults.standard.value(forKey: "Startday") as! String
        let eday:String=UserDefaults.standard.value(forKey: "Endday") as! String
        
        
        let sd=std.components(separatedBy: "d")[0]
        let ed=eday.components(separatedBy: "d")[0]
        
        
        
        let index0 = sd.index(sd.startIndex, offsetBy: 3)
        let st3:String=sd.substring(to: index0)  // Hello
        print(st3)
        
        
        let index1 = ed.index(ed.startIndex, offsetBy: 3)
        let et3:String=ed.substring(to: index1)  // Hello
        print(et3)
        
        
        
        
       // UserDefaults.standard.set(self._WeekDayStart, forKey: "Startday")
        //UserDefaults.standard.set(self._weekDayEnd, forKey: "Endday")
        
        lblholiday.isHidden=true
        print(day)
        print(formateddate)
        
        lblday1.text=day[0]
        lblday2.text=day[1]
        lblday3.text=day[2]
        lblday4.text=day[3]
        lblday5.text=day[4]
        lblday6.text=day[5]
        lblday7.text=day[6]
        
        lbldate1.textColor=UIColor.white
        lblday1.textColor=UIColor.white
        
        lbldate1.text=formateddate[0]
        lbldate2.text=formateddate[1]
         lbldate3.text=formateddate[2]
         lbldate4.text=formateddate[3]
         lbldate5.text=formateddate[4]
         lbldate6.text=formateddate[5]
         lbldate7.text=formateddate[6]
        print(self.date1)
        
        
     
        
        
               //holiday
//        if(lblday1.text=="Sun" || lblday2.text=="Sun" || lblday3.text=="Sun" || lblday4.text=="Sun" || lblday5.text=="Sun" || lblday6.text=="Sun" || lblday7.text=="Sun")
//        {
//            colltime.isHidden=true
//            
//        }
        
        
        
        let docid:String=UserDefaults.standard.value(forKey: "DocID") as! String
        
        
       // print(getDayofWeek(_today: "2017-05-31"))
       
            //UserDefaults.standard.set(DoctDetail._doctorId, forKey: "DocID")
        
       
        if(docava.count>0){
        for i in 0...docava.count-1{
            if(docava[i]._doctorId0==docid){
               
                weekstart=docava[i]._weekDayStart
                weekend=docava[i]._weekDayEnd
                start1=docava[i]._avaStartTime
                start2=docava[i]._avaStart2Time
                end1=docava[i]._avaEndTime
                
                end2=docava[i]._avaEn2time
            }
            
        }
        }
//        let cal = Calendar.current
//        var date = cal.startOfDay(for: Date())
//        var days = [Int]()
//        for i in 1 ... 7 {
//            let day = cal.component(.day, from: date)
//            days.append(day)
//            date = cal.date(byAdding: .day, value: -1, to: date)!
//        }
//        print(days)  
//        
        
        
      
//        print(formattedDaysInThisWeek())
//
        
        
        
        
        let calendar = Calendar.current
        
        let today = calendar.startOfDay(for: Date())
        let dayOfWeek = calendar.component(.weekday, from: today)
        let weekdays = calendar.range(of: .weekday, in: .weekOfYear, for: today)!
        let days1 = (weekdays.lowerBound ..< weekdays.upperBound)
            .flatMap { calendar.date(byAdding: .day, value: $0 - dayOfWeek, to: today) }
            .filter { !calendar.isDateInWeekend($0) }
        
        
        
        
        
        
       
        
        let formatter = DateFormatter()
        formatter.dateFormat = "eeee' = 'D"
        for date in days1 {
            print(formatter.string(from: date))
        }
        
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(BookAppoitmentVC.view1click))
        singleTap.numberOfTapsRequired = 1
      view1.addGestureRecognizer(singleTap)
        
        
        
        
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(BookAppoitmentVC.view2click))
        singleTap1.numberOfTapsRequired = 1
        view2.addGestureRecognizer(singleTap1)

        
        view1.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1)
        
        
        
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(BookAppoitmentVC.view3click))
        singleTap2.numberOfTapsRequired = 1
        view3.addGestureRecognizer(singleTap2)

        
        
        
        
        let singleTap3 = UITapGestureRecognizer(target: self, action: #selector(BookAppoitmentVC.view4click))
        singleTap3.numberOfTapsRequired = 1
        view4.addGestureRecognizer(singleTap3)

        
        
        
        let singleTap4 = UITapGestureRecognizer(target: self, action: #selector(BookAppoitmentVC.view5click))
        singleTap4.numberOfTapsRequired = 1
        view5.addGestureRecognizer(singleTap4)

        
        
         navigationItem.backBarButtonItem?.title="<"
        navigationController?.navigationBar.backItem?.title="<"
        
        let singleTap5 = UITapGestureRecognizer(target: self, action: #selector(BookAppoitmentVC.view6click))
        singleTap5.numberOfTapsRequired = 1
        view6.addGestureRecognizer(singleTap5)
        
        
        
        
        let singleTap6 = UITapGestureRecognizer(target: self, action: #selector(BookAppoitmentVC.view7click))
        singleTap6.numberOfTapsRequired = 1
        view7.addGestureRecognizer(singleTap6)
            
            setview(view: view1)
        setview(view: view2)
    setview(view: view3)
           setview(view: view5)
           setview(view: view6)
           setview(view: view7)
        setview(view: view4)
        
        
        print(docid)
        
         getdoctorAvalability(id: docid)
        
        print(day)
        for i in 0...daystd.count-1{
            if(daystd[i]==st3)
            {
                
                s=i
                //colltime.isHidden=true
                
            }
            if(daystd[i]==et3){
                e=i
               //colltime.isHidden=true
            }
        }
print(s)
  print(e)
        if(s<e){
        for i in s...e{
            
            if(s>6)
            {
                s=0
            }
            print(i)
            
        }
        }else if(s>e)
        {
           // var m=s-e
            for i in e+1...s-1{
               
                print(i)
                
            }
        }
        
        
        
        //default view
        if(s<e){
            for j in s...e{
                
                if(daystd[j]==lblday1.text)
                {
                    colltime.isHidden=false
                    lblholiday.isHidden=true
                    hide=false
                    
                }
                
                
            }
            
            if(hide==true)
            {
                viewcoll.isHidden=true
                lblholiday.isHidden=false
            }
            else{
                colltime.isHidden=false
                lblholiday.isHidden=true
                hide=true
            }
        }
            
        else if(s>e){
            hide=false
           // var m=s-e
            for j in e+1...s-1{
                //
                if(daystd[j]==lblday1.text)
                {
                    viewcoll.isHidden=true
                    lblholiday.isHidden=false
                    hide=true
                    
                }
            }
            
            
            
            
            if(hide==true)
            {
                viewcoll.isHidden=true
                lblholiday.isHidden=false
            }
            else{
                viewcoll.isHidden=false
                lblholiday.isHidden=true
                hide=false
            }
        }

        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backnewclick(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    @IBAction func backclick(_ sender: Any) {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
        //self.dismiss(animated: true, completion: nil)
    
    }
    func getDayofWeek(_today:String)->Int?
    {
        let format=DateFormatter()
        
      format.dateFormat="yyyy-MM-dd"
        guard let todaydate1=format.date(from: _today) else{
            return nil
        }
        
        
        let mycal=Calendar(identifier:.gregorian)
        let weekday=mycal.component(.weekday, from: todaydate1)
        return weekday
    }
    func getdoctorAvalability(id:String)    {
        let docid:String=UserDefaults.standard.value(forKey: "DocID") as! String
        

        
        dataref=FIRDatabase.database().reference()
        dataref.child("MedicalPanelData").child(id).child("doctorAvalabilities").child("0").observe(.value, with: {(Snapshot) in
            
            if let commentsDictionary = Snapshot.value  as? [String:AnyObject]{
                print(commentsDictionary)
                
                
                
                self._avaEnTime = commentsDictionary["availableEndTime"] as! String!
                print(self._avaEnTime)
                
                self._avaEn2Time=commentsDictionary["availableEn2Time"] as! String!
                
                
                
                self._avaStartTime=commentsDictionary["availableStartTime"] as! String!
                self._avaStart2Time=commentsDictionary["availableStart2Time"] as! String!
                
                
                self._locationId=commentsDictionary["locationId"] as! String!
                
                
                self._weekDayEnd=commentsDictionary["weekDayEnd"] as! String!
                
                self._WeekDayStart=commentsDictionary["weekDayStart"] as! String!
                
                
                
                self._docid=commentsDictionary["doctorId"] as! String!
                
                
                
                
                print(self._WeekDayStart)
                print(self._weekDayEnd)
                print(self._avaStartTime)
                print(self._avaStart2Time)
                
                // print(self._locationId)
                print(self._avaEnTime)
                print(self._avaEn2Time)
                
                
                self.makeslot(start1:self._avaStartTime,end1:self._avaEnTime)
                
                self.makeslot(start1: self._avaStart2Time, end1: self._avaEn2Time)
                
                
                
                
              
                
                self.colltime.dataSource=self
                self.colltime.delegate=self
                self.colltime.reloadData()
                

                
                for i in 0...self.day.count-1{
                    var count:Int!
                  if(self._WeekDayStart==self.day[i])
                  {
                   // count=i
                    
                    }
                 else   if(self._weekDayEnd==self.day[i])
                    {
                        count=i
                        print(count)
                        print(self.day[i])
                    }
                    
                    
                    
                    
                }
                
               


            } else {
                
                //no comments to append the arrays
                
            }
            
            
            
            //self.docava.append(doctorAvalabilities(_avaEn2Time: self._avaEn2Time, _avaEndTime: self._avaEnTime, _avaStart2Time: self._avaStart2Time, _avaStartTime: self._avaStartTime, _doctorId: self._docid, _locationId: "", _weekDayEnd: self._weekDayEnd, _weekDayStart: self._WeekDayStart))
            //print(self.docava.count)
            
            if(self.docava.count>0){
                for i in 0...self.docava.count-1{
                    if(self.docava[i]._doctorId0==docid){
                        
                        self.weekstart=self.docava[i]._weekDayStart
                        self.weekend=self.docava[i]._weekDayEnd
                        self.start1=self.docava[i]._avaStartTime
                        self.start2=self.docava[i]._avaStart2Time
                        self.end1=self.docava[i]._avaEndTime
                        
                        self.end2=self.docava[i]._avaEn2time
                    }
                    
                }
                print(self.weekend)
                print(self.weekstart)
            }

            
        })
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.leftBarButtonItem?.title="< "
                self.navigationItem.title="BOOK APPOINTMENT"
        navigationItem.backBarButtonItem?.title="< "
    }
    func makeslot(start1:String,end1:String)
    {
        
        let s1=start1
        let e1=end1
        var h:String!
        var m:String!
        var t1:String!
        
        print(s1)
        let stime=s1.components(separatedBy: " ")[1]
        let sh1=s1.components(separatedBy: " ")[0].components(separatedBy: ":")[0]
       let sm1=s1.components(separatedBy: " ")[0].components(separatedBy: ":")[1]
        
        print(sm1)
        
        var sh1Int:Int=Int(sh1)!
        var sm1Int:Int=Int(sm1)!
        
        print(sm1Int)
        
        
        
        let etime=e1.components(separatedBy: " ")[1]
        
        
        let eh1=e1.components(separatedBy: " ")[0].components(separatedBy: ":")[0]
        let em1=e1.components(separatedBy: " ")[0].components(separatedBy: ":")[1]
        
        print(em1)
        
        var eh1Int:Int=Int(eh1)!
        let em1Int:Int=Int(em1)!
        
        print(em1Int)
        
        h=String(sh1Int)
        m=String(sm1Int)
        if(sm1Int==0)
        {
            m="00"
        }
        
        
        t1=h+":"+m+" "+stime
        slot.append(t1)
        
        
        
         //slot.append(s1)
        if(stime=="PM" && sh1Int<12)
        {
            sh1Int=sh1Int+12

        }
        
        
        if(etime=="PM" && eh1Int<12)
        {
            eh1Int=eh1Int+12
        }
        
        
        
      let hrdiff1=eh1Int-sh1Int
        
        
        if(hrdiff1>1){
        for _ in 0...hrdiff1*3-1{
            var p="AM"
           // let incre=sm1Int+20
            if(sm1Int==60)
            {
                sh1Int=sh1Int+1
                sm1Int=00
                h=String(sh1Int)
                m=String(sm1Int)
                
                if(sh1Int>=12 && stime=="AM")
                {
                    p="PM"
                }
                
                if(stime=="PM" && etime=="PM")
                {
                    p="PM"
                }
                 t1=h+":"+m+" "+p
                //slot.append(t1)
            }
            else{
                
               
                sm1Int=sm1Int+20
                  h=String(sh1Int)
                 m=String(sm1Int)
                
                
                if(sh1Int>=12 && stime=="AM")
                {
                    p="PM"
                }
                else if(sh1Int>=12 && stime=="PM")
                {
                    p="PM"
                }
                
                else if(sh1Int<12 && stime=="PM")
                {
                    p="PM"
                }
                if(sm1Int==60)
                {
                    sh1Int=sh1Int+1
                    sm1Int=00
                  
                     m="00"
                    
                    if(sh1Int>=12 && stime=="AM")
                    {
                        p="PM"
                    }
                    if(sh1Int>12){
                        sh1Int=sh1Int-12
                    }
                    
                    if(stime=="PM" && etime=="PM")
                    {
                        p="PM"
                    }
                    h=String(sh1Int)
                    t1=h+":"+m+" "+p
                    slot.append(t1)
                }
                else{
                    
                    
                    if(sh1Int>12){
                        sh1Int=sh1Int-12
                        
                    }
                    if(stime=="PM" && etime=="PM")
                    {
                        p="PM"
                    }
                    
                     h=String(sh1Int)
                   t1=h+":"+m+" "+p
                    slot.append(t1)

                }
                
                            }
            if(sh1Int==eh1Int ){
                
            }
            
        }
            print(slot)
        }
        else if(hrdiff1==1)
        {
            
        }
      

        
        
        
    
        
        
        
    }
    func formattedDaysInThisWeek() -> [String] {
        // create calendar
        let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        
        // today's date
        let today = NSDate()
        let todayComponent = calendar.components([.day, .month, .year], from: today as Date)
        
        // range of dates in this week
        let thisWeekDateRange = calendar.range(of: .day, in:.weekOfMonth, for:today as Date)
        
        // date interval from today to beginning of week
        let dayInterval = thisWeekDateRange.location - todayComponent.day!
        
        // date for beginning day of this week, ie. this week's Sunday's date
        let beginningOfWeek = calendar.date(byAdding: .day, value: dayInterval, to: today as Date, options: .matchNextTime)
        
        var formattedDays: [String] = []
        
        for i in 0 ..< thisWeekDateRange.length {
            let date = calendar.date(byAdding: .day, value: i, to: beginningOfWeek!, options: .matchNextTime)!
            formattedDays.append(formatDate(date: date as NSDate))
        }
        
        return formattedDays
    }
    
    func formatDate(date: NSDate) -> String {
        let format = "dd MMM"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date as Date)
    }

    func view1click()
    {
        if(singletab==false)
        {
            lblday1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            view1.backgroundColor=UIColor.white
            singletab=true
        }
        else{
            
            lblday1.textColor=UIColor.white
            lbldate1.textColor=UIColor.white
            view1.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1)
            view2.backgroundColor=UIColor.white
            view3.backgroundColor=UIColor.white
            view4.backgroundColor=UIColor.white
            view5.backgroundColor=UIColor.white
                view6.backgroundColor=UIColor.white
       view7.backgroundColor=UIColor.white
            
            
            
            lblday2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            lblday7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
//singletab=false
        }
        
//        if(lblday1.text=="Sun")
//        {
//            viewcoll.isHidden=true
//            lblholiday.isHidden=false
//        }
//        else{
//            viewcoll.isHidden=false
//            lblholiday.isHidden=true
//        }
        
        
        
        
        
        
       
//            if(day[i]==std)
//            {
//                colltime.isHidden=true
//                lblholiday.isHidden=false
//                
//            }
//            if(day[i]==eday){
//                colltime.isHidden=true
//                lblholiday.isHidden=false
//            }
            
            print(s)
            print(e)
        if(s<e)
        {            for j in s...e{
                
                if(daystd[j]==lblday1.text)
                {
                    colltime.isHidden=false
                    lblholiday.isHidden=true
                    hide=false

                }
        }
        
//                else{
//                    colltime.isHidden=false
//                    lblholiday.isHidden=true
//                    
//                }
                if(hide==true)
                {
                    viewcoll.isHidden=true
                    lblholiday.isHidden=false
                }
                else{
                    viewcoll.isHidden=false
                    lblholiday.isHidden=true
                      hide=true
                }
                
      
        }
        else if(s>e){
           // var m=s-e
            hide=false
            for j in e+1...s-1{
                //hide=false
                if(daystd[j]==lblday1.text)
                {
                    viewcoll.isHidden=true
                    lblholiday.isHidden=false
                    hide=true
                    
                }
            }
            
            
            
            
            if(hide==true)
            {
                viewcoll.isHidden=true
                lblholiday.isHidden=false
            }
            else{
                viewcoll.isHidden=false
                lblholiday.isHidden=true
                hide=false
            }
        }
        
    }
    func view2click()
    {
        if(singletab==false)
        {
           
            lblday2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
           lbldate2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            view2.backgroundColor=UIColor.white
            singletab=true
        }
        else {
            lblday2.textColor=UIColor.white
            lbldate2.textColor=UIColor.white
            view2.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1)
            view1.backgroundColor=UIColor.white
            view3.backgroundColor=UIColor.white
            view4.backgroundColor=UIColor.white
            view5.backgroundColor=UIColor.white
            view6.backgroundColor=UIColor.white
            view7.backgroundColor=UIColor.white
            
            
            
            
            
            lblday1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            lblday7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            

          // singletab=false
        }
//        if(lblday2.text=="Sun")
//        {
//            viewcoll.isHidden=true
//            lblholiday.isHidden=false
//
//            
//        }
//        else{
//            viewcoll.isHidden=false
//            lblholiday.isHidden=true
//        }
        
        if(s<e){
        for j in s...e{
            
            if(daystd[j]==lblday2.text)
            {
                colltime.isHidden=false
                lblholiday.isHidden=true
                hide=false
                
            }
            
            
        }
        
        if(hide==true)
        {
            viewcoll.isHidden=true
            lblholiday.isHidden=false
        }
        else{
            viewcoll.isHidden=false
            lblholiday.isHidden=true
              hide=true
        }
        }
        
        else if(s>e){
            hide=false
          //  var m=s-e
            for j in e+1...s-1{
                //
                if(daystd[j]==lblday2.text)
                {
                    viewcoll.isHidden=true
                    lblholiday.isHidden=false
                    hide=true
                    
                }
            }
            
            
            
            
            if(hide==true)
            {
                viewcoll.isHidden=true
                lblholiday.isHidden=false
            }
            else{
                viewcoll.isHidden=false
                lblholiday.isHidden=true
                hide=false
            }
        }

        
    }
    
    func view3click()
    {
        if(singletab==false)
        {
                        lblday3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            view3.backgroundColor=UIColor.white
            singletab=true
        }
        else{
            lblday3.textColor=UIColor.white
            lbldate3.textColor=UIColor.white

            view3.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1)
            view1.backgroundColor=UIColor.white
            view2.backgroundColor=UIColor.white
            view4.backgroundColor=UIColor.white
            view5.backgroundColor=UIColor.white
            view6.backgroundColor=UIColor.white
         view7.backgroundColor=UIColor.white
            
            lblday2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            lblday7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            

           // singletab=false
        }
//        if(lblday3.text=="Sun")
//        {
//            viewcoll.isHidden=true
//            lblholiday.isHidden=false
//
//            
//        }
//        else{
//            viewcoll.isHidden=false
//            lblholiday.isHidden=true
//              hide=true
//        }
        
        if(s<e){
        
        for j in s...e{
            
            if(daystd[j]==lblday3.text)
            {
                colltime.isHidden=false
                lblholiday.isHidden=true
                hide=false
                
            }
            }
            
        
        if(hide==true)
        {
            viewcoll.isHidden=true
            lblholiday.isHidden=false
        }
        else{
            viewcoll.isHidden=false
            lblholiday.isHidden=true
            hide=true
        }
        } else if(s>e){
            hide=false
        //    var m=s-e
            for j in e+1...s-1{
                //hide=false
                if(daystd[j]==lblday3.text)
                {
                    viewcoll.isHidden=true
                    lblholiday.isHidden=false
                    hide=true
                    
                }
            }
            
            
            
            
            if(hide==true)
            {
                viewcoll.isHidden=true
                lblholiday.isHidden=false
               
            }
            else{
                viewcoll.isHidden=false
                lblholiday.isHidden=true
                hide=false
            }
        }

        
        
    }
    func view4click()
    {
        if(singletab==false)
        {
            lblday4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            view4.backgroundColor=UIColor.white
            singletab=true
        }
        else{
            lblday4.textColor=UIColor.white
            lbldate4.textColor=UIColor.white
            view4.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1)
            view1.backgroundColor=UIColor.white
            view2.backgroundColor=UIColor.white
            view3.backgroundColor=UIColor.white
            view5.backgroundColor=UIColor.white
            view6.backgroundColor=UIColor.white
          view7.backgroundColor=UIColor.white
            lblday2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            lblday7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            

            //singletab=false
        }
//        if(lblday4.text=="Sun")
//        {
//            viewcoll.isHidden=true
//            lblholiday.isHidden=false
//            
//        }
//        else{
//            viewcoll.isHidden=false
//            lblholiday.isHidden=true
//        }
        
        
        

    
    if(s<e)
    {
    
        for j in s...e{
    
            if(daystd[j]==lblday4.text)
            {
    colltime.isHidden=false
    lblholiday.isHidden=true
    hide=false

    
            }
        }
    
            
            
        
    if(hide==true)
    {
    viewcoll.isHidden=true
    lblholiday.isHidden=false
    }
    else{
        
    viewcoll.isHidden=false
    lblholiday.isHidden=true
          hide=true
    }
        }
    else if(s>e){
        hide=false
       // var m=s-e
        for j in e+1...s-1{
            //hide=false
            if(daystd[j]==lblday4.text)
            {
                viewcoll.isHidden=true
                lblholiday.isHidden=false
                hide=true
                
            }
        }
        
        
        
        
        if(hide==true)
        {
            viewcoll.isHidden=true
            lblholiday.isHidden=false
            
        }
        else{
             viewcoll.isHidden=false
            lblholiday.isHidden=true
            hide=false
        }
        }
        

    }
    
    
    
    func view5click()
    {
        if(singletab==false)
        {
            lblday5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            view5.backgroundColor=UIColor.white
            singletab=true
        }
        else{
            lblday5.textColor=UIColor.white
            lbldate5.textColor=UIColor.white
            view5.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1)
            view1.backgroundColor=UIColor.white
            view3.backgroundColor=UIColor.white
            view4.backgroundColor=UIColor.white
            view2.backgroundColor=UIColor.white
            view6.backgroundColor=UIColor.white
           view7.backgroundColor=UIColor.white
            lblday2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            lblday7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            

           // singletab=false
        }
       
        
        
        if(s<e)
        {
        for j in s...e{
            
            if(daystd[j]==lblday5.text)
            {
                colltime.isHidden=false
                lblholiday.isHidden=true
                hide=false

                
            }
           
            }
            
        
        if(hide==true)
        {
            viewcoll.isHidden=true
            lblholiday.isHidden=false
        }
        else{
            
             viewcoll.isHidden=false
            lblholiday.isHidden=true
            hide=true
        }
        }
        else if(s>e){
            hide=false
        //    var m=s-e
            for j in e+1...s-1{
                //hide=false
                if(daystd[j]==lblday5.text)
                {
                    viewcoll.isHidden=true
                    lblholiday.isHidden=false
                    hide=true
                    
                }
            }
            
            
            
            
            if(hide==true)
            {
                viewcoll.isHidden=true
                lblholiday.isHidden=false
                
            }
            else{
                viewcoll.isHidden=false
                lblholiday.isHidden=true
                hide=false
            }
        }
    }
    func view6click()
    {
        if(singletab==false)
        {
            lblday6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            view6.backgroundColor=UIColor.white
            singletab=true
        }
        else{
            lblday6.textColor=UIColor.white
            lbldate6.textColor=UIColor.white
            view6.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1)
            view1.backgroundColor=UIColor.white
            view3.backgroundColor=UIColor.white
            view4.backgroundColor=UIColor.white
            view5.backgroundColor=UIColor.white
            view2.backgroundColor=UIColor.white
          view7.backgroundColor=UIColor.white
            
            lblday2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            lblday7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            

            
            //singletab=false
        }
//        if(lblday6.text=="Sun")
//        {
//            viewcoll.isHidden=true
//            lblholiday.isHidden=false
//        }
//        else{
//            viewcoll.isHidden=false
//            lblholiday.isHidden=true
//        }
        if(s<e){
        for j in s...e{
            
            if(daystd[j] == lblday6.text)
            {
                colltime.isHidden=false
                lblholiday.isHidden=true
                hide=false

                
            }
            
            
            
        }
        
        if(hide==true)
        {
            viewcoll.isHidden=true
            lblholiday.isHidden=false
        }
        else{
            
            viewcoll.isHidden=false
            lblholiday.isHidden=true
            hide=true
        }
        } else if(s>e){
          //  var m=s-e
            hide=false
            for j in e+1...s-1{
                //hide=false
                if(daystd[j]==lblday6.text)
                {
                    viewcoll.isHidden=true
                    lblholiday.isHidden=false
                    hide=true
                    
                }
            }
            
            
            
            
            if(hide==true)
            {
                viewcoll.isHidden=true
                lblholiday.isHidden=false
                
            }
            else{
                 viewcoll.isHidden=false
                lblholiday.isHidden=true
                hide=false
            }
        }
    }
    func view7click()
    {
        if(singletab==false)
        {
            lblday7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate7.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
           view7.backgroundColor=UIColor.white
            singletab=true
        }
        else{
            lblday7.textColor=UIColor.white
            lbldate7.textColor=UIColor.white
            view7.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1)
            view1.backgroundColor=UIColor.white
            view3.backgroundColor=UIColor.white
            view4.backgroundColor=UIColor.white
            view5.backgroundColor=UIColor.white
            view6.backgroundColor=UIColor.white
            view2.backgroundColor=UIColor.white
            
            
            lblday2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate2.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate3.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            lblday4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate4.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate5.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            
            
            lblday6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate6.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            
            lblday1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            lbldate1.textColor=UIColor(red:76/255, green: 76/255, blue: 76/255, alpha: 1)
            

            //singletab=false
        }
//        if(lblday7.text=="Sun")
//        {
//            viewcoll.isHidden=true
//            lblholiday.isHidden=false
//            
//        }
//        else{
//            viewcoll.isHidden=false
//            lblholiday.isHidden=true
//        }
        
        if(s<e){
        for j in s...e{
            
            if(daystd[j] == lblday7.text)
            {
                viewcoll.isHidden=false
                lblholiday.isHidden=true
                hide=false
            }
           
            
            
        }
        
        if(hide==true)
        {
            viewcoll.isHidden=true
            lblholiday.isHidden=false
        }
        else{
            
           viewcoll.isHidden=false
            lblholiday.isHidden=true
            hide=true
        }
        }
        else if(s>e){
          //  var m=s-e
            hide=false
            for j in e+1...s-1{
               // hide=false
                if(daystd[j]==lblday7.text)
                {
                    viewcoll.isHidden=true
                    lblholiday.isHidden=false
                    hide=true
                    
                }
            }
            
            
            
            
            if(hide==true)
            {
                viewcoll.isHidden=true
                lblholiday.isHidden=false
                
            }
            else{
              viewcoll.isHidden=false
                lblholiday.isHidden=true
                //hide=false
            }
        }
    }
    func setview(view:UIView)
    {
        view.layer.cornerRadius=5
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //delegation functions
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slot.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "timecellCollectionViewCell", for: indexPath as IndexPath) as? timecellCollectionViewCell {
            
            //let m = menu[indexPath.row]
            
      
         // cell.btntime.setTitle(time, for: UIControlState.normal)
            cell.lbltime1.text=slot[indexPath.row]
            return cell
        }
        return UICollectionViewCell()

    }
    func cellchange()
    {
        colltime.dataSource=self
        colltime.delegate=self
        colltime.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
        
      //  addToList.append(objectsArray[indexPath.row])
        let cell = collectionView.cellForItem(at: indexPath) as? timecellCollectionViewCell
        
        let p=slot[indexPath.row]
    
 print(p)
        slotset=p
        cell?.layer.cornerRadius=5
        cell?.lbltime1.textColor=UIColor.white
    // cell?.btntime.titleLabel?.textColor=UIColor.white
        cell?.layer.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1).cgColor
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? timecellCollectionViewCell
        
        
        
        cell?.layer.cornerRadius=5
        cell?.lbltime1.textColor=UIColor.darkGray
      
        
        cell?.layer.backgroundColor=UIColor.clear.cgColor
    }
  
    
  
    @IBAction func bookrightclick(_ sender: Any) {
        
        
        
        
        
        dataref=FIRDatabase.database().reference()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-mm-dd"
        let d1:String=dateformatter.string(from: Date())
        
        let yr1:String=d1.components(separatedBy: "-")[0]
        
        let yr:String=" "+yr1
        var d:String!
        var slot:String!
        let docid:String=UserDefaults.standard.value(forKey: "DocID") as! String
        
        let uid:String=UserDefaults.standard.value(forKey: "KEY") as! String
        
        
        if(view1.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            
            d=lbldate1.text!+yr
            
            
        }
        else if(view2.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate2.text!+yr
        }
        else if(view3.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate3.text!+yr
        }
        else if(view4.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate4.text!+yr
        }
        else if(view5.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate5.text!+yr
        }
        else if(view6.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate6.text!+yr
        }
            
            
        else if(view7.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate7.text!+yr
        }
        
        
        print(d)
        
        
        
        
        
        if(slotset == nil){
            let passwordcheck = UIAlertController(title: "Appointment", message: "Please Select Time slot ", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            present(passwordcheck, animated: true, completion: {  })
            
            
        }
        else{
            print(slotset!)
            slot=slotset
            let doctorapp:[String:AnyObject]=["date":d as AnyObject ,"doctorId":docid as AnyObject ,"slot":slot as AnyObject  ,"userId":uid as AnyObject  ]
            
            
            dataref.child("DoctorAppintments").childByAutoId().setValue(doctorapp)
            
            
            
            let passwordcheck = UIAlertController(title: "Appointment", message: "Your Appointment Booked Successfully.You will received confirmation message on your registere mobile number shortly ", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            present(passwordcheck, animated: true, completion: {  })
            
        }
        
        
        

    }
    @IBAction func bookclick(_ sender: Any) {
        
        
         dataref=FIRDatabase.database().reference()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-mm-dd"
        let d1:String=dateformatter.string(from: Date())
        
        let yr1:String=d1.components(separatedBy: "-")[0]
        
        let yr:String=" "+yr1
        var d:String!
        var slot:String!
    let docid:String=UserDefaults.standard.value(forKey: "DocID") as! String
        
        let uid:String=UserDefaults.standard.value(forKey: "KEY") as! String
       
        
        if(view1.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            
            d=lbldate1.text!+yr
            
            
        }
        else if(view2.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate2.text!+yr
        }
        else if(view3.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate3.text!+yr
        }
        else if(view4.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
        d=lbldate4.text!+yr
        }
        else if(view5.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate5.text!+yr
        }
        else if(view6.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate6.text!+yr
        }


        else if(view7.backgroundColor==UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1))
        {
            d=lbldate7.text!+yr
        }


        print(d)
      
        
        
        
        
        if(slotset == nil){
            let passwordcheck = UIAlertController(title: "Appointment", message: "Please Select any one slot ", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            present(passwordcheck, animated: true, completion: {  })
            

        }
        else{
            print(slotset!)
            slot=slotset
            let doctorapp:[String:AnyObject]=["date":d as AnyObject ,"doctorId":docid as AnyObject ,"slot":slot as AnyObject  ,"userId":uid as AnyObject  ]
            
            
            dataref.child("DoctorAppintments").childByAutoId().setValue(doctorapp)
            
            
            
            let passwordcheck = UIAlertController(title: "Appointment", message: "Your Appointment Booked Successfully.You will received confirmation message on your registere mobile number shortly ", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            present(passwordcheck, animated: true, completion: {  })
            
        }
    
        
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        if let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "timecellCollectionViewCell", for: indexPath as IndexPath) as? timecellCollectionViewCell{
            
            cell.layer.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1).cgColor
            print("cell select")
            
            
            cell.lbltime1.layer.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1).cgColor
            cell.contentView.backgroundColor=UIColor(red: 83/255, green: 117/255, blue: 1/255, alpha: 1)

            
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
extension Date{
    func dayofweek()->String?{
        let dateformat1=DateFormatter()
        dateformat1.dateFormat="EEE"
        
        return dateformat1.string(from: self).capitalized
    }
}
