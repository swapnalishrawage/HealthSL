//
//  MyDietPlanCell.swift
//  Salado
//
//  Created by Rz on 13/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class MyDietPlanCell: UITableViewCell {
    @IBOutlet weak var lblproinclude: UILabel!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lblrate: UILabel!

    @IBOutlet weak var lblday: UILabel!
    @IBOutlet weak var lblproname: UILabel!
    @IBOutlet weak var imgpro: UIImageView!
    
    @IBOutlet weak var imgt: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func updatecell(name:String,day:Int,rating:String,thum:String,programinclude:String)
    {
        
        
       lblproname.text=name
        lblrate.text=rating
        lblday.text="Day "+String(day)
        lblproinclude.text=programinclude
        
        
        self.imgpro.setImageFromURL(url: thum)
        if(thum.isEmpty)
        {
            
            
        }
        else{
            
            let imagedownload = DownloadImage()
            
            let docimage = imagedownload.userImage(imageurlString: thum)
            if(docimage != nil)
            {
                
                imgpro.image = docimage
            }
            else
            {
                self.imgpro.setImageFromURL(url: thum)
            }
        }
        
        
        
        //imgpro.image=#imageLiteral(resourceName: "weightloss")
    }
}



