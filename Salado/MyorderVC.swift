//
//  MyorderVC.swift
//  Salado
//
//  Created by Rz on 21/06/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MyorderVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dataref: FIRDatabaseReference!

    var _orderDate:String!
    var _orderId:String!
    var _orderLastUpdate:String!
    var _orderStatus:String!
    var _orderTax:String!
    
    var _orderTotalPrice:String!
    
    var _dishName:String!
    var _dishQuantity:String!
    var _dishId:String!
    var _img:String!
    var _price:String!
    var _dishtype1:String!
    
    //dish data
    
    var d=[Dish]()
    
    var pg:String=UserDefaults.standard.value(forKey: "BackClick") as! String
    var _dishContent:String!
    var _dishDescription:String!
    var _dishId1:String!
    var _dishIngredients:String!
    var _dishName1:String!
    var _dishPrice:String!
    var _dishRatings:String!
    var _dishThumbnail:String!
    var _dishType:String!
    var _foodPreparationTime:String!

    @IBOutlet weak var tborder: UITableView!
    var orderfood = [OrderFood]()
    var orderedfood=[OrderedFood]()
    var orderset=[OrderedFood]()
      var ordersend=[OrderedFood]()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        UserDefaults.standard.set("0", forKey: "Move")
        
        
        
       // retriveorederdataofuser()
         retrivedishes()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    //tableview delegation
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderfood.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "MyOrdercell", for: indexPath) as? MyOrdercell{
            var m=orderfood[indexPath.row]
            
            
            print(m._orderLastUpdate)
           //"₹ 400"
            
            if(m._orderTotalPrice.contains("₹")==false)
            {
                m._orderTotalPrice="₹ \(m._orderTotalPrice)"
            }
            cell.updatecell(name: m._orderfoodname, price:m._orderTotalPrice , timedate: m._orderLastUpdate)
            
             cell.btnviewdetail.addTarget(self, action: #selector(MyorderVC.clickbtnviewdetail(sender:)), for: .allEvents)
            
            
            cell.btnreorder.addTarget(self, action: #selector(MyorderVC.btnreorder(sender:)), for: .allEvents)
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    func retriveorderid(id:String)
    {
        
        dataref=FIRDatabase.database().reference()
        
        
        dataref.child("OrderFood").queryOrdered(byChild: "orderId").queryEqual(toValue:id).observeSingleEvent(of: .value, with: { snapshot in
            print(snapshot)
            if snapshot.exists()
            {
                print("Data")
            }
        })

        
    }
    func clickbtnviewdetail(sender:UIButton)
     {
        
        
        
        UserDefaults.standard.set("VD", forKey: "Click")//        if((UserDefaults.standard.array(forKey: "history")) != nil){
//            let historyWords = (UserDefaults.standard.array(forKey: "history") as? [OrderedFood])!
//            print(historyWords)
//        }
        
       
        let pos = sender.convert(CGPoint.zero, to: tborder)
        let indexPath = tborder.indexPathForRow(at: pos)
        let cell: MyOrdercell=tborder.cellForRow(at: indexPath!) as! MyOrdercell
        
        let m=orderfood[(indexPath?.row)!]
        print(m._orderId)
        self.ordersend.removeAll()
        
        for i in 0...self.orderset.count-1
        {
            if(m._orderId==orderset[i]._orderid)
            {
//               orderset[i]._dishId
//                orderset[i]._dishimage
//                orderset[i]._dishtype
//                orderset[i]._dishQuantity
                print(orderset[i])
                ordersend.append(OrderedFood(_dishid: orderset[i]._dishId, _dishQuantity: orderset[i]._dishQuantity, _dishname: orderset[i]._dishname, _dishimage: orderset[i]._dishimage, _price: orderset[i]._price, _dishtype: orderset[i]._dishtype, orderId: orderset[i]._orderid))
               
                
                
            }
        }
        
        print(ordersend.count)
        
        
        if((UserDefaults.standard.value(forKey: "Move")) as! String == "0" ){
           performSegue(withIdentifier: "squeorderclick1", sender: self.ordersend)
        }
       else if((UserDefaults.standard.value(forKey: "Move")) as! String == "1")
        {
            
        }
        
        
        
        
        print("viewdetail")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination=segue.destination as? orderDetail{
            if let doc=sender as?  [OrderedFood]{
                
                
            
                
                destination.OrderMenu=doc
                
                print("new")
            }
        }

    }
    func btnreorder(sender:UIButton)
    {
        UserDefaults.standard.set("RO", forKey: "Click")//
        
        let pos = sender.convert(CGPoint.zero, to: tborder)
        let indexPath = tborder.indexPathForRow(at: pos)
        let cell: MyOrdercell=tborder.cellForRow(at: indexPath!) as! MyOrdercell
        
        let m=orderfood[(indexPath?.row)!]
        print(m._orderId)
        self.ordersend.removeAll()
        
        for i in 0...self.orderset.count-1
        {
            if(m._orderId==orderset[i]._orderid)
            {
               
                print(orderset[i])
                ordersend.append(OrderedFood(_dishid: orderset[i]._dishId, _dishQuantity: orderset[i]._dishQuantity, _dishname: orderset[i]._dishname, _dishimage: orderset[i]._dishimage, _price: orderset[i]._price, _dishtype: orderset[i]._dishtype, orderId: orderset[i]._orderid))
                
                
                
            }
        }
        
        print(ordersend.count)
        
        
        if((UserDefaults.standard.value(forKey: "Move")) as! String == "0" ){
            performSegue(withIdentifier: "squeorderclick1", sender: self.ordersend)
        }
        else if((UserDefaults.standard.value(forKey: "Move")) as! String == "1")
        {
            
        }
        
        
        print("reorder")
    }
    func retriveorederdataofuser()
    {
        let uid:String = UserDefaults.standard.value(forKey: "KEY") as! String
        
        dataref=FIRDatabase.database().reference()

        
        dataref.child("OrderFood").queryOrdered(byChild: "userID").queryEqual(toValue:uid).observeSingleEvent(of: .value, with: { snapshot in
            print(snapshot)
            if snapshot.exists()
            {
                print(snapshot.value!)
                if let snapDict = snapshot.value as? [String:AnyObject] {
                    
                    for child in snapDict{
                        var id=child.key as String
                        if let orderdate = child.value as? [String:AnyObject]{
                            
                            self._orderDate = orderdate["orderDate"] as! String!
                            
                            
                            
                        }
                        
                        if let orderLastUpdate = child.value as? [String:AnyObject]{
                            
                self._orderLastUpdate = orderLastUpdate["orderLastUpdate"] as! String!
                            
                            
                            
                        }
                        if let orderedprice = child.value as? [String:AnyObject]{
                            
                self._orderTotalPrice = orderedprice["orderTotalPrice"] as! String!
                            
                            
                            
                        }
                        if let orderId = child.value as? [String:AnyObject]{
                            
                            self._orderId = orderId["orderId"] as! String!
                            
                            
                            
                        }
                        
                        
                        
                        if let orderedFood = child.value as? [String:AnyObject]{
                            
                            
                            if let orderedFood1 = orderedFood["orderedFood"]{
                                
                                print(orderedFood1.count)
                                print(snapshot.childSnapshot(forPath: id).childSnapshot(forPath: "orderedFood"))
                                
                                for i in 0...orderedFood1.count-1{
                                    
                                    
                                    
                                    
                                    
                                    let mc:String=(String(i))
                                    print(mc)
                                    
                                    //
                                    var m:String!
                                    
                                    
                                    let mk=self.nullToNil(value: snapshot.childSnapshot(forPath:id).childSnapshot(forPath:"orderedFood").childSnapshot(forPath: String(mc)).value as AnyObject?)
                                    
                                    if(mk != nil){
                                        //j=mk as! String
                                    }
                                    else{
                                        // j=""
                                    }
                                    
                                    if(mk==nil){
                                        let mp:Int=Int(mc)!+1
                                        
                                        m=String(mp)
                                        
                                    }
                                    else
                                    {
                                        m=(String(i))
                                    }
                                    
                                    
                                    
                                    
                                    
let m0=self.nullToNil(value: snapshot.childSnapshot(forPath:id).childSnapshot(forPath:"orderedFood").childSnapshot(forPath: String(m)).childSnapshot(forPath: "dishName").value as AnyObject?)
                                    
                                    if(m0 != nil){
                                      self._dishName=m0 as! String
                                    }
                                    else{
                                        self._dishName=""
                                    }
                               print(  self._dishName)
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    let m1=self.nullToNil(value: snapshot.childSnapshot(forPath:id).childSnapshot(forPath:"orderedFood").childSnapshot(forPath: String(m)).childSnapshot(forPath: "dishQuantity").value as AnyObject?)
                                    
                                    if(m1 != nil){
                                        self._dishQuantity=m1 as! String
                                    }
                                    else{
                                        self._dishQuantity=""
                                    }
                                    
                                    
                                    
                                    
                                    let m2=self.nullToNil(value: snapshot.childSnapshot(forPath:id).childSnapshot(forPath:"orderedFood").childSnapshot(forPath: String(m)).childSnapshot(forPath: "dishId").value as AnyObject?)
                                    
                                    if(m2 != nil){
                                        self._dishId=m2 as! String
                                    }
                                    else{
                                        self._dishId=""
                                    }
                                    
                                    
                                    
                                    print(self._dishId)
                                    print(self._dishQuantity)
                                    
                                    
                                    
                                    
                                    if(mk==nil){
                                     
                                        
                                    }
                                    else
                                    {
                                        print(self.d)
                                        
                                        if(self.d.count>1){
                                      for i in 0...self.d.count-1
                                      {
                                        if(self._dishId==self.d[i]._dishId){
                                        
                                        
                                        self._img=self.d[i]._dishThumbnail
                                            self._price=self.d[i]._dishPrice
                                        self._dishtype1=self.d[i]._dishType
                                        
                                        }
                                        }
                                            
                                            
                                        }
                                      
                                        print(self._dishtype1)
                                        print( self._img)
                                        print(self._price)
                                        self.orderedfood.append(OrderedFood(_dishid: self._dishId, _dishQuantity: self._dishQuantity, _dishname: self._dishName, _dishimage: self._img, _price: self._price, _dishtype: self._dishtype1,orderId:self._orderId))
                                        
                                        self.orderset.append(OrderedFood(_dishid: self._dishId, _dishQuantity: self._dishQuantity, _dishname: self._dishName, _dishimage: self._img, _price: self._price, _dishtype: self._dishtype1,orderId:self._orderId))
                                    }
                                    
                                    
                                }
                                //self._dishName = orderedFood1["dishId"] as! String!
                                
                                //self._dishQuantity = orderedFood1["dishQuantity"] as! String!
                            }
                            
                            
                           
                                

                            
                            
//                            print(self._dishName)
//                            print(self._dishQuantity)
                        }
                        

                          print(self._orderId)
                        print(self._orderTotalPrice)
                         print(self._orderDate)
                        print(self.orderedfood)
                        var name:String=""
                        for i in 0...self.orderedfood.count-1
                        {
                            
                            
                            
                            
            
                            name=name+self.orderedfood[i]._dishname+" "+"("+self.orderedfood[i]._dishQuantity+")"
                            
                          
                            if(self.orderedfood.count-1 != i)
                            {
                                if(self.orderedfood.count>1)
                                {
                                    name=name+","
                                }
                                //name=name+""
                            }

                            
                        }
                        print(name)
                        
                        self.orderfood.append(OrderFood(_orderDate: self._orderDate, _orderId: self._orderId, _orderLastUpdate: self._orderLastUpdate, _orderStatus: "", _orderTax: "", _orderTotalPrice: self._orderTotalPrice, _orderedFoodName:name, _userID: uid))
                        self.orderedfood.removeAll()
                    }
                }
print(self.orderedfood)
                self.tborder.dataSource=self
                self.tborder.delegate=self
                self.tborder.reloadData()
                if(self.orderfood.count>4)
                {
                    self.tborder.isScrollEnabled=true
                }
                else{
                    self.tborder.isScrollEnabled=false
                }
                
            }
        })
        

        
        //UserDefaults.standard.set(child.key, forKey: "KEY")
    }
    func getorderfooddata()
    {
        
        
//        dataref.child("OrderFood").queryOrdered(byChild: "userID").queryEqual(toValue:uid).observeSingleEvent(of: .value, with: { snapshot in
//            print(snapshot)
//            if snapshot.exists()
//            {
//            }
//        })
    }
    @IBAction func backclickaction(_ sender: Any) {
        
        
        
        if(pg=="MA")
        {
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "MyAccountVC") as! MyAccountVC
            
            
            
            
            self.navigationController?.pushViewController(des, animated: true)
        }
        else{
            
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
            
            
            
            
            self.navigationController?.pushViewController(des, animated: true)
        }

    }
    func nullToNil(value : AnyObject?) -> AnyObject? {
        if value is NSNull {
            return nil
        } else {
            return value
        }
    }
    func retrivedishes()
    {
        
        d.removeAll()
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
                                
                                
                                
                                
                                self._dishId1=dishId
                                
                                
                            }
                            
                            if let dishIngredients = value["dishIngredients"] as? String{
                                
                                
                                
                                
                                self._dishIngredients=String(describing: dishIngredients)
                                
                                
                            }
                            
                            if let dishName = value["dishName"]  as? String{
                                
                                
                                
                                
                                self._dishName1=dishName
                                
                                
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
                            
                           
                            let dish1=Dish(_dContent: self._dishContent, _dDescription: self._dishDescription, _dId: self._dishId1, _dIngredients:" ", _dName: self._dishName1, _dRating: self._dishRatings, _dPrice: self._dishPrice, _dThumbnail: self._dishThumbnail, _dType: self._dishType, _fPreparationTime: self._foodPreparationTime)
                            
                            
                            self.d.append(dish1)
                            
                            
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    self.retriveorederdataofuser()
                
                
                }
                
                
                
             
                
                
                
                
                
            }
            
            
            
        })
        
        
        
    }
    @IBOutlet weak var backclick: UIBarButtonItem!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
