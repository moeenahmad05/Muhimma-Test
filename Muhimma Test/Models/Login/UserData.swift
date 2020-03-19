//
//  UserData.swift
//  GameNation
//
//  Created By Moeen Ahmad on 22/01/2018.
//  Copyright © 2018 MOeenAHmad05. All rights reserved.
//

import Foundation

struct UserData {
    
    
    var email : String!
   
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        
        
        
       
      
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        
        
        
        if email != nil{
            dictionary["email"] = email
        }
        
        
        
        return dictionary
    }
    
}
