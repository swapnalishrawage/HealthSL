//
//  Category.swift
//  Salado
//
//  Created by Rz on 22/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
//
//  File.swift
//  Salado
//
//  Created by Rz on 22/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class category{
    private var _name:String!
    private var _image:String!
    
    private var _detail:String!
   
    
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
    
    


        
        
        
    var detail : String{
        get {
            return _detail
            
        }
        set
        {
            _detail = newValue
        }
    }

    
    
    init(Name:String,Detail:String,Image:String)
    {
        
        _name=Name
        _image=Image
        _detail=Detail
        
        
        
    }
    
    
}
