 //
//  dayProgram.swift
//  Salado
//
//  Created by Rz on 25/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class dayProgram{
    private var _breakfastDishId:String!
    private var _day:String!
    private var _dinnerDishId:String!
    private var _lunchDishId:String!
    private var _snacksDishId:String!
    private var _breakfastGroupID:String!
     private var _dinnerGroupID:String!
    private var _lunchGroupID:String!
    private var _snacksGroupID:String!
    private var _title:String!
    private var _desc:String!
    private var _imgcheckuncheck:String!
    private var _dat:String!
    
    
    var dat:String{
        get {
            return _dat
        }
        
        set
        {
            _dat=newValue
        }
    }
    
    var breakfastGroupID:String{
        get {
            return _breakfastGroupID
        }
        
        set
        {
            _breakfastGroupID=newValue
        }
    }
    var imgcheckuncheck:String{
        get {
            return _imgcheckuncheck
        }
        
        set
        {
            _imgcheckuncheck=newValue
        }
    }

    var dinnerGroupID:String{
        get {
            return _dinnerGroupID
        }
        
        set
        {
            _dinnerGroupID=newValue
        }
    }
    var lunchGroupID:String{
        get {
            return _lunchGroupID
        }
        
        set
        {
            _lunchGroupID=newValue
        }
    }
    
    
    
    var snacksGroupID:String{
        get {
            return _snacksGroupID
        }
        
        set
        {
            _snacksGroupID=newValue
        }
    }
    
    
    
    var title:String{
        get {
            return _title
        }
        
        set
        {
            _title=newValue
        }
    }
    
    var desc:String{
        get {
            return _desc
        }
        
        set
        {
            _desc=newValue
        }
    }
    
    
    
    
    var breakfastDishId:String{
        get {
            return _breakfastDishId
        }
    
  set
    {
          _breakfastDishId=newValue
     }
    }

  
    var day:String{
        
        get {
            return _day
            
        }
        set
        {
            _day = newValue
        }
    }
    
    var dinnerDishId:String{
        
        get {
            return _dinnerDishId
            
        }
        set
        {
            _dinnerDishId = newValue
        }
    }
    
    var lunchDishId:String{
        
        get {
            return _lunchDishId
            
        }
        set
        {
            _lunchDishId = newValue
        }
    }
    
    var snacksDishId:String{
        
        get {
            return _snacksDishId
            
        }
        set
        {
            _snacksDishId = newValue
        }
    }
    
    
    
    init(breakfastDishId:String,day:String,dinnerDishId:String,lunchDishId:String,snacksDishId:String)
    {
        
        _breakfastDishId=breakfastDishId
        _day=day
        _lunchDishId=lunchDishId
        _dinnerDishId=dinnerDishId
        _snacksDishId=snacksDishId
    }
    
    
    init(breakfastDishId:String,day:String,dinnerDishId:String,lunchDishId:String,snacksDishId:String,breakfastGID:String,lunchGID:String,dinnerGID:String,SnackGID:String,Title:String,Desc:String,ImgCU:String,dt:String)
    {
        
        _breakfastDishId=breakfastDishId
        _day=day
        _lunchDishId=lunchDishId
        _dinnerDishId=dinnerDishId
        _snacksDishId=snacksDishId
        _breakfastGroupID=breakfastGID
        _lunchGroupID=lunchGID
        _dinnerGroupID=dinnerGID
        _snacksGroupID=SnackGID
        _title=Title
        _desc=Desc
        _imgcheckuncheck=ImgCU
        _dat=dt
        
    }
    
    
}
