//
//  MonthlydietClickVC.swift
//  Salado
//
//  Created by Rz on 17/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class MonthlydietClickVC: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var imgdietitian: UIImageView!
    @IBOutlet weak var imgayurved: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
               navigationItem.title="DIET PROGRAMS"
        view1.layer.borderWidth=2
        view1.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        
        
        
        view2.layer.cornerRadius=5
        
        
        view2.layer.borderWidth=2
        view2.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        
        
        
        view2.layer.cornerRadius=5
        
        
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(MonthlydietClickVC.selectAyurveda))
        singleTap.numberOfTapsRequired = 1 // you can change this value
        imgayurved.isUserInteractionEnabled = true
        imgayurved.addGestureRecognizer(singleTap)
        

        
        
        
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(MonthlydietClickVC.selectDietitian))
        singleTap.numberOfTapsRequired = 1 // you can change this value
        imgdietitian.isUserInteractionEnabled = true
        imgdietitian.addGestureRecognizer(singleTap1)
        
        
    }
    @IBAction func backclick(_ sender: Any) {
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
    }
    func selectAyurveda()
    {
        UserDefaults.standard.set("A", forKey: "TYPE")
        performSegue(withIdentifier: "squelistdocter", sender: nil)
    }
    func selectDietitian()
    {
        UserDefaults.standard.set("D", forKey: "TYPE")
        performSegue(withIdentifier: "squelistdocter", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func BackClick(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
        

        
    
    }
    
    @IBAction func clickstartmonthlydiet(_ sender: Any) {
        
        performSegue(withIdentifier: "squestartdiet", sender: nil)
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
