//
//  OrderFood.swift
//  Salado
//
//  Created by Rz on 29/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class OrderFood{
    private var orderDate:String!
    private var orderId:String!
    private var orderLastUpdate:String!
    private var orderStatus:String!
    private var orderTax:String!
    private var orderTotalPrice:String!
    private var orderedFood:[OrderedFood]!
    private var userID:String!
    private var orderfoodname:String!
     private var orderDate1:Date!
    
    var _orderDate1:Date{
        get{
            
            return orderDate1
            
        }
        set{
            orderDate1=newValue
        }
    }
    var _orderfoodname:String{
        get{
            
            return orderfoodname
            
        }
        set{
            orderfoodname=newValue
        }
    }
    var _orderDate:String{
        get{
            
            return orderDate
            
        }
        set{
            orderDate=newValue
        }
    }
    var _orderId:String{
        get{
            
            return orderId
            
        }
        set{
           orderId=newValue
        }
    }
    
    var _orderLastUpdate:String{
        get{
            
            return orderLastUpdate
            
        }
        set{
            orderLastUpdate=newValue
        }
    }
    var _orderStatus:String{
        get{
            
            return orderStatus
            
        }
        set{
            orderStatus=newValue
        }
    }
    
    var _orderTax:String{
        get{
            
            return orderTax
            
        }
        set{
            orderTax=newValue
        }
    }
    
    var _orderTotalPrice:String{
        get{
            
            return orderTotalPrice
            
        }
        set{
            orderTotalPrice=newValue
        }
    }
    var _orderedFood:[OrderedFood]{
        get{
            
            return orderedFood
            
        }
        set{
            orderedFood=newValue
        }
    }
    var _userID:String{
        get{
            
            return userID
            
        }
        set{
            userID=newValue
        }
    }
    
    init(_orderDate:String,_orderId:String,_orderLastUpdate:String,_orderStatus:String,_orderTax:String,_orderTotalPrice:String,_orderedFood:[OrderedFood],_userID:String)
    {
      
        orderDate=_orderDate
        orderId=_orderId
        orderLastUpdate=_orderLastUpdate
        orderStatus=_orderStatus
        orderTax=_orderTax
        orderTotalPrice=_orderTotalPrice
        orderedFood=_orderedFood
        userID=_userID
        
        
        
    }
    init(_orderDate:String,_orderId:String,_orderLastUpdate:String,_orderStatus:String,_orderTax:String,_orderTotalPrice:String,_orderedFoodName:String,_userID:String)
    {
        
        orderDate=_orderDate
        orderId=_orderId
        orderLastUpdate=_orderLastUpdate
        orderStatus=_orderStatus
        orderTax=_orderTax
        orderTotalPrice=_orderTotalPrice
      orderfoodname=_orderedFoodName
        userID=_userID
        
        
        
    }
    
    
    init(_orderDate:Date,_orderId:String,_orderLastUpdate:String,_orderStatus:String,_orderTax:String,_orderTotalPrice:String,_orderedFoodName:String,_userID:String)
    {
        
        orderDate1=_orderDate
        orderId=_orderId
        orderLastUpdate=_orderLastUpdate
        orderStatus=_orderStatus
        orderTax=_orderTax
        orderTotalPrice=_orderTotalPrice
        orderfoodname=_orderedFoodName
        userID=_userID
        
        
        
    }

    

}
