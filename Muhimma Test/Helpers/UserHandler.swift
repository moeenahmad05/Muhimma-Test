//
//  UserHandler.swift
//  e-Mal Merchant
//
//  Created by eFatoora LLC on 02/07/2019.
//  Copyright © 2019 eFatoora LLC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserHandler {
    
    static let sharedInstance = UserHandler()
  
    
 
//    class func GetCountryCode(success: @escaping(CountryRoot)-> Void, failure: @escaping(NetworkError)-> Void) {
//        let url = Constants.URL.baseUrl+Constants.URL.GetCountry
//        print(url)
//        NetworkHandler.getRequest(url: url, parameters: nil, success: { (successResponse) in
//            let dictionary = successResponse as! [String: Any]
//            let categoryObj = CountryRoot(fromDictionary: dictionary)
//            success(categoryObj)
//
//        }) { (error) in
//            failure(NetworkError(status: Constants.NetworkError.generic, message: error.message))
//        }
//    }
    
//
//    class func signUp(parameter: NSDictionary, success: @escaping(TokenModelroot)-> Void, failure: @escaping(NetworkError) -> Void) {
//        let url = Constants.URL.baseUrl+Constants.URL.SignUp
//        print(url)
//        NetworkHandler.postRequest(url: url, parameters: parameter as? Parameters, success: { (successResponse) in
//            let dictionary = successResponse as! [String: Any]
//
//            let objData = TokenModelroot(fromDictionary: dictionary)
//            success(objData)
//        }) { (error) in
//            failure(NetworkError(status: Constants.NetworkError.generic, message: error.message))
//        }
//    }
    

    
    class func logIn(parameter: NSDictionary, success: @escaping(UserModelRoot)-> Void, failure: @escaping(NetworkError) -> Void) {
        let url = Constants.URL.baseUrl+Constants.URL.login
        print(url)
        NetworkHandler.postRequest(url: url, parameters: parameter as? Parameters, success: { (successResponse) in
            let dictionary = successResponse as! [String: Any]
            let objUser = UserModelRoot(fromDictionary: dictionary)
            success(objUser)
            
//            let saveData = NSKeyedArchiver.archivedData(withRootObject: objUser)
//            UserDefaults.standard.set(saveData, forKey: "userData")
//            UserDefaults.standard.synchronize()
          
            
        }) { (error) in
            failure(NetworkError(status: Constants.NetworkError.generic, message: error.message))
        }
    }
    
//    class func GetDashboarddata(success: @escaping(DashboardRoot)-> Void, failure: @escaping(NetworkError)-> Void) {
//        let url = Constants.URL.baseUrl+Constants.URL.Dashboard
//        print(url)
//        NetworkHandler.getRequest(url: url, parameters: nil, success: { (successResponse) in
//            let dictionary = successResponse as! [String: Any]
//            let categoryObj = DashboardRoot(fromDictionary: dictionary)
//            success(categoryObj)
//
//        }) { (error) in
//            failure(NetworkError(status: Constants.NetworkError.generic, message: error.message))
//        }
//    }
//
//    class func GetNotiData(success: @escaping(NotiRoot)-> Void, failure: @escaping(NetworkError)-> Void) {
//        let url = Constants.URL.baseUrl+Constants.URL.Notification
//        print(url)
//        NetworkHandler.getRequest(url: url, parameters: nil, success: { (successResponse) in
//            let dictionary = successResponse as! [String: Any]
//            let categoryObj = NotiRoot(fromDictionary: dictionary)
//            success(categoryObj)
//
//        }) { (error) in
//            failure(NetworkError(status: Constants.NetworkError.generic, message: error.message))
//        }
//    }
//
//
//    class func CreateInvoice(parameter: NSDictionary, success: @escaping(GenerateInvoice)-> Void, failure: @escaping(NetworkError) -> Void) {
//        let url = Constants.URL.baseUrl+Constants.URL.CreateInvoice
//        print(url)
//        NetworkHandler.postRequest(url: url, parameters: parameter as? Parameters, success: { (successResponse) in
//            let dictionary = successResponse as! [String: Any]
//            let objData = GenerateInvoice(fromDictionary: dictionary)
//
//            success(objData)
//        }) { (error) in
//            failure(NetworkError(status: Constants.NetworkError.generic, message: error.message))
//        }
//    }
//
//
//    class func THistoryInvoice(parameter: NSDictionary, success: @escaping(THistoryRoot)-> Void, failure: @escaping(NetworkError) -> Void) {
//        let url = Constants.URL.baseUrl+Constants.URL.TransactionHistory
//        print(url)
//        NetworkHandler.postRequest(url: url, parameters: parameter as? Parameters, success: { (successResponse) in
//            let dictionary = successResponse as! [String: Any]
//            let objData = THistoryRoot(fromDictionary: dictionary)
//
//            success(objData)
//        }) { (error) in
//            failure(NetworkError(status: Constants.NetworkError.generic, message: error.message))
//        }
//    }
//
//    class func WHistoryInvoice(parameter: NSDictionary, success: @escaping(WHistoryRoot)-> Void, failure: @escaping(NetworkError) -> Void) {
//        let url = Constants.URL.baseUrl+Constants.URL.WithdrawalHistory
//        print(url)
//        NetworkHandler.postRequest(url: url, parameters: parameter as? Parameters, success: { (successResponse) in
//            let dictionary = successResponse as! [String: Any]
//            let objData = WHistoryRoot(fromDictionary: dictionary)
//
//            success(objData)
//        }) { (error) in
//            failure(NetworkError(status: Constants.NetworkError.generic, message: error.message))
//        }
//    }
   
}
