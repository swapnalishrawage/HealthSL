//
//  ChangemenuCell.swift
//  Salado
//
//  Created by Rz on 14/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class ChangemenuCell: UITableViewCell {
    @IBOutlet weak var imgmenu: UIImageView!

    @IBOutlet weak var imgcheck: UIImageView!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var view1: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updatecell(image:String,name:String)
        
    {
        view1.layer.cornerRadius=5
        
//        view1.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
//        view1.layer.borderWidth=2
        lblname.text=name
        if(image.isEmpty)
        {
            
            
            
        }
        else{
            
            let imagedownload = DownloadImage()
            
            let image1 = imagedownload.userImage(imageurlString: image)
            if(image1 != nil)
            {
                
                imgmenu.image = image1
            }
            else
            {
            self.imgmenu.setImageFromURL(url: image)
            }
            
            
        }
        
    }

}
