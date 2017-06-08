//
//  PhotoDataManager.swift
//  Salado
//
//  Created by Rz on 26/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
import AlamofireImage
import Alamofire
class PhotosDataManager {
    
    static let sharedManager = PhotosDataManager()
    private var photos = [String]()
    
    let photoCache = AutoPurgingImageCache(
        memoryCapacity: 100 * 1024 * 1024,
        preferredMemoryUsageAfterPurge: 60 * 1024 * 1024
    )
    
    
    //MARK: - Read Data
    
    func allPhotos() -> [String] {
        if !photos.isEmpty { return photos }
        guard let data = NSArray(contentsOfFile: dataPath()) as? [NSDictionary] else { return photos }
        for photoInfo in data {
            // let name = photoInfo["name"] as! String
            let urlString = photoInfo["imageURL"] as! String
            //let glacierScenic = GlacierScenic(name: name, photoURLString: urlString)
            photos.append(urlString)
        }
        return photos
    }
    
    func dataPath() -> String {
        return Bundle.main.path(forResource: "ChatDemo", ofType: "plist")!
    }
    
    func cacheImage(image: Image, urlString: String) {
        
        // PhotosDataManager.sharedManager.allPhotos()
        
        photoCache.add(image, withIdentifier: urlString)
    }
    
    func cachedImage(urlString: String) -> Image? {
        return photoCache.image(withIdentifier: urlString)
    }
    
    func getNetworkImage(urlString: String, complted: @escaping ((UIImage?) -> Void)) -> (Request) {
        
        var image:Image? = nil
        
        return Alamofire.request(urlString, method: .get).responseImage { response in
            
            if(response.result.value != nil)
            {
                let image1 = response.result.value
                
                image = image1!
                
                self.cacheImage(image: image!, urlString: urlString)
            }
            
            
            complted(image)
            
            //  self.cacheImage(image: image!, urlString: urlString)
        }
        
        //return image!
        
    }
    
    
}
