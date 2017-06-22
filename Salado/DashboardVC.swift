//
//  DashboardVC.swift
//  Salado
//
//  Created by Rz on 17/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    @IBOutlet weak var scrimg: UIImageView!
    var timer : Timer!
    var second = 0
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var btnback: UIBarButtonItem!
    @IBOutlet weak var scview: UIScrollView!
 
    @IBOutlet weak var imgmydiet: UIImageView!
    @IBOutlet weak var dietview: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var svdaruu: UIStackView!
    @IBOutlet weak var vscrash: UIStackView!
    @IBOutlet weak var svmonthlydiet: UIStackView!
    @IBOutlet weak var imgdaruchakhna: UIImageView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var imgcrasheater: UIImageView!
    @IBOutlet weak var imgmonthlydiet: UIImageView!
    var isSettingsOpen:Bool=false
    //var imgarr=[UIImage]()
    @IBAction func btnmenu(_ sender: Any) {
        
       didTapSetting()
    }
   var i=0
   var imgarr=[#imageLiteral(resourceName: "image1"),#imageLiteral(resourceName: "image2"),#imageLiteral(resourceName: "image3"),#imageLiteral(resourceName: "image4")]
    var index = 0
    let animationDuration: TimeInterval = 0.25
    let switchingInterval: TimeInterval = 3

    @IBOutlet weak var viewmenu: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scview.isScrollEnabled=false
               btnback.isEnabled=false
    navigationItem.title="Sallado"
        navigationItem.leftBarButtonItem?.title=" "
       // navigationController?.navigationItem.backBarButtonItem?.title="< Back"
//scrimg.image = imgarr[index+1]
       // animateImageView()
        
          scrimg.image = imgarr[i]
        timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(DashboardVC.calculateSeconds), userInfo: nil, repeats: true)
        if(i==4)
        {
            i=0
        }
//        let t=CATransform3DTranslate(CATransform3DIdentity, 250, 20, 0)
//        
//        scrimg.layer.transform=t
//        
//        UIView.animate(withDuration: 1.5, animations: {
//            
//            self.scrimg.alpha=1.0
//            self.scrimg.layer.transform=CATransform3DIdentity
//            
//        })

      
        
        
     
//        let singleTap0 = UITapGestureRecognizer(target: self, action: #selector(DashboardVC.scrollingimage))
//        singleTap0.numberOfTapsRequired = 1 // you can change this value
//        scrimg.isUserInteractionEnabled = true
//        scrimg.addGestureRecognizer(singleTap0)

        
        btnback.isEnabled=false
        
        viewmenu.isHidden=true
      
        view1.layer.borderWidth=2
        view1.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
view1.layer.cornerRadius=5
    
        
        
        
        
        view2.layer.borderWidth=2
        view2.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
    
        view2.layer.cornerRadius=5
        
        
        view3.layer.borderWidth=2
        view3.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        
        
        
        view3.layer.cornerRadius=5
        
        
        
        
       dietview.layer.borderWidth=2
         dietview.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        
         dietview.layer.cornerRadius=5
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(DashboardVC.selectMonthlyDiet))
        singleTap.numberOfTapsRequired = 1 // you can change this value
       imgmonthlydiet.isUserInteractionEnabled = true
        imgmonthlydiet.addGestureRecognizer(singleTap)
        
        
        
        
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(DashboardVC.selectcrashEaters))
        singleTap.numberOfTapsRequired = 1 // you can change this value
       imgcrasheater.isUserInteractionEnabled = true
       imgcrasheater.addGestureRecognizer(singleTap1)
        
        

        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(DashboardVC.selectDaaruChakhana))
        singleTap2.numberOfTapsRequired = 1 // you can change this value
       imgdaruchakhna.isUserInteractionEnabled = true
      imgdaruchakhna.addGestureRecognizer(singleTap2)
        
        
        
        
        
        let singleTap3 = UITapGestureRecognizer(target: self, action: #selector(DashboardVC.selectmydiet))
        singleTap3.numberOfTapsRequired = 1 // you can change this value
        imgmydiet.isUserInteractionEnabled = true
        imgmydiet.addGestureRecognizer(singleTap3)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        UIView.animate(withDuration: 3, animations: {
//            self.scrimg.alpha = 1.0
//           
//        })
        navigationItem.title="HEALTHY LIFESTYLE"
        btnback.isEnabled=false
           navigationItem.leftBarButtonItem?.title=" "
        
    }
    func calculateSeconds() {
        second += 1
        
        if(i==3)
        {
            i=0
        }
        let t=CATransform3DTranslate(CATransform3DIdentity, 200, 20, 0)
        
        scrimg.layer.transform=t
        
        UIView.animate(withDuration: 0.6, animations: {
            
            self.scrimg.alpha=1.0
            self.scrimg.layer.transform=CATransform3DIdentity
            
        })

            scrimg.image=imgarr[i+1]
        i=i+1
        
        
      
    }
    func scrollingimage()
    {
        
         scrimg.startAnimating()
        imgarr=[#imageLiteral(resourceName: "image1"),#imageLiteral(resourceName: "image2"),#imageLiteral(resourceName: "image3"),#imageLiteral(resourceName: "image4")]
        
        for i in 0...self.imgarr.count-1{
            //  scrimg.image=imgarr[i]
            scrimg.contentMode = .scaleToFill
            //var xpos=self.scview.frame.width*CGFloat(i)
            // scrimg.frame=CGRect(x: xpos, y: 0, width: self.scview.frame.width, height: self.scview.frame.height)
            
            self.scview.contentSize=CGSize(width: scrimg.bounds.width*CGFloat(i+1), height: scrimg.bounds.height)
            
            scrimg.image=imgarr[i]
            
            //scrimg.bounds.size
            //  self.scview.contentSize.width = scview.frame.width*CGFloat(i+1)
            //self.view.frame.width*CGFloat(i+1)
            
            //  scview.autoresizingMask=UIViewAutoresizing.flexibleWidth
            // scview.addSubview(scrimg)
            scview.isScrollEnabled=true
            
        }
        

    }
    func selectMonthlyDiet() {
        
       // self.dismiss(animated: true, completion: {})
        
        
        
        performSegue(withIdentifier: "squemonthlydiet", sender: nil)
        
        
    }
    func selectcrashEaters()
    {
         UserDefaults.standard.set("CE", forKey: "Page")
        performSegue(withIdentifier: "squedaaruchakna", sender: nil)
       // performSegue(withIdentifier: "squecrasheater", sender: nil)
        
    }
    func selectDaaruChakhana()
    {
        
        UserDefaults.standard.set("DC", forKey: "Page")
        performSegue(withIdentifier: "squedaaruchakna", sender: nil)
    }
    
    func selectmydiet()
    {
        performSegue(withIdentifier: "squemydietplan", sender: nil)
    }
    func setBorder(img:UIImageView)
    {
        img.layer.borderColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1).cgColor
        img.layer.cornerRadius=5
        img.layer.borderWidth=2

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func didTapSetting(){
        
        if(isSettingsOpen == false){
            viewmenu.isHidden = false
            isSettingsOpen = true
        }
        else{
            viewmenu.isHidden = true
            isSettingsOpen = false
        }
    }
    
    
    
    
    @IBAction func myaccountclick(_ sender: Any) {
        performSegue(withIdentifier: "squemyacccount", sender: nil)
    }
    @IBAction func Myorderclick(_ sender: Any) {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "MyorderVC") as! MyorderVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
    }
    
    @IBAction func aboutclick(_ sender: Any) {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        //let frontview=UINavigationController.init(rootViewController:des)
        
        self.navigationController?.pushViewController(des, animated: true)
       
    }
    func animateImageView() {
        CATransaction.begin()
        
        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setCompletionBlock {
            
            
            
//            let delay = DispatchTime.now(dispatch_time_t(DispatchTime.now()), Int64(self.switchingInterval * TimeInterval(NSEC_PER_SEC)))
//            dispatch_after(delay, DispatchQueue.main) {
//                self.animateImageView()
//            }
        }
        
        let transition = CATransition()
        transition.type = kCATransitionFade
      
       scrimg.layer.add(transition, forKey: kCATransition)
          scrimg.image = imgarr[index]
        
        CATransaction.commit()
        
        index = index < imgarr.count - 1 ? index + 1 : 0
    }

    @IBAction func logoutclick(_ sender: Any) {
        let appDomain = Bundle.main.bundleIdentifier
        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
        print("session end")

        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //let frontview=UINavigationController.init(rootViewController:des)
        
        self.navigationController?.pushViewController(des, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title="HEALTHY LIFESTYLE"
        viewmenu.isHidden=true
          btnback.isEnabled=false
          //navigationItem.leftBarButtonItem?.title="< Back"
       // navigationController?.navigationItem.backBarButtonItem?.title="< Back"
        
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
extension UIImageView{
    func setImageFromURL(url:String){
        if let url=NSURL(string: url){
            if let data=NSData(contentsOf: url as URL){
                self.image=UIImage(data: data as Data)
            }
        }
        
    }
}
