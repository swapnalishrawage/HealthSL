//
//  orderitem.swift
//  Salado
//
//  Created by Rz on 21/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class orderitem
{
    private var _name:String!
    private var _image:String!
    
    private var _categoryimage:String!
    private var _price:String!
    private var _categoryname:String!
    private var _count:String!
    var name : String{
        get {
            return _name
            
        }
        set
        {
            _name = newValue
        }
    }
    
    var count : String{
        get {
            return _count
            
        }
        set
        {
            _count = newValue
        }
    }
    
    
    
    var image : String{
        get {
            return _image
            
        }
        set
        {
            _image = newValue
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
    
    var Category:String
        {
        get {
            return _categoryname
            
        }
        set
        {
            _categoryname = newValue
        }
        
        
        
        
    }
    
    
    init(Name:String,Category:String,Image:String,Price:String,Count:String)
    {

        _name=Name
        _image=Image
        _price=Price
        _categoryname=Category
        _count=Count
        
    }
    
    
}
