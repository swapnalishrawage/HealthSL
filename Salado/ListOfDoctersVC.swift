//
//  ListOfDoctersVC.swift
//  Salado
//
//  Created by Rz on 18/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase
import ObjectMapper

class ListOfDoctersVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
 var dataref: FIRDatabaseReference!
   var postsCommentsDict : NSMutableDictionary = NSMutableDictionary()
    var _docfees:String!
    var _docdes:String!
    var _docdetaildes:String!
    var _exper:String!
    var _docid:String!
    var _docname:String!
    var _docthumb:String!
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
    

    var  _doctype:String!
    //doc ava
    var _avaEn2Time:String!
     var _avaEnTime:String!
     var _avaStart2Time:String!
     var _avaStartTime:String!
     var _doctorId:String!
    var _locationId:String!
    var _WeekDayStart:String!
    var _weekDayEnd:String!
    
    
    //doctorholidays
    
    private var _did:String!
    private var _holidayEndDate:String!
    private var _holidayStartDate:String!

    
    //doclocation
    
    private var _address:String!
    private var _city:String!
    private var _clinicname:String!
    private var _doctorid1:String!
    private var _location:String!
    private var _locationId1:String!
    private var _locationName:String!



    
    
    var medicalpaneldata=[MedicalPanelData]()
    
    
    var medicalpanel=[MedicalPanel]()
    @IBOutlet weak var tbdocterlist: UITableView!

    
    var docter=[Docterdetail]()
    var docava=[doctorAvalabilities]()
    var doclocation=[doctorLocations]()
    
    var docholidays=[doctorHolidays]()
    
//    private var   _docdetail:Docterdetail!
//        var  DoctDetail : Docterdetail{
//            get {
//                return _docdetail
//    
//            }
//            set
//            {
//                _docdetail = newValue
//            }
//        }
    @IBAction func backclick(_ sender: Any) {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "MonthlydietClickVC") as! MonthlydietClickVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
        

        
           }
    override func viewDidLoad() {
        super.viewDidLoad()
        let type:String=UserDefaults.standard.value(forKey: "TYPE") as! String
        navigationItem.backBarButtonItem?.title="< "
        if(type=="A"){
            self.navigationItem.title="AYURVEDACHARYA"
        }
        else if(type=="D")
        {
            self.navigationItem.title="DIETITIAN"
        }
       
        
        
        //retrivedetitiandata()
              tbdocterlist.separatorColor=UIColor.clear
  tbdocterlist.tableFooterView=UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        retrivedetitiandata()
    }
    
    //Tableview delegation functions
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicalpanel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "docterlistcell",for:indexPath) as? docterlistcell
        {
            
            //var doct=medicalpaneldata[indexPath.row]
            let  doct=medicalpanel[indexPath.row]
            
          
            
          // let type:String=UserDefaults.standard.value(forKey: "TYPE") as! String
            

            
            var city:String!
            var weekstart:String!
            var weekend:String!
            var start:String!
            var end:String!
            var time1:String!
            var start1:String!
            var end1:String!
            if(self.doclocation.count>0)
            {
            for i in 0...self.doclocation.count-1
            {
                
                if(doclocation[i]._doctorId==doct._doctorId){
                    
                   city=doclocation[i]._locationName
                    
                    UserDefaults.standard.set(doclocation[i]._address, forKey: "Address")
                    UserDefaults.standard.set(doclocation[i]._clinicName, forKey: "Clinicname")
                   break
                }
                
                
                
            }
            }
            else{
                city="Pune"
            }
            
            
            
            if(self.docava.count>0){
            for j in 0...self.docava.count-1
            {
                
                print(docava[j]._doctorId0)
                if(docava[j]._doctorId0==doct._doctorId){
                    
                  weekstart=docava[j]._weekDayStart
                    weekend=docava[j]._weekDayEnd
                  start=docava[j]._avaStartTime
                    end=docava[j]._avaEndTime
                    
                    
                    start1=docava[j]._avaStart2Time
                    end1=docava[j]._avaEn2time
                    time1=weekstart+" To "+weekend+":"+start+"-"+end+" "+start1+"-"+end1
                   UserDefaults.standard.set(time1, forKey: "Time")
                    
                   break
                    
                                    }
            }
            }
            else{
                time1="Mon To Sat:9:00 AM-5:00 PM"
            }
            
            
            
            print(doct._doctorName)
            print(doct._doctorExperience)
            print(doct._doctorDescription)
            print(doct._doctorConsultationFess)
            print(doct._doctorDetailDescrption)
            print(doct._doctorThumbnail)
            print(doct._doctype)
            
          
            
            if(city==nil)
            {
                city="Mumbai"
            }
            if(time1==nil){
                time1="Mon To Fri:10:00 AM-5:00 PM"
            }
            
            
            
            print(docava)
            
            cell.cellcontains(name: doct._doctorName, place: city, price: doct._doctorConsultationFess, time: time1, Clinik:doct._doctorDescription, image: doct._doctorThumbnail, doctype: doct._doctype)
                

//            }
//               else if(doct.doctype=="Dietitian" && type=="D"){
//                cell.cellcontains(name: doct.doctorName, place: doct.doctorExperience, price: doct.doctorConsultationFess, time: doct.doctorDetailDescrption, Clinik: doct.doctorDescription, image: "",doctype:doct.doctype)
//            }
            
            
        return cell
            
        }
        
        return UITableViewCell()
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       let  doct=medicalpanel[indexPath.row]
        
        
        
        performSegue(withIdentifier: "squedetail", sender: doct)
    }
   //Retrive docterdata
    
    func retrivedetitiandata()
    {
        let type:String=UserDefaults.standard.value(forKey: "TYPE") as! String

        print(type)
        medicalpanel.removeAll()
       
        dataref=FIRDatabase.database().reference()
       
        
  
        
   
        
        
        
        
        
        
        
        
        
        
        
        
        ///////
        dataref.child("MedicalPanelData").observeSingleEvent(of: .value, with: { (snapshot) in
            
            print(snapshot)
            
            
            
            
          
          
            if(snapshot.childrenCount==0)
            {
                //self.tbdocterlist.isHidden=true
               
            }
            else{
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                  
                    
                    
                    for child in snapDict{
                      let ID = child.key 
                      // let shotKey = snapshot.children.nextObject() as! NSObject
                        
                    
                      
                       // var ref=FIRDatabase.database().reference().child("MedicalPanelData").child(ID).child("0")
                        
                
                        
                        
                     // self.getdoctorAvalability(ID: ID)
                        
                 self.getholiday(id: ID)
                        
                self.getdoctorlocation(ID: ID)
                
                        
                    
                        
                        
                        
                        
                        if let  docttype=child.value as? [String:AnyObject]{
                            self._doctype=docttype["doctorType"] as! String!
                            
                            
                           if(type=="A")
                            {
                               
                                self.navigationItem.title="AYURVEDACHARYA"
                                if(self._doctype=="Ayurvedic"){
                                    
                                    
                                    
                                    
                                    if let medicalpanel = child.value as? [String:AnyObject]{
                                        
                                        
                                        
                                        if let value1 = medicalpanel["medicalPanel"] as? [String:AnyObject]{
                                            
                                            print(value1)
                                            
                                            
                                            self._docfees = value1["doctorConsultationFess"] as! String!
                                            
                                            self._docdes=value1["doctorDescription"] as! String!
                                            
                                            self._docdetaildes = value1["doctorDetailDescrption"] as! String!
                                            
                                            
                                            self._exper = value1["doctorExperience"] as! String!
                                            
                                            self._docid = value1["doctorId"] as! String!
                                            
                                            self._docname = value1["doctorName"] as! String!
                                            self._docthumb = value1["doctorThumbnail"] as! String!
                                            
                                        }
                                        print(self._doctype)
                                        print(self._docfees)
                                        print(self._docdes)
                                        print(self._docdetaildes)
                                        print(self._exper )
                                        print( self._docid)
                                        print(self._docname)
                                        print(self._docthumb)
                                   
                                        
                                        let mp0=MedicalPanel(_doctorConsultationFess: self._docfees, _doctorDescription: self._docdes, _doctorDetailDescrption: self._docdetaildes, _doctorExperience: self._exper, _doctorId: self._docid, _doctorName: self._docname, _doctorThumbnail: self._docthumb,_doctype:self._doctype,_Childkey:ID)
                                        
                                        self.medicalpanel.append(mp0)
                                        
                                        
                                        
                                    }
                                }
                                
                                
                                
                                
                            }
                            else if(type=="D")
                            {
                                self.navigationItem.title="DIETITIAN"
                                if(self._doctype=="Dietitian")
                                {
                                    if let medicalpanel = child.value as? [String:AnyObject]{
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        if let value1 = medicalpanel["medicalPanel"] as? [String:AnyObject]{
                                            
                                            
                                            
                                            
                                            self._docfees = value1["doctorConsultationFess"] as! String!
                                            
                                            self._docdes=value1["doctorDescription"] as! String!
                                            
                                            self._docdetaildes = value1["doctorDetailDescrption"] as! String!
                                            
                                            
                                            self._exper = value1["doctorExperience"] as! String!
                                            
                                            self._docid = value1["doctorId"] as! String!
                                            
                                            self._docname = value1["doctorName"] as! String!
                                            self._docthumb = value1["doctorThumbnail"] as! String!
                                            
                                        }
                                        print(self._doctype)
                                        print(self._docfees)
                                        print(self._docdes)
                                        print(self._docdetaildes)
                                        print(self._exper )
                                        print( self._docid)
                                        print(self._docname)
                                        print(self._docthumb)
                                        
                                        let mp0=MedicalPanel(_doctorConsultationFess: self._docfees, _doctorDescription: self._docdes, _doctorDetailDescrption: self._docdetaildes, _doctorExperience: self._exper, _doctorId: self._docid, _doctorName: self._docname, _doctorThumbnail: self._docthumb,_doctype:self._doctype,_Childkey:ID)
                                        
                                        self.medicalpanel.append(mp0)
                                        
                                        
                                        
                                    }
                                }
                            }
                        
                       
                        
                        
                        
                        }
                        
//                        ref.observe(.value, with: {(Snapshot) in
//                            //
//                            if let commentsDictionary = Snapshot.value  as? [String:AnyObject]{
//                                print(commentsDictionary)
//                                
//                                
//                                
//                                self._avaEnTime = commentsDictionary["availableEndTime"] as! String!
//                                print(self._avaEnTime)
//                                
//                                self._avaEn2Time=commentsDictionary["availableEn2Time"] as! String!
//                                
//                                
//                                
//                                self._avaStartTime=commentsDictionary["availableStartTime"] as! String!
//                                self._avaStart2Time=commentsDictionary["availableStart2Time"] as! String!
//                                
//                                
//                                self._locationId=commentsDictionary["locationId"] as! String!
//                                
//                                
//                                self._weekDayEnd=commentsDictionary["weekDayEnd"] as! String!
//                                
//                                self._WeekDayStart=commentsDictionary["weekDayStart"] as! String!
//                                
//                                
//                                
//                                
//                                print(self._locationId)
//                                print(self._WeekDayStart)
//                                print(self._weekDayEnd)
//                                print(self._avaStartTime)
//                                print(self._avaStart2Time)
//                                
//                                print(self._locationId)
//                                print(self._avaEnTime)
//                                print(self._avaEn2Time)
//                                
//                                self.docava.append(doctorAvalabilities(_avaEn2Time: self._avaEn2Time, _avaEndTime: self._avaEnTime, _avaStart2Time: self._avaStart2Time, _avaStartTime: self._avaStartTime, _doctorId0:  self._docid, _locationId: self._locationId, _weekDayEnd: self._weekDayEnd, _weekDayStart: self._WeekDayStart))
//                            } else {
//                                
//                                //no comments to append the arrays
//                                
//                            }
//                            
//                            
//                           
//                            
//                            
//                        })
//                        
//                        
                   
                   
                       self.tbdocterlist.dataSource=self
                        self.tbdocterlist.delegate=self
                        self.tbdocterlist.reloadData()
                        
//print
                       // append
                        
                        
                        
                        
                        
                        
                        
                        
                            
                        }
                        
                        
                
                        
              

                
                    
                    
                }
              
            }
          
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        self.tbdocterlist.dataSource=self
        self.tbdocterlist.delegate=self
        self.tbdocterlist.reloadData()

        
        
    }
    func getdoctorlocation(ID:String)
    {
        
      
        doclocation.removeAll()
        
         dataref=FIRDatabase.database().reference()
        self.dataref.database.reference().child("MedicalPanelData").child(ID).child("doctorLocations").child("0").observe(.value, with: {(Snapshot) in
            
            
//            let shotKey = Snapshot.children.nextObject() as! NSObject
//            
//            
//            
//            if let value1 = shotKey as? [String:AnyObject]{
//                print(value1)
//                
            
            if let value1 = Snapshot.value  as? [String:AnyObject]{
                print(value1)
                
                

                
                
                self._address=value1["address"] as? Any as! String!
                self._city=value1["city"] as! String!
                
                self._clinicname=value1["clinicName"] as! String!
                
                self._location=value1["location"] as! String!
                
                self._locationId1=value1["locationid"] as! String!
                
                self._locationName=value1["locationName"] as! String!
                
                
                self._doctorid1=value1["doctorId"] as! String!
                
                
                
                
            }
            print(self._address)
            print(self._city)
            print(self._clinicname)
            
            print(self._location)
            print(self._locationId1)
            print( self._locationName)
            print(self._doctorid1)
            self.doclocation.append(doctorLocations(_address: self._address, _city: self._city, _clinicname: self._clinicname, _doctorid: self._doctorid1, _location: self._location, _locationName: self._locationName, _locationId: self._locationId1))
            
            
            
            self.tbdocterlist.dataSource=self
            self.tbdocterlist.delegate=self
            self.tbdocterlist.reloadData()
            
            
        })
        
        
       getdoctorAvalability(ID:ID)
        
        
        
        
        ////////
        
        
        
        
       
        
    }
    
    
    func getholiday(id:String)
    {
        
        docholidays.removeAll()
        
        dataref=FIRDatabase.database().reference()
        self.dataref.database.reference().child("MedicalPanelData").child(id).child("doctorHolidays").child("0").observe(.value, with: {(Snapshot) in
            
            
//            let shotKey = Snapshot.children.nextObject() as! NSObject
//            
//            
//            
//            if let value1 = shotKey as? [String:AnyObject]{
//                print(value1)
//                
            if let value1 = Snapshot.value  as? [String:AnyObject]{
                print(value1)
                
                
                self._did=value1["doctorId"] as! String!
                self._holidayEndDate=value1["holidayEndDate"] as! String!
                
                self._holidayStartDate=value1["holidayStartDate"] as! String!
                
                
                
                
                
                
                
            }
            
            print(self._did)
            print(self._holidayEndDate)
            print(self._holidayStartDate)
            
            self.docholidays.append(doctorHolidays(_doctorid: self._did, _holidayEndDate: self._holidayEndDate, _holidayStartDate:self._holidayStartDate))
           
            
            
        })
        
        

        
    }
    
    func getdoctorAvalability(ID:String)    {
        
        docava.removeAll()
        dataref=FIRDatabase.database().reference()
        dataref.child("MedicalPanelData").child(ID).child("doctorAvalabilities").child("0").observe(.value, with: {(Snapshot) in
            
            print(ID)
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
                
                
            }
            
            
            print(self._locationId)
            print(self._WeekDayStart)
            print(self._weekDayEnd)
            print(self._avaStartTime)
            print(self._avaStart2Time)
            
            print(self._locationId)
            print(self._avaEnTime)
            print(self._avaEn2Time)
            
            self.docava.append(doctorAvalabilities(_avaEn2Time: self._avaEn2Time, _avaEndTime: self._avaEnTime, _avaStart2Time: self._avaStart2Time, _avaStartTime: self._avaStartTime, _doctorId0:  self._docid, _locationId: self._locationId, _weekDayEnd: self._weekDayEnd, _weekDayStart: self._WeekDayStart))
            print(self.docava.count)
            self.tbdocterlist.dataSource=self
            self.tbdocterlist.delegate=self
            self.tbdocterlist.reloadData()
            
            
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination=segue.destination as? DetailVC{
                        if let doc=sender as?  MedicalPanel{
                            
                            print(doc)
                            print("open")
                         
                            destination.DoctDetail=doc
                          
                            print("new")
                        }
            
            if let doc1=sender as?  doctorLocations{
                
                print(doc1)
                print("open")
                
                destination.DoctDetailLocation=doc1
                
                print("new")
            }
            if let doc2=sender as?  doctorAvalabilities{
                
                print(doc2)
                print("open")
                
                destination.DoctDetailAva=doc2
                
                print("new")
            }
            
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
