//
//  MedicalPanel.swift
//  Salado
//
//  Created by Rz on 24/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class MedicalPanel{
    private var doctorConsultationFess:String!
    private var doctorDegree:String!
    private var doctorDescription:String!
    private var doctorDetailDescrption:String!
    private var doctorExperience:String!
    private var doctorId:String!
    private var doctorName:String!
    private var doctorThumbnail:String!
    private var doctype:String!
    private var id:String!
    var _doctorConsultationFess : String{
        get {
            return doctorConsultationFess
            
        }
        set
        {
            doctorConsultationFess = newValue
        }
    }
    
    var _Id : String{
        get {
            return id
            
        }
        set
        {
           id = newValue
        }
    }
    var _doctype : String{
        get {
            return doctype
            
        }
        set
        {
            doctype = newValue
        }
    }
    var _doctorDescription : String{
        get {
            return doctorDescription
            
        }
        set
        {
            doctorDescription = newValue
        }
    }
    var _doctorDetailDescrption : String{
        get {
            return doctorDetailDescrption
            
        }
        set
        {
            doctorDetailDescrption = newValue
        }
    }
    
    var _doctorExperience : String{
        get {
            return doctorExperience
            
        }
        set
        {
            doctorExperience = newValue
        }
    }
    
    var _doctorId : String{
        get {
            return doctorId
            
        }
        set
        {
            doctorId = newValue
        }
    }
    
    var _doctorName : String{
        get {
            return doctorName
            
        }
        set
        {
            doctorName = newValue
        }
    }
    
    var _doctorThumbnail:String
        {
        get {
            return doctorThumbnail
            
        }
        set
        {
            doctorThumbnail = newValue
        }
    }
    
        // return _LastMsgSender
        
    init(_doctorConsultationFess:String,_doctorDescription:String,_doctorDetailDescrption:String,_doctorExperience:String,_doctorId:String,_doctorName:String,_doctorThumbnail:String,_doctype:String,_Childkey:String)
        {
            
            doctorConsultationFess=_doctorConsultationFess
            doctorDescription=_doctorDescription
            doctorDetailDescrption=_doctorDetailDescrption
            doctorId=_doctorId
            doctorName=_doctorName
            doctorExperience=_doctorExperience
            doctorThumbnail=_doctorThumbnail
            doctype=_doctype
           id=_Childkey
        }
   
    
}
