//
//  doctorHolidays.swift
//  Salado
//
//  Created by Rz on 25/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class doctorHolidays{
    
    
    
    private var doctorId:String!
    private var holidayEndDate:String!
    private var holidayStartDate:String!
    
    
    
    var _doctorId : String{
        get {
            return doctorId
            
        }
        set
        {
            doctorId = newValue
        }
    }
    
    var _holidayEndDate : String{
        get {
            return holidayEndDate
            
        }
        set
        {
            holidayEndDate = newValue
        }
    }
    var _holidayStartDate : String{
        get {
            return holidayStartDate
        }
        set
        {
            holidayStartDate = newValue
        }
    }
    
    
    init(_doctorid:String,_holidayEndDate:String,_holidayStartDate:String)
    {
       
        doctorId=_doctorid
        holidayStartDate=_holidayStartDate
        holidayEndDate=_holidayEndDate
    }
}
