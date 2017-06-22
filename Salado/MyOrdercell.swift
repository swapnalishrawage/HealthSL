//
//  MyOrdercell.swift
//  Salado
//
//  Created by Rz on 21/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class MyOrdercell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var btnreorder: UIButton!
    @IBOutlet weak var btnviewdetail: UIButton!
    @IBOutlet weak var lblnamequantity: UILabel!
    @IBOutlet weak var lbldttime: UILabel!
    @IBOutlet weak var lblprice: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updatecell(name:String,price:String,timedate:String)
    {
        
        view1.layer.cornerRadius=5
        view1.layer.borderWidth=2
        view1.layer.borderColor=UIColor.gray.cgColor
        lblprice.text=price
        lblnamequantity.text=name
       // lbldttime.text=timedate
        
        
    let dt=timedate.components(separatedBy: " ")[0]
        print(dt)
        
        let tm=timedate.components(separatedBy: " ")[1]
        let tm1=timedate.components(separatedBy: " ")[2]
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd/MM/yyyy"
        let dateformatter1 = DateFormatter()
        dateformatter1.dateFormat = "dd MMM"
       // let d:String=dateformatter.string(from: date)
        
        
//        dateformatter.amSymbol="AM"
//        dateformatter.pmSymbol="PM"
       // dateformatter.dateFormat="dd MMM yyyy"
       
        let m=dateformatter.date(from:dt)
        let v=dateformatter1.string(from: m!)
        //print(m!)
        
        lbldttime.text=v+" "+tm+" "+tm1
    }

}
