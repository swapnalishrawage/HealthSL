//
//  User.swift
//  Salado
//
//  Created by Rz on 24/05/17.
//  Copyright © 2017 Rz. All rights reserved.
//

import Foundation
class User{
    
    
    
    private var _active:Bool!
    private var _emailId:String!
    private var _firstLogin:Bool!
    private var _isActive:Bool!
    private var _isFirstLogin:Bool!
    private var _mobileNo:String!
    private var _password:String!
    private var _userDietType:String!
    private var _userId:String!
    private var _userLoginID:String!
    private var _userName:String!
    private var _userType:String!
    
    var active : Bool{
        get {
            return _active
            
        }
        set
        {
            _active = newValue
        }
    }
    var EmailId : String{
        get {
            return _emailId
            
        }
        set
        {
            _emailId = newValue
        }
    }
    var firstLogin : Bool{
        get {
            return _firstLogin
            
        }
        set
        {
            _firstLogin = newValue
        }
    }
    
    var isactive : Bool{
        get {
            return _isActive
            
        }
        set
        {
            _isActive = newValue
        }
    }
    var isFirstLogin : Bool{
        get {
            return _isFirstLogin
            
        }
        set
        {
            _isFirstLogin = newValue
        }
    }
    var mobileNo : String{
        get {
            return _mobileNo
            
        }
        set
        {
            _mobileNo = newValue
        }
    }
    
    var password : String{
        get {
            return _password
            
        }
        set
        {
            _password = newValue
        }
    }
    
    var userDietType : String{
        get {
            return _userDietType
            
        }
        set
        {
            _userDietType = newValue
        }
    }
    
    var userId:String
        {
        get {
            return _userId
            
        }
        set
        {
            _userId = newValue
        }
        
        
        // return _LastMsgSender
        
    }
    var userLoginID:String
        {
        get{
            return _userLoginID
            
        }set{
            _userLoginID=newValue
        }
        
        //return _Lastmsgtext
        
    }
    var userName:String
        {
        get{
            return _userName
            
        }set{
            _userName=newValue
        }
        
    }
    var userType:String{
        get{
            return _userType
            
        }set{
            _userType=newValue
        }
    }
    init(active:Bool,EmailId:String,firstLogin:Bool,isActive:Bool,isFirstLogin:Bool,mobileNo:String,password:String,userDietType:String,userId:String,userLoginID:String,userName:String,userType:String)
    {
        _active=active
        _emailId=EmailId
        _firstLogin=firstLogin
        _isActive=isActive
        _isFirstLogin=isFirstLogin
        _mobileNo=mobileNo
        _password=password
        _userDietType=userDietType
        _userId=userId
        _userLoginID=userLoginID
        _userName=userName
        _userType=userType
        
        
    }
    
}
