//
//  doctorAvalabilities.swift
//  Salado
//
//  Created by Rz on 25/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
import Firebase
class doctorAvalabilities:FIRDataSnapshot{
    private var availableEn2Time:String!
    private var availableEndTime:String!
    private var availableStart2Time:String!
    private var availableStartTime:String!
    private var doctorId0:String!
    private var locationId:String!
    private var weekDayEnd:String!
    private var weekDayStart:String!
    
    
    
    var _avaEn2time : String{
        get {
            return availableEn2Time
            
        }
        set
        {
            availableEn2Time = newValue
        }
    }
    
    
    var _avaEndTime : String{
        get {
            return availableEndTime
            
        }
        set
        {
           availableEndTime = newValue
        }
    }
    var _avaStart2Time : String{
        get {
            return availableStart2Time
            
        }
        set
        {
            availableStart2Time = newValue
        }
    }
    var _avaStartTime : String{
        get {
            return availableStartTime
            
        }
        set
        {
            availableStartTime = newValue
        }
    }
    var _locationId : String{
        get {
            return locationId
            
        }
        set
        {
            locationId = newValue
        }
    }
    var _weekDayEnd:String{
        get {
            return weekDayEnd
            
        }
        set
        {
            weekDayEnd = newValue
        }
    }
    
    
    var _weekDayStart : String{
        get {
            return weekDayStart
            
        }
        set
        {
            weekDayStart = newValue
        }
    }
    
    var _doctorId0 : String{
        get {
            return doctorId0
            
        }
        set
        {
            doctorId0 = newValue
        }
    }
    
    
    
    init(_avaEn2Time:String,_avaEndTime:String,_avaStart2Time:String,_avaStartTime:String,_doctorId0:String,_locationId:String,_weekDayEnd:String,_weekDayStart:String)
    {
        availableEn2Time=_avaEn2Time
         availableEndTime=_avaEndTime
        availableStart2Time=_avaStart2Time
       availableStartTime=_avaStartTime
        doctorId0=_doctorId0
        locationId=_locationId
        weekDayEnd=_weekDayEnd
        weekDayStart=_weekDayStart
    }
    
    }




//import ObjectMapper
//
//class doctorAvalabilities: Mappable {
//
//    var availableEn2Time:String?
//    var availableEndTime:String?
//    var availableStart2Time:String?
//    var avaStart2Time:String?
//    var availableStartTime:String?
//    var doctorId:String?
//    var locationId:String?
//    var weekDayEnd:String?
//    var weekDayStart:String?
//    
//
//
//    required init?(map: Map) {
//
//
//
//    }
//
//    func mapping(map: Map) {
//        availableEn2Time <- map["availableEn2Time"]
//        availableEndTime<-map["availableEndTime"]
//        availableStart2Time <- map["availableStart2Time"]
//        availableStartTime <- map["availableStartTime"]
//        doctorId <- map["doctorId"]
//        locationId <- map["locationId"]
//        weekDayEnd<-map["weekDayEnd"]
//        weekDayStart<-map["weekDayStart"]
//        
//    }
//
//
//
//}
