//
//  OrderFood.swift
//  Salado
//
//  Created by Rz on 28/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
 class OrderedFood{
    private var dishId:String!
    private var dishQuantity:String!
    private var dishname:String!
    private var dishimage:String!
    private var price:String!
    private var dishtype:String!
    var _dishId:String{
        get{
            
            return dishId
            
        }
        set{
            dishId=newValue
        }
    }
    var _dishtype:String{
        get{
            
            return dishtype
            
        }
        set{
            dishtype=newValue
        }
    }
    var _dishQuantity:String{
        get{
            
            return dishQuantity
            
        }
        set{
            dishQuantity=newValue
        }
    }

    var _dishimage:String{
        get{
            
            return dishimage
            
        }
        set{
            dishimage=newValue
        }
    }
    var _dishname:String{
        get{
            
            return dishname
            
        }
        set{
            dishname=newValue
        }
    }
    var _price:String{
        get{
            
            return price
            
        }
        set{
            price=newValue
        }
    }

    
    init(_dishid:String,_dishQuantity:String,_dishname:String,_dishimage:String,_price:String,_dishtype:String)
    {
        dishId=_dishid
        dishQuantity=_dishQuantity
        dishname=_dishname
        dishimage=_dishimage
        price=_price
        dishtype=_dishtype
    }
    
}
