//
//  LoginData.swift
//  Viands_IOS
//
//  Created by Saahil Chhabria on 07/07/15.
//  Copyright (c) 2015 Saahil Chhabria. All rights reserved.
//

import Foundation


class LoginData
{
    var phone : String!
    var password : String!
    
    init(phone:String,password:String){
        self.phone = phone
        self.password = password
    }
    func print() {
        Swift.print(phone)
        Swift.print(password)
    }
    
   }