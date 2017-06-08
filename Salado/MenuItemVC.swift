//
//  MenuItemVC.swift
//  Salado
//
//  Created by Rz on 19/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MenuItemVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate  {
    @IBOutlet weak var lbltest: UILabel!
    @IBOutlet weak var lblitemcount: UILabel!
    @IBOutlet weak var lblrate: UILabel!
 //var menu=[Menu]()
    var price1=[Int]()
    var stepperhidden:Bool=true
    var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    var loadingView: UIView = UIView()
var dishdata=[DishData]()
    var d=[Dish]()
    var dataref: FIRDatabaseReference!
var order=[OrderedFood]()
  var orderfood=[OrderFood]()
    var steppervalue:Double=0.0
    var _dishContent:String!
    var _dishDescription:String!
    var _dishId:String!
    var _dishIngredients:String!
    var _dishName:String!
    var _dishPrice:String!
    var _dishRatings:String!
    var _dishThumbnail:String!
    var _dishType:String!
    var _foodPreparationTime:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

             self.navigationItem.title="MENU"  
        
d.removeAll()
       self.showActivityIndicator()
        
     
   
        
        
        
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
    
    }
    override func viewWillAppear(_ animated: Bool) {
       //showActivityIndicator()
//
        retrivedishes()
    }
    @IBOutlet weak var clview: UICollectionView!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backclick(_ sender: Any) {
        
        let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
        let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        
        
        
        
        self.navigationController?.pushViewController(des, animated: true)
        

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MenucellCollectionViewCell", for: indexPath as IndexPath) as? MenucellCollectionViewCell {
            
      
            let m=d[indexPath.row]
            
            cell.layer.borderColor=UIColor.gray.cgColor
            cell.layer.borderWidth=2
            if(m._dishType=="NonVeg")
            {
               cell.imgcategory.image=#imageLiteral(resourceName: "nonveg")
            }
            else{
                cell.imgcategory.image=#imageLiteral(resourceName: "veg")
            }
            
            
            cell.stepper.addTarget(self, action: #selector(MenuItemVC.clickonstepper(sender:)), for: .valueChanged)
           let s:String="T"

            cell.updatecell(image: m._dishThumbnail, name:m._dishName , price:"Rs. "+m._dishPrice, Rating:m._dishRatings,stepper1:s,item:String(Int(cell.stepper.value)))


            return cell
        }
        

        
        
       
        return UICollectionViewCell()
        
        
    }
    
    func clickonstepper(sender:UIStepper)
    {
        
        
        
      
        let pos = sender.convert(CGPoint.zero, to: clview)
        let indexPath = clview.indexPathForItem(at: pos)!
        let cell: MenucellCollectionViewCell = clview.cellForItem(at: indexPath) as! MenucellCollectionViewCell
        let m=d[indexPath.row]
       // let rate=cell.lblprice.text
            let value = String(Int(cell.stepper.value))

 
    cell.stepper.isHidden=false
        
       
        
//        let t = NSString(string: cell.lblprice.text!).doubleValue
       
        let m1=Int(cell.stepper.value) as Int
    
         cell.lblnumberofitem.text=String(Int(cell.stepper.value))
      
        let intrate:Int=Int(d[indexPath.row]._dishPrice)!
        
        
        
        
        
        var disid:Bool=false
        let price=intrate*m1
   
        
        
        
        if(dishdata.count>0){
            
            for i in 0...dishdata.count-1{
                if(dishdata[i].dishid==m._dishId){
                
                disid=true
                
                }
            
            
            }
            
            for i in 0...dishdata.count-1{
                
                
                if(disid==true ){
                    if(dishdata[i].dishid==m._dishId){
                    dishdata[i].quantity=m1
                    dishdata[i].price=price
                        
                    }
                    
                }
                else if(disid==false){
                    if(dishdata[i].dishid != m._dishId){
                    self.dishdata.append(DishData(DishID: m._dishId, Quantity: m1, Price:price))
                        disid=true
                    }
                }
            }

        }
        else{
            self.dishdata.append(DishData(DishID: m._dishId, Quantity: m1, Price:price))
        }
        
        
       
        
        
        
        
        var total:Int=0
        for i in 0...dishdata.count-1{
            total=total+dishdata[i].price
        }
        
//        var p1=0
// 
//      if(price1.count==0)
//      {
//        price1.insert(price, at: 0)
//        }
//        
//       else  
//        if(price1.count==1){
//        
//        price=price1[0]+price
//            price1.insert(price, at: 0)
//        }
        
       
        lblitemcount.text="\(value) Item in cart"
        lblrate.text="₹ \(String(total))"
                       print("stepper click inside viewcontroller")
      
        
        var already:Bool=false
        var count:String!
        
        if(cell.stepper.value>0)
        {
            //cell.stepper.isHidden=false
            if(order.count>0)
            {
            for i in 0...order.count-1{
                if(order[i]._dishId==m._dishId)
                {
                    already=true
                }
                
            }
            }
            
            if(already==true)
            {
                
                
                
                
                for i in 0...order.count-1{
                    if(order[i]._dishId==m._dishId){
                        
                        count=value
                        order[i]._dishQuantity=count
                        // dishdata[i].price=price
                        
                    }

                }
                
            }else if(already==false){
               
                if(dishdata.count>0){
                for i in 0...dishdata.count-1{
                    
                    if(disid==true ){
                        if(dishdata[i].dishid==m._dishId){
                            
                           count=value
                            
                            print(count)
                          
                            
                            //String(dishdata[i].quantity)
                           // dishdata[i].price=price
                            
                        }
                        
                    }
                }
                }
//                if(disid==false){
//                    value="0"
//                    }
//                }
//                else{
//                    value="0"
//                }
                print(value)
            order.append(OrderedFood(_dishid: m._dishId, _dishQuantity: value,_dishname: m._dishName, _dishimage: m._dishThumbnail,_price:m._dishPrice,_dishtype:m._dishType))
            }
           
            
          //  orderfood.append(OrderFood(_orderDate: "", _orderId: "", _orderLastUpdate: "", _orderStatus: "ordered", _orderTax: "60", _orderTotalPrice: m._dishPrice, _orderedFood: order, _userID: ""))
        }
        UserDefaults.standard.set("\(lblrate.text!)", forKey: "TotalPrice")
        
        cell.stepper.isHidden=false
        stepperhidden=false
        
    }
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return d.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination=segue.destination as? orderDetail{
            if let doc=sender as?  [OrderedFood]{
                
                print(doc)
               destination.OrderMenu=doc
                
                print("new")
            }
        }
    }
    

    @IBAction func orderclick(_ sender: Any) {
        
       // orderfoodinsertion()
        
        
print(order)
      //  var m:String=lblrate.text!
        //var t=m.components(separatedBy: " ")[1]
       // var amout:Int=Int(t)!
        if(order.count==0)
        {
            let passwordcheck = UIAlertController(title: "Order", message: "Please select atleastone item ", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            present(passwordcheck, animated: true, completion: {  })
            
        }
//        else if (amout==0){
//            
//            
//        }
        else{
            
            performSegue(withIdentifier: "squeorderclick", sender: order)
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MenucellCollectionViewCell", for: indexPath as IndexPath) as? MenucellCollectionViewCell {
        
        print(cell.stepper.value)
        
        }
        
    }
    
    func orderfoodinsertion()
    {
        dataref=FIRDatabase.database().reference()
        
     
        let date = Date()
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yyyy HH:mm:ss"
        let d:String=dateformatter.string(from: date)
        
        
        
        dateformatter.dateFormat="dd/MM/yyyy"
        print(d)

       let orderid=NSUUID().uuidString
        let orderfooddata:[String:AnyObject]=["orderDate":"" as AnyObject ,"orderId":orderid as AnyObject ,"orderLastUpdate":"" as AnyObject  ,"orderStatus":orderfood[0]._orderStatus as AnyObject  ,"orderTax":orderfood[0]._orderTax as AnyObject,"orderTotalPrice":orderfood[0]._orderTotalPrice as AnyObject, "orderedFood":orderfood[0]._orderedFood as AnyObject ,"userID":"" as AnyObject]

        
        dataref.child("OrderFood").childByAutoId().setValue(orderfooddata)

        orderfood.removeAll()
        
        
        
        
        
    }
    func retrivedishes()
    {
     //  self.showActivityIndicator()
//  if(spinner.isAnimating==false)
//  {
//    showActivityIndicator()
//  }
    
        dataref=FIRDatabase.database().reference()
        
       dataref.child("Dish").observeSingleEvent(of: .value, with: { (snapshot) in
            
  
            
            
            
            if(snapshot.childrenCount==0)
            {
                
            }
            else{
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                    
                    for child in snapDict{
                        //var ID = child.key as! String
                        //let shotKey = snapshot.children.nextObject() as! NSObject
             
                        
                        
                        
                        if let  value=child.value as? [String:AnyObject]{
                            
                            if let dishdata = value["dishContent"]  as? String{
                                
                                
                             
                                
                                self._dishContent=dishdata

        
                            }
                        
                            if let dishdata = value["dishDescription"]  as? String{
                                
                                
                               
                                
                                self._dishDescription=dishdata
                                
                                
                            }
                        
                            if let dishId = value["dishId"]  as? String{
                                
                                
                          
                                
                                self._dishId=dishId
                                
                                
                            }
                        
                            if let dishIngredients = value["dishIngredients"] as? String{
                                
                                
                          
                                
                                self._dishIngredients=String(describing: dishIngredients)
                                
                                
                            }
                        
                            if let dishName = value["dishName"]  as? String{
                                
                                
                        
                                
                                self._dishName=dishName
                                
                                
                            }
                            if let dishdata = value["dishPrice"]  as? String{
                                
                                
                              
                                self._dishPrice=dishdata
                                
                                
                            }
                            if let dishdata = value["dishRatings"]  as? String{
                                
                                
                          
                                
                                self._dishRatings=dishdata
                                
                                
                            }
                            if let dishdata = value["dishThumbnail"]  as? String{
                                
                                
                            
                                
                                self._dishThumbnail=dishdata
                                
                                
                            }
                            if let dishdata = value["dishType"]  as? String{
                                
                                
                                
                                self._dishType=dishdata
                                
                                
                            }
                            if let dishdata = value["foodPreparationTime"]  as? String{
                                
                                
                            
                                
                                self._foodPreparationTime=dishdata
                                
                                
                            }

                            let dish1=Dish(_dContent: self._dishContent, _dDescription: self._dishDescription, _dId: self._dishId, _dIngredients:" ", _dName: self._dishName, _dRating: self._dishRatings, _dPrice: self._dishPrice, _dThumbnail: self._dishThumbnail, _dType: self._dishType, _fPreparationTime: self._foodPreparationTime)
                            
                            
                            self.d.append(dish1)
                            
                            

                        
                        
                        
                        }
                        
                        
                        
                    }
                    
                      self.hideActivityIndicator()
                }
                
                
                
                self.clview.delegate=self
                self.clview.dataSource=self
                self.clview.reloadData()
              
            }
        })
        
                        
                        
    }
    
    
    
    
    func showActivityIndicator() {
        
        
        
       // DispatchQueue.main.async {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
            self.loadingView.alpha = 0.7
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10
            
            self.spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
            
            self.loadingView.addSubview(self.spinner)
            self.view.addSubview(self.loadingView)
            self.spinner.startAnimating()
            
        //}
        
    }
    func hideActivityIndicator() {
        
       // DispatchQueue.main.async {
        loadingView.backgroundColor=UIColor.clear
            self.spinner.stopAnimating()
            self.loadingView.removeFromSuperview()
        //}
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
