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
    
}
