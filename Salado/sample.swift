//
//  sample.swift
//  Salado
//
//  Created by Rz on 06/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
class sample: Mappable {
    
    var date:String?
    var doctorId:String?
    var slot:String?
    var userId:String?
   
    // var isDeliver:Bool?
   
    //var participant = Mapper<participantListModel>().mapArray(JSONString: p)
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        
        date<-map["date"]
        doctorId <- map["doctorId"]
        slot <- map["slot"]
        userId <- map["userId"]
       
        
                
    }
    init()
    {
        
    }
    
    
    
}
