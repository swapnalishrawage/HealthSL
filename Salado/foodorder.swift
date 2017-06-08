//
//  foodorder.swift
//  Salado
//
//  Created by Rz on 29/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class foodorder{
    private var dishContent:String!
    private var dishDescription:String!
    private var dishId:String!
    private var dishIngredients:String!
    private var dishName:String!
    private var dishPrice:String!
    private var dishRatings:String!
    private var dishThumbnail:String!
    
    private var dishType:String!
    private var foodPreparationTime:String!
    
    
    var _dishContent:String{
        get{
            
            return dishContent
            
        }
        set{
            dishContent=newValue
        }
    }
    var _dishDescription:String{
        get{
            
            return dishDescription
            
        }
        set{
            dishDescription=newValue
        }
    }
    
    var _dishId:String{
        get{
            
            return dishId
            
        }
        set{
            dishId=newValue
        }
    }
    var _dishIngredients:String{
        get{
            
            return dishIngredients
            
        }
        set{
            dishIngredients=newValue
        }
    }
    
    var _dishName:String{
        get{
            
            return dishName
            
        }
        set{
            dishName=newValue
        }
    }
    
    var _dishPrice:String{
        get{
            
            return dishPrice
            
        }
        set{
            dishPrice=newValue
        }
    }
    var _dishRatings:String{
        get{
            
            return dishRatings
            
        }
        set{
            dishRatings=newValue
        }
    }
    var _dishThumbnail:String{
        get{
            
            return dishThumbnail
            
        }
        set{
            dishThumbnail=newValue
        }
    }
    var _dishType:String{
        get{
            
            return dishType
            
        }
        set{
            dishType=newValue
        }
    }
    
    var _foodPreparationTime:String{
        get{
            
            return foodPreparationTime
            
        }
        set{
            foodPreparationTime=newValue
        }
    }
    
    
    init(_dContent:String,_dDescription:String,_dId:String,_dIngredients:String,_dName:String,_dRating:String,_dPrice:String,_dThumbnail:String,_dType:String,_fPreparationTime:String)
    {
        dishContent=_dContent
        dishDescription=_dDescription
        dishId=_dId
        dishIngredients=_dIngredients
        dishName=_dName
        dishRatings=_dRating
        dishPrice=_dPrice
        dishType=_dType
        dishThumbnail=_dThumbnail
        
        foodPreparationTime=_fPreparationTime
    }
    
}
