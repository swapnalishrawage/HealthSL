//
//  DownloadImage.swift
//  Salado
//
//  Created by Rz on 26/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import Alamofire

class DownloadImage{
    
    
    func setImage(imageurlString: String, imageView: UIImageView) {
        
        var userImg:Image? = nil
        if PhotosDataManager.sharedManager.cachedImage(urlString: imageurlString) != nil
        {
            userImg = PhotosDataManager.sharedManager.cachedImage(urlString: imageurlString)
            
            imageView.image = userImg
        }
            
        else
        {
            
                
                let urlString = imageurlString
                _ = PhotosDataManager.sharedManager.getNetworkImage(urlString: urlString) {image in
                    userImg = image
                    imageView.image = userImg
               
            }
        }
        
    }
    func userImage(imageurlString: String) -> Image? {
        
        var userImg:Image? = nil
        
        if PhotosDataManager.sharedManager.cachedImage(urlString: imageurlString) != nil
        {
            userImg = PhotosDataManager.sharedManager.cachedImage(urlString: imageurlString)
        }
            
        else
        {
            let urlString = imageurlString
            _ = PhotosDataManager.sharedManager.getNetworkImage(urlString: urlString) {image in
                userImg = image
            }
            
        }
        return userImg
    }
    
    
}
