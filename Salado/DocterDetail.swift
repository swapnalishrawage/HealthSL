//
//  DocterDetail.swift
//  Salado
//
//  Created by Rz on 18/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
import Foundation
class Docterdetail
{
    private var _Time:String!
    private var _name:String!
    private var _place:String!
    private var _image:String!
    private var _price:String!
    private var _clinic:String!
  
    var Time : String{
        get {
            return _Time
            
        }
        set
        {
            _Time = newValue
        }
    }
    
    
    
    
    
    var Name : String{
        get {
            return _name
            
        }
        set
        {
            _name = newValue
        }
    }
    
    var Place : String{
        get {
            return _place
            
        }
        set
        {
            _place = newValue
        }
    }
    
    var Price : String{
        get {
            return _price
            
        }
        set
        {
            _price = newValue
        }
    }
    
    var Image:String
        {
        get {
            return _image
            
        }
        set
        {
            _image = newValue
        }
        
        
        
        
    }
    var Clinic:String
        {
        get{
            return _clinic
            
        }set{
            _clinic=newValue
        }
        
        
        
    }
    
    init(Name:String,Place:String,Time:String,Image:String,Price:String,Clinic:String)
    {
        _place=Place
        _name=Name
        _Time=Time
        _image=Image
        _price=Price
        _clinic=Clinic
        
        
    }
    
    
}
