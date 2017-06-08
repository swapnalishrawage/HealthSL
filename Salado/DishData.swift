//
//  DishData.swift
//  Salado
//
//  Created by Rz on 31/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class DishData{
    private var _dishid:String!
    private var _quantity:Int!
    private var _price:Int!
    
    var dishid:String{
        get{
            
            return _dishid
            
        }
        set{
            _dishid=newValue
        }
    }
    var quantity:Int{
        get{
            
            return _quantity
            
        }
        set{
            _quantity=newValue
        }
    }
    var price:Int{
        get{
            
            return _price
            
        }
        set{
            _price=newValue
        }
    }
    init(DishID:String,Quantity:Int,Price:Int)
    {
        _dishid=DishID
        _quantity=Quantity
        _price=Price
    }

}
