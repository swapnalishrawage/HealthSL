//
//  MenucellCollectionViewCell.swift
//  Salado
//
//  Created by Rz on 18/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import FirebaseStorage
protocol MenucellCollectionViewCellDelegate{
    func stepperButton(sender: MenucellCollectionViewCell)
}
class MenucellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var btnadd: UIButton!
    @IBOutlet weak var lblrating: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var imgcategory: UIImageView!
    @IBOutlet weak var imgitem: UIImageView!
    var m:Int!
 
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    @IBAction func stepperClick(_ sender: UIStepper) {
//        
//        
//        
////        if delegate != nil {
////            delegate?.stepperButton(self)
////            stepperLabel.text = "x \(Int(countStepper.value))"
////            
////        }
//        lblprice.text="\(Int(stepper.value))"
//        m=Int(stepper.value)
//        
//       
//      
//        
//        
//    }
    @IBOutlet weak var stepperclick: UIStepper!
    @IBOutlet weak var lblnumberofitem: UILabel!
    @IBAction func addclick
        (_ sender: Any) {
        stepper.isHidden=false
        btnadd.isHidden=true
       // stepper.addTarget(self, action:#selector(MenuItemVC.clickonstepper, for:UIControlEvents.valueChanged)
        
        
        
        
    }
    func updatecell(image:String,name:String,price:String,Rating:String,stepper1:String,item:String)
    {
        lblname.text=name
        lblprice.text=price
        lblrating.text=Rating
        lblnumberofitem.text=item
 //stepper.isHidden=true
        if(stepper1=="F")
        {
           stepper.isHidden=false
        }
        else{
            stepper.isHidden=true
            btnadd.isHidden=false
        }
        btnadd.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
            .cgColor
      btnadd.layer.borderWidth=2
        btnadd.layer.cornerRadius=5
        
      stepper.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        
//          var pic:UIImage!
////        
////        
//        let storageRef = FIRStorage.storage().reference(forURL: image)
////        // Download the data, assuming a max size of 1MB (you can change this as necessary)
////        
//        storageRef.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
//            
//            
//            
//            // Do something with downloaded data...
//            
//            if (error != nil) {
//                print(error.debugDescription)
//            } else {
//                pic = UIImage(data: data!)
//                
//                let imageData:NSData = UIImagePNGRepresentation(pic)! as NSData
//                
//                self.imgitem.image=pic
//                print(pic)
//                
//                
//                let strBase64:String = imageData.base64EncodedString()//.base64EncodedData(options:)
//                
//                
//                
//                // var imageData = UIImageJPEGRepresentation(pic, 1)
//                //// var base64String = Base64Convertor.encodeBase64WithData(imageData)
//                //self.clist[row].thumbnailurl=strBase64
//            }
//        }
//        
        
        

        
//        let url=NSURL(fileURLWithPath: image)
//        
//        let data=NSData(contentsOf: url as URL)
//        if data != nil{
//            imgitem.image = UIImage(data: data as! Data)
//
//        }
//        else{
//            print("empty")
//        }
//        
        
        
        
     
        
        
        
       //work
        if(image.isEmpty)
        {
            
        }
        else{
            self.showActivityIndicator()
            let imagedownload = DownloadImage()
            
            let menuimage = imagedownload.userImage(imageurlString: image)
            if(menuimage != nil)
            {
              
               imgitem.image = menuimage
                self.hideActivityIndicator()
            }
            else
            {
                
              self.imgitem.setImageFromURL(url: image)
                self.hideActivityIndicator()
            }
            
        }

        
     
        
        
        
    }
    
    
    func showActivityIndicator() {
        
        // UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
       // DispatchQueue.main.async {
            
            
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0)
            self.loadingView.center = self.imgitem.center
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
            self.imgitem.addSubview(self.loadingView)
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

