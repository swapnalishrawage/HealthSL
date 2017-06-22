//
//  orderDetail.swift
//  Salado
//
//  Created by Rz on 21/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class orderDetail: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var btnpay: UIButton!
    @IBOutlet weak var lbltotalgrand: UILabel!
    @IBOutlet weak var lbladdress: UILabel!
    @IBOutlet weak var lbltax: UILabel!
    var alreadytotal:Int!
    @IBOutlet weak var lblprice: UILabel!
    var dataref: FIRDatabaseReference!
    private var   _ordermenu:[OrderedFood]!
    var pg:String = UserDefaults.standard.value(forKey: "Click") as! String
    
    var  OrderMenu : [OrderedFood]{
        get {
            return _ordermenu
            
        }
        set
        {
            _ordermenu = newValue
        }
    }
var price0=[Int]()
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var tbordermenu: UITableView!
    var order=[orderitem]()
    var p=[Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pg)
        
         self.navigationItem.title="CONFIRM ORDER"
        print(OrderMenu.count)
        
        
        print(OrderMenu)
        view1.layer.cornerRadius=5
        
        let totalprice:String=UserDefaults.standard.value(forKey: "TotalPrice") as! String
        
        //
        for i in 0...OrderMenu.count-1{
            
           order.append(orderitem(Name:OrderMenu[i]._dishname , Category: OrderMenu[i]._dishtype, Image: OrderMenu[i]._dishimage, Price: OrderMenu[i]._price,Count:OrderMenu[i]._dishQuantity))
            
            
           
        }
        
        var total:Int=0
        
        for j in 0...OrderMenu.count-1{
            let p1:Int=Int(OrderMenu[j]._price)!
            p.append(p1)
        }
        if(pg=="VD")
        {
            p.removeAll()
            tbordermenu.isUserInteractionEnabled=false
            btnpay.isUserInteractionEnabled=false
            
            for j in 0...OrderMenu.count-1{
                let p1:Int=Int(OrderMenu[j]._price)! * Int(OrderMenu[j]._dishQuantity)!
                p.append(p1)
                
            }
            
        }
        if(pg=="RO"){
            p.removeAll()
            //tbordermenu.isUserInteractionEnabled=false
            //btnpay.isUserInteractionEnabled=false
            
            for j in 0...OrderMenu.count-1{
                let p1:Int=Int(OrderMenu[j]._price)! * Int(OrderMenu[j]._dishQuantity)!
                p.append(p1)
                
            }

        }

        for j in 0...p.count-1{
        total=p[j]+total
        
        }
        alreadytotal=total
        
        lblprice.text=totalprice

        let m=totalprice.components(separatedBy: " ")[1]
        
        let i:Int=Int(m)!
        print(i)
        let m0:Int=67+i
        lbltotalgrand.text="GrandTotal:₹ \(String(m0)) "
        
        
        
        
        if(pg=="VD" || pg=="RO")
        {
            lblprice.text=String(total)
            lbltotalgrand.text="GrandTotal:₹ \(String(total+67)) "
        }
//        var o1=orderitem(Name: "Roasted Vegetables Medley", Category: "V", Image: "", Price: "Rs 300")
//        
//         var o2=orderitem(Name: "Herbed Chicken", Category: "NV", Image: "", Price: "Rs 200")
//        
//        var o3=orderitem(Name: "Pork Chops", Category: "NV", Image: "", Price: "Rs 400")
//        var o4=orderitem(Name: "Biryani", Category: "V", Image: "", Price: "Rs 400")
//        
//        order.append(o1)
//        order.append(o2)
//        order.append(o3)
//        order.append(o4)
        
        
                UserDefaults.standard.set("1", forKey: "Move")
        tbordermenu.delegate=self
        tbordermenu.dataSource=self
        tbordermenu.reloadData()

        // Do any additional setup after loading the view.
    }
//    override func viewWillAppear(_ animated: Bool) {
//        tbordermenu.delegate=self
//        tbordermenu.dataSource=self
//        tbordermenu.reloadData()
//    }
    @IBAction func barbtnclick(_ sender: Any) {
        
        
       
        if(pg=="RO" || pg=="VD")
        {
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "MyorderVC") as! MyorderVC
            
            
            
            
            self.navigationController?.pushViewController(des, animated: true)
        }
        else{
            let mainstorybord:UIStoryboard=UIStoryboard(name: "Main", bundle: nil)
            let des=mainstorybord.instantiateViewController(withIdentifier: "MenuItemVC") as! MenuItemVC
            
            
            
            
            self.navigationController?.pushViewController(des, animated: true)
        }
        
      
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ordereditemcell",for:indexPath) as? ordereditemcell
        {
            
           let ord1=order[indexPath.row]
            
            
      

            
            cell.stepper.value=Double(OrderMenu[(indexPath.row)]._dishQuantity)!
            if(ord1.Category=="NonVeg")
            {
                cell.imgcategory.image=#imageLiteral(resourceName: "nonveg")
            }
            else{
                cell.imgcategory.image=#imageLiteral(resourceName: "veg")
            }
            cell.stepper.tintColor=UIColor(red: 134/255, green: 166/255, blue: 94/255, alpha: 1)
            cell.updatecell(name: ord1.name, price:"₹ "+"\(ord1.Price)", image: ord1.image, imgCategory: ord1.Category,count:ord1.count)
            
            
             cell.stepper.addTarget(self, action: #selector(orderDetail.clickonstepper(sender:)), for: .valueChanged)
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  order.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    @IBAction func proceedpayclick(_ sender: Any) {
        
        orderfoodinsertion()
        
        
    }
    func orderfoodinsertion()
    {
        
        dataref=FIRDatabase.database().reference()
       
        
        let uid:String=UserDefaults.standard.value(forKey: "KEY") as! String
                let orderid=NSUUID().uuidString
        
        
        
        var myArray = [[ : ]]

        var m:[String:AnyObject]!
        for i in 0...order.count-1
        {
      print(OrderMenu[i]._dishname)
         
           m=["dishId":OrderMenu[i]._dishId as AnyObject,"dishName":OrderMenu[i]._dishname as AnyObject,"dishQuantity":/*OrderMenu[i]._dishQuantity as AnyObject*/String(order[i].count) as AnyObject]
            
            myArray.append(m)
            
            //FIRDatabase.database().reference().child("OrderFood").child("orderedFood").childByAutoId().setValue(m)
           
            
        }
        
        
        
        let date = Date()
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd/MM/yyyy h:mm a"
        let d:String=dateformatter.string(from: date)
        
        
        dateformatter.amSymbol="AM"
        dateformatter.pmSymbol="PM"
        dateformatter.dateFormat="dd/MM/yyyy"
        print(d)
        let total:String=lblprice.text!
        
        print(total)
        let orderfooddata:[String:AnyObject]=["orderDate":d as AnyObject ,"orderId":orderid as AnyObject ,"orderLastUpdate":d as AnyObject  ,"orderStatus":"ordered" as AnyObject  ,"orderTax":"67" as AnyObject,"orderTotalPrice":total as AnyObject, "orderedFood":myArray as AnyObject ,"userID":uid as AnyObject]
        
        if(total=="0")
        {
            
            
//            lbltax.isHidden=true
//            lbltotalgrand.isHidden=true
            
            let passwordcheck = UIAlertController(title: "Order", message: "Please add some item", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            present(passwordcheck, animated: true, completion: {  })
            

        }
        else{
            
            dataref.child("OrderFood").childByAutoId().setValue(orderfooddata)//.setValue(orderfooddata)//.setValue(orderfooddata)
            
            
            
            let passwordcheck = UIAlertController(title: "Order", message: "Your Order Placed Successfully.Order Time:\(d)  Price: \(total) ", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler:nil)
            
            
            
            passwordcheck.addAction(cancelAction)
            
            
            present(passwordcheck, animated: true, completion: {  })
            

            
        }
        
        //dataref.child("OrderFood").child("orderedFood").childByAutoId().
        
        //orderfood.removeAll()
        
        
    }

    
    func clickonstepper(sender:UIStepper)
    {
       
        
        
        
        let pos = sender.convert(CGPoint.zero, to: tbordermenu)
        let indexPath = tbordermenu.indexPathForRow(at: pos)
        let cell: ordereditemcell=tbordermenu.cellForRow(at: indexPath!) as! ordereditemcell//tbordermenu.cellForRow(at: indexPath!) as! ordereditemcell
 //        let m=d[indexPath.row]
       
        let ord1=order[(indexPath?.row)!]
        
        
        
        
        
        let value = String(Int(cell.stepper.value))
        //            var item = cart[indexPath.row]
        //            item.value[3] = value
        //            cart[indexPath.row] = item
        
        
        
        print(value)
        var total:Int=0

        let t = NSString(string: cell.lblprice.text!).doubleValue
        print(t)
        let m1=Int(cell.stepper.value) as Int
        
        let p:Int=Int(OrderMenu[indexPath!.row]._price)!
        print(m1)
        
        print(OrderMenu[indexPath!.row]._dishQuantity)
        let totalprice:Int=m1*p
        
      
        
        
        
        
        
        ord1.Price=String(totalprice)
        ord1.count=String(m1)
        //
       // price0.append(totalprice)
        
        
        for i in 0...order.count-1{
           total=total+Int(order[i].Price)!
        }
        
        
        print(total)
       if(m1==0)
        {
           cell.lblprice.text="₹ "+ord1.Price
       }
       else{
        cell.lblprice.text="₹ "+"\(String(totalprice))"
       }
        
        
       
       
        
//            let t1=alreadytotal+totalprice
          //  lblprice.text="₹ "+"\(String(t1))"
        
        lblprice.text="₹ "+"\(String(total))"

        if(String(total)=="0")
        {
//            lbltax.isHidden=true
//            lbltotalgrand.isHidden=true
            lbltotalgrand.text="GrandTotal:₹ 0"
            
        }
        else{
            let t=total+67
            lbltotalgrand.text="₹ "+String(t)
            lbltax.isHidden=false
            lbltotalgrand.isHidden=false
        }
        

        
        print(total)
        
        
        
       // }
        
        
        
//        if(totalprice==0){
//            lblprice.text="₹ "+"\(String(totalprice))"
//
//        }
        
//        var price=intrate*m1
//        print(price)
//        
        
        
//        if(price1.count==0)
//        {
//            price1.insert(price, at: 0)
//        }
//            
//        else  if(price1.count==1){
//            
//            price=price1[0]+price
//            price1.insert(price, at: 0)
//        }
//        print(value)
//        lblitemcount.text="\(value) Item in cart"
//        lblrate.text="₹ \(String(price))"
        
        
        cell.lblcount.text=String(Int(cell.stepper.value))
        print("stepper click inside viewcontroller")
        
        
    
        
        

    
        
    }
    @IBOutlet weak var proceedclick: UIButton!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
