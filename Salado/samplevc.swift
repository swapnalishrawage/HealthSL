//
//  samplevc.swift
//  Salado
//
//  Created by Rz on 06/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import ObjectMapper
import Firebase
import FirebaseDatabase
class samplevc: UIViewController {
var dataref: FIRDatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()

//       
        
        
        
        
        dataref=FIRDatabase.database().reference()
        
  
        dataref.child("DoctorAppintments").observeSingleEvent(of: .value, with: { (snapshot) in
            
            print(snapshot)
            
            
            
            
            
            
            if(snapshot.childrenCount==0)
            {
                //self.tbdocterlist.isHidden=true
                
            }
            else{
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                    print(snapshot.value!)
                    
                    
                    for child in snapDict{
                       // let ID = child.key
                        
                        print(child)
                        
                        
                        
                        
                        
                    }
                
                }
            }
        
        })
        
//        let res = Mapper<ThreadDetailModel>().map(JSONObject: dict)
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
