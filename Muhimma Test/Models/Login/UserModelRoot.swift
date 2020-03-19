//
//  UserModelRoot.swift
//  GameNation
//
//  Created By Moeen Ahmad on 22/01/2018.
//  Copyright © 2018 MOeenAHmad05. All rights reserved.
//

import Foundation

struct UserModelRoot {
    
    var message : String!
    var result : [UserData]!
    var status : Bool!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        message = dictionary["message"] as? String
        result = [UserData]()
//        if let resultArray = dictionary["result"] as? [[String:Any]] {
//            for dic in resultArray{
//                let value = UserData(fromDictionary: dic)
//                result.append(value)
//            }
//        }
        
        
        status = dictionary["status"] as? Bool
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if message != nil{
            dictionary["message"] = message
        }
        if result != nil{
            var dictionaryElements = [[String:Any]]()
            for resultElement in result {
                dictionaryElements.append(resultElement.toDictionary())
            }
            dictionary["result"] = dictionaryElements
        }
        
        if status != nil{
            dictionary["status"] = status
        }
        return dictionary
    }
    
}
