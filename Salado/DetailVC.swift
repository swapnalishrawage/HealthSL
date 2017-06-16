//
//  DetailVC.swift
//  Salado
//
//  Created by Rz on 18/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DetailVC: UIViewController {

    
    
    @IBOutlet weak var lblfees: UILabel!
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var lbladdress: UILabel!
    @IBOutlet weak var lblclinikname: UILabel!
    @IBOutlet weak var lblrating: UILabel!
    @IBOutlet weak var lblexperience: UILabel!
    @IBOutlet weak var lbldegree: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var imgdoc: UIImageView!
     var dataref: FIRDatabaseReference!
    @IBOutlet weak var txtdetaildescription: UITextView!
        private var   _docdetail:MedicalPanel!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var view3: UIView!
            var  DoctDetail : MedicalPanel{
                get {
                    return _docdetail
    
                }
                set
                {
                    _docdetail = newValue
                }
            }
    
    private var   _docdetaillocation:doctorLocations!
    
    
    var  DoctDetailLocation : doctorLocations{
        get {
            return _docdetaillocation
            
        }
        set
        {
            _docdetaillocation = newValue
        }
    }
    
    
    
    private var   _docdetailava:doctorAvalabilities!
    
    
    var  DoctDetailAva : doctorAvalabilities{
        get {
            return _docdetailava
            
        }
        set
        {
            _docdetailava = newValue
        }
    }
    
    
    @IBOutlet weak var btnbookappoint: UIButton!
    @IBOutlet weak var scview1: UIScrollView!
    
    var _docid:String!
    var _avaEn2Time:String!
    var _avaEnTime:String!
    var _avaStart2Time:String!
    var _avaStartTime:String!
    var _doctorId:String!
    var _locationId:String!
    var _WeekDayStart:String!
    var _weekDayEnd:String!
    
    
    //location
    
    
    @IBOutlet weak var scview: UIScrollView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var infoview: UIView!
    private var _address:String!
    private var _city:String!
    private var _clinicname:String!
    private var _doctorid1:String!
    private var _location:String!
    private var _locationId1:String!
    private var _locationName:String!

    @IBAction func backclick(_ sender: Any) {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "ListOfDoctersVC") as! ListOfDoctersVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtdetaildescription.scrollRangeToVisible(NSMakeRange(0, 0))
      scview.contentSize = CGSize(width: scview.bounds.width, height: self.view3.frame.height+660     )//
        scview.contentSize = CGSize(width: self.scview.bounds.width, height: self.scview.bounds.height)
            view3.layer.cornerRadius=5
        view1.layer.cornerRadius=5
        view2.layer.cornerRadius=5
        btnbookappoint.layer.cornerRadius=5
        infoview.layer.cornerRadius=5
        
        let address:String=UserDefaults.standard.value(forKey: "Address") as! String
        let clinicname:String=UserDefaults.standard.value(forKey: "Clinicname") as! String
        let time:String=UserDefaults.standard.value(forKey: "Time") as! String
        
        
        print(address)
        print(clinicname)
        print(time)
        view2.layer.cornerRadius=5
        view3.layer.cornerRadius=5
        
       txtdetaildescription.scrollsToTop=true
                lblname.text=DoctDetail._doctorName
        lbldegree.text=DoctDetail._doctorDescription
        lblexperience.text=DoctDetail._doctorExperience
        
        print(DoctDetail._doctorId)
        UserDefaults.standard.set(DoctDetail._Id, forKey: "DocID")
        lblrating.text="99 %"
        
        txtdetaildescription.text=DoctDetail._doctorDetailDescrption
        
        
        lblfees.text=DoctDetail._doctorConsultationFess
        lbladdress.text=address
        lblclinikname.text=clinicname
        
        
        let imagedownload = DownloadImage()
        
        let docimage = imagedownload.userImage(imageurlString: DoctDetail._doctorThumbnail)
        if(docimage != nil)
        {
            
            imgdoc.image = docimage
        }
        

        
        getdoctorAvalability(id: DoctDetail._Id)
        
        getdoctorlocation(ID: DoctDetail._Id)
    }

    
    
    
    func getdoctorAvalability(id:String)    {
              
        
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
                
                
                
                self.lbltime.text=self._WeekDayStart+"To"+self._weekDayEnd+":"+self._avaStartTime+"-"+self._avaEnTime+" "+self._avaStart2Time+"-"+self._avaEn2Time

                
                
                
            } else {
                
                //no comments to append the arrays
                
            }
            
            

            
        })
        
        
    }
    
    
    func getdoctorlocation(ID:String)
    {
        
        
        
        dataref=FIRDatabase.database().reference()
        self.dataref.database.reference().child("MedicalPanelData").child(ID).child("doctorLocations").child("0").observe(.value, with: {(Snapshot) in
            
            
            
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
  
           
            self.lblclinikname.text=self._clinicname
            self.lbladdress.text=self._address
            
            
            
        })
        
        
        
        
        
        
        
        ////////
        
        
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
       // txtdetaildescription.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bookappointment(_ sender: Any) {
        
       // performSegue(withIdentifier: "squebookplan", sender: nil)
        
    }
    @IBOutlet weak var BookAppointment: UIButton!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
