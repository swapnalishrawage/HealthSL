//
//  DaylistCell.swift
//  Salado
//
//  Created by Rz on 14/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class DaylistCell: UITableViewCell {
    @IBOutlet weak var lblhide: UILabel!

    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var btnday: UIButton!
    @IBOutlet weak var lbldescription: UILabel!
    @IBOutlet weak var lblday: UILabel!
    @IBOutlet weak var imgday: UIImageView!
    @IBOutlet weak var view1: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    func updatecell(image:String,Day:String,Desc:String,date1:String)
    {
        //lblhide.isHidden=true
        lbldate.text=date1
        btnday.isEnabled=false
        btnday.layer.shadowColor=UIColor.lightGray.cgColor
        btnday.setTitle(Day, for: UIControlState.normal)
        btnday.layer.cornerRadius=5
        view1.layer.cornerRadius=5
        lblday.text=Day
        lbldescription.text=Desc
        imgday.isHidden=false
        
        
        
        
        let date = Date()
        print(date)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd/MM/yyyy"
        let d:String=dateformatter.string(from: date)
        
        
        dateformatter.amSymbol="AM"
        dateformatter.pmSymbol="PM"
        dateformatter.dateFormat="dd/MM/yyyy"
        print(d)
       let m=dateformatter.date(from: date1)
        var j:String=date1.components(separatedBy: "/")[0]
        if(j=="30" || j>"30")
        {
            
        }
        else{
     //   print(m!)
        if((m!) != nil){
            
        
       
       if date.compare(m!) == ComparisonResult.orderedDescending {
        imgday.image = UIImage.fontAwesomeIcon(name:.check, textColor: UIColor.blue, size: CGSize(width: 35, height: 35))
            imgday.isHidden=false
       UserDefaults.standard.set("c", forKey: "img")
        if(d==date1)
        {
            //imgday.image = UIImage()
            //imgday.isHidden=true
            imgday.image = UIImage.fontAwesomeIcon(name:.check, textColor: UIColor.white, size: CGSize(width: 35, height: 35))
            
                UserDefaults.standard.set("uc", forKey: "img")
  
        }
            print("myDate is earlier than currentDate")
        }
        else{
        //imgday.image = UIImage()
         imgday.image = UIImage.fontAwesomeIcon(name:.check, textColor: UIColor.white, size: CGSize(width: 35, height: 35))
        UserDefaults.standard.set("uc", forKey: "img")
           // imgday.isHidden=true
       
           print("next")
        }
    }
    print(date.compare(m!))
        }
    }
    
}
