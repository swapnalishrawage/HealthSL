//
//  categorycell.swift
//  Salado
//
//  Created by Rz on 22/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class categorycell: UITableViewCell {

    @IBOutlet weak var lbldetail1: UILabel!
    @IBOutlet weak var lblname1: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbldetail: UILabel!
    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updatecell(name:String,detail:String,image:String)
    {
        lblname.text=name
        lbldetail.text=detail
        
        
        
        if(image.isEmpty)
        {
            
            
        }
        else{
//           / self.img.setImageFromURL(url: image)
            let imagedownload = DownloadImage()
            
            let image1 = imagedownload.userImage(imageurlString: image)
            if(image1 != nil)
            {
                
                img.image = image1
            }
            else
            {
                
            }
            
            
        }
        
    }
    
    
}
