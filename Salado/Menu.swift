//
//  Menu.swift
//  Salado
//
//  Created by Rz on 18/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
import Foundation
class Menu
{
    private var _name:String!
    private var _image:String!
    private var _rating:String!
    private var _categoryimage:String!
    private var _price:String!
    private var _categoryname:String!
    
    var name : String{
        get {
            return _name
            
        }
        set
        {
            _name = newValue
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
    
    var Rating : String{
        get {
            return _rating
            
        }
        set
        {
            _rating = newValue
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
    
    
    init(Name:String,Rating:String,Category:String,Image:String,Price:String)
    {
        _rating=Rating
        _name=Name
        _image=Image
        _price=Price
        _categoryname=Category
        
        
    }
    
    
}
