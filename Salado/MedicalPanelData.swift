//
//  MedicalPanelData.swift
//  Salado
//
//  Created by Rz on 25/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseDatabase
class MedicalPanelData:NSObject{
    private var medicalPanel:MedicalPanel!
    private var doctorAvalabilities:[doctorAvalabilities]!
    private var doctorLocations:[doctorLocations]!
      private var doctorHolidays:[doctorHolidays]!
    
    private var snapshot:FIRDataSnapshot!
    private var   doctorType:String!
    
    var _MedicalPanel:MedicalPanel{
        get{
            return medicalPanel
        }
        set{
            medicalPanel=newValue
        }
    }
    
    
    var _DoctorAvalability:[doctorAvalabilities]{
        get{
            return doctorAvalabilities
        }
        set{
            doctorAvalabilities=newValue
        }
    }
    
    var _DoctorLocation:[doctorLocations]{
        get{
            return doctorLocations
        }
        set{
            doctorLocations=newValue
        }
    }
    
    
    
    
    var _DoctorHoliday:[doctorHolidays]{
        get{
            return doctorHolidays
        }
        set{
          doctorHolidays=newValue
        }
    }
    
    
    var _doctortType:String{
        get{
            return doctorType
        }
        set{
            doctorType=newValue
        }
    }
    
    
    
    var sn:FIRDataSnapshot{
        get{
            return snapshot
        }
        set{
            snapshot=newValue
        }
    }
    
    
//    init(snapshot: FIRDataSnapshot, dictionary: [String:Any]) {
//        
//        doctorType = dictionary["doctorType"] as? String ?? ""
//        
//        let bookingDic = dictionary["doctorHolidays"] as? [String:AnyObject] ?? [String:Any]()
//      
//        
//        //bookingDic.map { FacilityBooking(bookingId: $0, dictionary: $1 as? [String:Any] ?? [:]) }    }
//    
//    }
    override init()
    {
        
    }
    
    init(snapshot: FIRDataSnapshot) {
        
        print(snapshot)
    //     medicalPanel=snapshot.value["medicalPanel"]
//       medicalPanel = snapshot.value?["medicalPanel"] as! MedicalPanel
//        doctorHolidays = snapshot.value?["doctorHolidays"] as! [doctorHolidays]
//        doctorAvalabilities = snapshot.value!["doctorAvalabilities"] as! [doctorAvalabilities]
        
    }
    
        init(_MedicalPanel:MedicalPanel,_DoctorAvalability:[doctorAvalabilities],_DoctorLocation:[doctorLocations],_DoctorHoliday:[doctorHolidays],_doctorType:String)
    {
        medicalPanel=_MedicalPanel
       doctorHolidays=_DoctorHoliday
        doctorAvalabilities=_DoctorAvalability
      doctorLocations=_DoctorLocation
        doctorType=_doctorType
        
        
    }
}
