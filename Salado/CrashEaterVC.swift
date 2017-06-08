//
//  CrashEaterVC.swift
//  Salado
//
//  Created by Rz on 18/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class CrashEaterVC: UIViewController {
    @IBOutlet weak var imgBF: UIImageView!
    @IBOutlet weak var collectionitems: UICollectionView!

    @IBOutlet weak var imgDinn: UIImageView!
    @IBOutlet weak var imgLch: UIImageView!
    
    private var   _programdetail:StartDiet!
    
  
    
   
    @IBAction func backclick(_ sender: Any) {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
        

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        navigationItem.backBarButtonItem?.title="< "
        
               let singleTap = UITapGestureRecognizer(target: self, action: #selector(CrashEaterVC.selectBF))
        singleTap.numberOfTapsRequired = 1 // you can change this value
       imgBF.isUserInteractionEnabled = true
        imgBF.addGestureRecognizer(singleTap)
        
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(CrashEaterVC.selectDinn))
        singleTap1.numberOfTapsRequired = 1
       imgDinn.isUserInteractionEnabled = true
        imgDinn.addGestureRecognizer(singleTap1)
//
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(CrashEaterVC.selectLuch))
        singleTap2.numberOfTapsRequired = 1
        imgLch.isUserInteractionEnabled = true
        imgLch.addGestureRecognizer(singleTap2)
        
               

    }
func selectBF()
{
    performSegue(withIdentifier: "squeitems", sender: nil)
    }
    func selectLuch()
    {
        performSegue(withIdentifier: "squeitems", sender: nil)
    }
    func selectDinn()
    {
        performSegue(withIdentifier: "squeitems", sender: nil)
    }
    
    
    
    //collection view delegation functions
   //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    
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
