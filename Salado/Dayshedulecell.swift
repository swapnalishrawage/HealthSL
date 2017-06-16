//
//  Dayshedulecell.swift
//  Salado
//
//  Created by Rz on 14/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class Dayshedulecell: UITableViewCell {

    @IBOutlet weak var btnchange: UIButton!
    @IBOutlet weak var lbldesc: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var imgdish: UIImageView!
    @IBOutlet weak var view1: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updatecell(image:String,name:String,desc:String,CU:String,dat:String)
    {
        
        let date = Date()
        print(date)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd/MM/yyyy"
        let d:String=dateformatter.string(from: date)
        
        btnchange.layer.cornerRadius=5
        lblname.text=name
        lbldesc.text=desc
        
        
        
        
        if(CU=="c")
        {
            btnchange.isHidden=true
            
        }else if(CU=="uc"){
       
            
            
            if(dat==d){
        var n1:String=name.components(separatedBy: ":")[0]
        
        let hour = Calendar.current.component(.hour, from: Date())
         let min = Calendar.current.component(.minute, from: Date())
        print(hour)
        if (hour<=7 && (n1=="Breakfast" || n1=="Lunch" || n1=="Dinner" || n1=="Snack")){
    if(min>0 && hour==7)
    {
        btnchange.isHidden=true
            }
    else{
        btnchange.isHidden=false
            }
                        print("Breakfast time")
        }
        else if(hour>7 && hour<=11 && (n1=="Lunch" || n1=="Dinner" || n1=="Snack"))
        {
            
            
            if(min>0 && hour==11)
            {
                btnchange.isHidden=true
            }
            else{
                btnchange.isHidden=false
            }
            
           print("Lunch time")
        }
        else if(hour>11 && hour<=14 && (n1=="Snack" || n1=="Dinner") )
        {
           
            
            if(min>0 && hour==14)
            {
                btnchange.isHidden=false
            }
            else{
                btnchange.isHidden=true
            }
            print("snack time")
            
        }
        else if(hour>14 && hour<=17 && n1=="Dinner")
        {
            
            
            if(min>0 && hour==17)
            {
                btnchange.isHidden=true
            }
            else{
                btnchange.isHidden=false
            }
            
            print("dinner time")
        }
           else{
            
            btnchange.isHidden=true
            print("hideall")
            }
    }
    else{
                btnchange.isHidden=false
        }
    }
//        if hour >= 7 && hour < 12 {
//            print("Good Morning")
//        } else if hour >= 12 && hour < 17 {
//            print("Good Afternoon")
//        } else if hour >= 17 {
//            print("Good Evening")
//        }
        
        
        if(image.isEmpty)
        {
            
            
        }
        else{
            
            let imagedownload = DownloadImage()
            
            let image1 = imagedownload.userImage(imageurlString: image)
            if(image1 != nil)
            {
                
                imgdish.image = image1
            }
            else
            {
             self.imgdish.setImageFromURL(url: image)
            }
            
            
        }

    }

}
