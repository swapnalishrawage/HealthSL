//
//  ordereditemcell.swift
//  Salado
//
//  Created by Rz on 21/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class ordereditemcell: UITableViewCell {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var view1: UIView!
       @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var imgcategory: UIImageView!
    @IBOutlet weak var imgfood: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//    @IBAction func stepperClick(_ sender: Any) {
//        
//      
//        var m=Int((lblprice.text)!)
//        var m1=Int(stepper.value)
//        
//        //var  m = Int(lblprice.text!)!*Int(stepper.value)
//        lblprice.text="Rs. \(Int(stepper.value))"
//        
//    }

    @IBOutlet weak var lblcount: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updatecell(name:String,price:String,image:String,imgCategory:String,count:String)
    {
        
        view1.layer.borderWidth=2
        view1.layer.borderColor=UIColor.gray.cgColor
        
        lblname.text=name
        lblprice.text=price
        
        lblcount.text=count
        
        
        if(image.isEmpty)
        {
            
            
        }
        else{
            
            let imagedownload = DownloadImage()
            
            let image1 = imagedownload.userImage(imageurlString: image)
            if(image1 != nil)
            {
                
                imgfood.image = image1
            }
            else
            {
                
            }

        
    }
          self.imgfood.setImageFromURL(url: image)
    }
    

}
