//
//  dayProgram.swift
//  Salado
//
//  Created by Rz on 24/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class StartDiet{
    
    private var _breakfastinclude:Bool!
    private var _customise:Bool!
    private var _dinnerinclude:Bool!
    private var _lunchinclude:Bool!
    private var _programdays:Int!
    private var _programDescription
    :String!
    private var _programId:String!
    private var _programName:String!
    private var _programPrice:String!
    private var _programRating:String!
    private var _programThumb:String!
    private  var _programType:String!
    private var _snackinclude:Bool!
    private var _programAmm:String!
    private var _programinclude:String!
    private var _dayprogram:[dayProgram]!
    private var _id:String!
    
    
    //userdiet
    
    private var _endDate:String!
    private var _startDate:String!
    private var _userId:String!
    
    
    var startDate: String{
        get {
            return _startDate
            
        }
        set
        {
            _startDate = newValue
        }
    }
    
    var endDate: String{
        get {
            return _endDate
            
        }
        set
        {
            _endDate = newValue
        }
    }
    
    
    
    var userId: String{
        get {
            return _userId
            
        }
        set
        {
            _userId = newValue
        }
    }
    
    var ID: String{
        get {
            return _id
            
        }
        set
        {
            _id = newValue
        }
    }
    
    
    
    var dinnerinclude : Bool{
        get {
            return _dinnerinclude
            
        }
        set
        {
            _dinnerinclude = newValue
        }
    }
    var breakfastinclude : Bool{
        get {
            return _breakfastinclude
            
        }
        set
        {
            _breakfastinclude = newValue
        }
    }
    var customise : Bool{
        get {
            return _customise
            
        }
        set
        {
            _customise = newValue
        }
    }
    var programAmm : String{
        get {
            return _programAmm
            
        }
        set
        {
            _programAmm = newValue
        }
    }
    var lunchincluden : Bool{
        get {
            return _lunchinclude
            
        }
        set
        {
            _lunchinclude = newValue
        }
    }
    var dayprog:[dayProgram]{
        get {
            return _dayprogram
            
        }
        set
        {
            _dayprogram = newValue
        }
    }
    
    
    var programDescription : String{
        get {
            return _programDescription
            
        }
        set
        {
            _programDescription = newValue
        }
    }
    
    var programId : String{
        get {
            return _programId
            
        }
        set
        {
            _programId = newValue
        }
    }
    var programdays : Int{
        get {
            return _programdays
            
        }
        set
        {
            _programdays = newValue
        }
    }

    
    var programName : String{
        get {
            return _programName
            
        }
        set
        {
            _programName = newValue
        }
    }
    
    var programPrice:String
        {
        get {
            return _programPrice
            
        }
        set
        {
            _programPrice = newValue
        }
    }
    
    var programRating:String{
       
        get {
            return _programRating
            
        }
        set
        {
            _programRating = newValue
        }
    }
    var programThumb:String{
        
        get {
            return _programThumb
            
        }
        set
        {
            _programThumb = newValue
        }
    }
    
    var programType:String{
        
        get {
            return _programType
            
        }
        set
        {
            _programType = newValue
        }
    }
    var programinclude:String{
        
        get {
            return _programinclude
            
        }
        set
        {
            _programinclude = newValue
        }
    }
    var snackinclude:Bool{
        
        get {
            return _snackinclude
            
        }
        set
        {
            _snackinclude = newValue
        }
    }
    // return _LastMsgSender
    
    init(dinnerinclud:Bool,lunchinclud:Bool,programday:Int,programdes:String,programid:String,programName:String,programprice:String,programrating:String,programthub:String,programtype:String,programamount:String,
         snackinclude:Bool,breakfastinclude:Bool,customise:Bool,ID:String)
    {
        
        _dinnerinclude=dinnerinclud
        _lunchinclude=lunchinclud
       _programdays=programday
        _programId=programid
        _programPrice=programprice
        _programName=programName
       _programDescription=programdes
        _programThumb=programthub
        _programRating=programrating
        _snackinclude=snackinclude
        _programAmm=programamount
            _breakfastinclude=breakfastinclude
        _customise=customise
        _id=ID
        _programType=programtype
      
    
    }
    
    init(dinnerinclud:Bool,lunchinclud:Bool,programday:Int,programdes:String,programid:String,programName:String,programprice:String,programrating:String,programthub:String,programtype:String,programamount:String,
         snackinclude:Bool,breakfastinclude:Bool,customise:Bool,ID:String,Enddate:String,StartDate:String,Userid:String)
    {
        
        _dinnerinclude=dinnerinclud
        _lunchinclude=lunchinclud
        _programdays=programday
        _programId=programid
        _programPrice=programprice
        _programName=programName
        _programDescription=programdes
        _programThumb=programthub
        _programRating=programrating
        _snackinclude=snackinclude
        _programAmm=programamount
        _breakfastinclude=breakfastinclude
        _customise=customise
        _id=ID
        _endDate=Enddate
        _startDate=StartDate
        _userId=Userid
        _programType=programtype
        
        
    }
    

    
}










    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
