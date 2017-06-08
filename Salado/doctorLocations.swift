//
//  doctorLocations.swift
//  Salado
//
//  Created by Rz on 25/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation


import UIKit
//import ObjectMapper
//
//class doctorLocations: Mappable {
//    
//    var address:String?
//    var threadName:String?
//    var thumbnailUrl:String?
//    var lastSenderName:String?
//    var badgeCount:String?
//    var timeStamp:String?
//    var lastSenderById:String?
//    var lastMessageId:String?
//    var lastMessageText:String?
//    var initiateId:String?
//    var initiateName:String?
//    var threadCustomName:String?
//    var participantList:String?
//    
//    
//    required init?(map: Map) {
//        
//        
//        
//    }
//    
//    func mapping(map: Map) {
//        threadId <- map["threadId"]
//        threadName<-map["threadName"]
//        thumbnailUrl <- map["thumbnailUrl"]
//        lastSenderName <- map["lastSenderName"]
//        badgeCount <- map["badgeCount"]
//        timeStamp <- map["timeStamp"]
//        lastSenderById<-map["lastSenderById"]
//        lastMessageId<-map["lastMessageId"]
//        lastMessageText <- map["lastMessageText"]
//        initiateId <- map["initiateId"]
//        initiateName<-map["initiateName"]
//        threadCustomName <- map["threadCustomName"]
//        participantList<-map["participantList"]
//        print(participantList!)
//        print(badgeCount!)
//        
//    }
//    
//    
//    
//}



class doctorLocations{
    
    
    private var address:String!
    private var city:String!
    private var clinicName:String!
    private var doctorId:String!
    private var location:String!
    private var locationName:String!
    private var locationid:String!
    
    
    var _address : String{
        get {
            return address
            
        }
        set
        {
            address = newValue
        }
    }
    
    
    var _city : String{
        get {
            return city
            
        }
        set
        {
            city = newValue
        }
    }
    var _clinicName: String{
        get {
            return clinicName
            
        }
        set
        {
            clinicName = newValue
        }
    }

    
    var _doctorId: String{
        get {
            return doctorId
            
        }
        set
        {
            doctorId = newValue
        }
    }
    
    
    var _location: String{
        get {
            return location
            
        }
        set
        {
            location = newValue
        }
    }
    
    
    var _locationName: String{
        get {
            return locationName
            
        }
        set
        {
            locationName = newValue
        }
    }
    
    
    
    var _locationid: String{
        get {
            return locationid
            
        }
        set
        {
            locationid = newValue
        }
    }
    
    
    init(_address:String,_city:String,_clinicname:String,_doctorid:String,_location:String,_locationName:String,_locationId:String)
        {
            
            
            
            address=_address
            city=_city
            clinicName=_clinicname
            doctorId=_doctorid
            location=_location
            locationName=_locationName
            locationid=_locationId
        
    }
    
}
