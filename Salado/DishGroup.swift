//
//  DishGroup.swift
//  Salado
//
//  Created by Rz on 15/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class DishGroup{
    private var _groupID:String!
    private var _groupName:String!
    private var _dishItems:[String]!
    private var _KeyID:String!
    
    
    var KeyID:String{
        get{
            
            return _KeyID
            
        }
        set{
            _KeyID=newValue
        }
    }
    
    
    
    var groupID:String{
        get{
            
            return _groupID
            
        }
        set{
            _groupID=newValue
        }
    }
    var groupName:String{
        get{
            
            return _groupName
            
        }
        set{
            _groupName=newValue
        }
    }
    var dishItems:[String]{
        get{
            
            return _dishItems
            
        }
        set{
            _dishItems=newValue
        }
    }
    init(GroupID:String,GrupName:String)
    {
       _groupID=GroupID
        _groupName=GrupName
    }
    init(GroupID:String,GrupName:String,ID:String)
    {
        _groupID=GroupID
        _groupName=GrupName
        _KeyID=ID
    }
    init(GroupID:String,GrupName:String,ID:String,dishitem:[String])
    {
        _groupID=GroupID
        _groupName=GrupName
        _KeyID=ID
        _dishItems=dishitem
    }

}
