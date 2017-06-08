//
//  startdietcell.swift
//  Salado
//
//  Created by Rz on 24/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class startdietcell: UITableViewCell {

    @IBOutlet weak var imgpro: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var btndetail: UIButton!
    @IBOutlet weak var btnbook: UIButton!
    @IBOutlet weak var lblamount: UILabel!
    @IBOutlet weak var lblrating: UILabel!
    @IBOutlet weak var imgthumb: UIImageView!
    @IBOutlet weak var lblprograminclude: UILabel!
    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func updatecell(name:String,amount:String,rating:String,thum:String,programinclude:String)
    {
        
        
        lblname.text=name
        lblamount.text=amount
         lblrating.text=rating
        lblprograminclude.text=programinclude
        
        
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
            }
        }
        
        
        
     //imgpro.image=#imageLiteral(resourceName: "weightloss")
    }
}
