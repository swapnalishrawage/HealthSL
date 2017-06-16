//
//  DishItem.swift
//  Salado
//
//  Created by Rz on 15/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class DishItem{
private var _dishID:String!




var dishID:String{
get{
    
    return _dishID
    
}
set{
    _dishID=newValue
}
}

    init(dishid:String){
        _dishID=dishid
    }
}
