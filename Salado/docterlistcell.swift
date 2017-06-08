//
//  docterlistcell.swift
//  Salado
//
//  Created by Rz on 18/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class docterlistcell: UITableViewCell {
    @IBOutlet weak var lblprice: UILabel!

    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var lblclinic: UILabel!
    @IBOutlet weak var lblplace: UILabel!
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var imgdodocter: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cellcontains(name:String,place:String,price:String,time:String,Clinik:String,image:String,doctype:String)
    {
        view1.layer.borderColor=UIColor.gray.cgColor
        view1.layer.borderWidth=2
        lblname.text=name
        lbltime.text=time
        lblplace.text=place
        lblclinic.text=Clinik
        lblprice.text=price
        
        if(image.isEmpty)
        {
            
            
        }
        else{
            showActivityIndicator()
            let imagedownload = DownloadImage()
            
            let docimage = imagedownload.userImage(imageurlString: image)
            if(docimage != nil)
            {
                // senderimage.layer.borderColor = UIColor.gray.cgColor
                //senderimage.layer.cornerRadius = 25.7
                //senderimage.layer.masksToBounds = true
                imgdodocter.image = docimage
                hideActivityIndicator()
            }
            else
            {
                
                
//                imgdodocter.setImageFromURL(url: image)
//                hideActivityIndicator()
                
                
            }
            
        }

        
        
        
    }
    
    
    
    func showActivityIndicator() {
        
        // UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        // DispatchQueue.main.async {
        
        
        self.loadingView = UIView()
        self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0)
        self.loadingView.center = self.imgdodocter.center
        //self.loadingView.backgroundColor = UIColor.white
        self.loadingView.alpha = 0.7
        self.loadingView.clipsToBounds = true
        self.loadingView.layer.cornerRadius = 10
        
        
        let actInd = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        actInd.color = UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
        self.spinner = actInd
        self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 20.0, height:20.0)
        self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
        
        self.loadingView.addSubview(self.spinner)
        self.imgdodocter.addSubview(self.loadingView)
        self.spinner.startAnimating()
        
        // }
        
    }
    
    
    
    func hideActivityIndicator() {
        
        loadingView.isHidden=true
        //        DispatchQueue.main.async {
        self.spinner.stopAnimating()
        self.loadingView.removeFromSuperview()
        //}
    }


}
