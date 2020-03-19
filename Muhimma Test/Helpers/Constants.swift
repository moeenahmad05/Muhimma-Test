//
//  Constants.swift
//  GameNation
//
//  Created By Moeen Ahmad on 05/01/2018.
//  Copyright © 2018 MOeenAHmad05. All rights reserved.
//

import Foundation
import UIKit
import AWSCognitoIdentityProvider
//import DeviceKit

let CognitoIdentityUserPoolRegion: AWSRegionType = AWSRegionType.USEast2
let CognitoIdentityUserPoolId = "us-east-2_4bKDTNSlK"
let CognitoIdentityUserPoolAppClientId = "7a2p8q1cvf9q5e5itj2jogngf2"
let CognitoIdentityUserPoolAppClientSecret = "pmfkhpbdlhi2n5v54f5ubva0mle647afpc0urslsmk9mee7on9r"

let AWSCognitoUserPoolsSignInProviderKey = "UserPool"

class Constants {

    //The API's base URL
    
    struct URL {
      
        static let baseUrl = "https://gateway.backendapis.net/"
        
        static let login = "node/user"
       
        
        
       
        
    }
    
   
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let userId = "userId"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
    
    struct AppColor {
        static let primaryPurple = 0x70087a
        static let primaryRed = UIColor(red: 231.0/255.0, green: 105.0/255.0, blue: 136.0/255.0, alpha: 1.0)//0xff1744
        static let primaryGreen = UIColor(red: 18/255, green: 44/255, blue: 53/255, alpha: 1.0)
        
    }
    
    struct Color {
       
        static let primary = AppColor.primaryPurple
        static let primaryRed = AppColor.primaryRed
        
        static let rattingYellow = UIColor(red: 240.0/255, green: 195.0/255, blue: 38.0/255, alpha: 1.0)
        static let primaryBlue = UIColor(red: 22.0/255.0, green: 156.0/255.0, blue: 207.0/255.0, alpha: 1.0)
        static let rattingRed = UIColor(red: 200.0/255.0, green: 61.0/255.0, blue: 71.0/255.0, alpha: 1.0)
        
        static let rattingGreen = UIColor(red: 83.0/255.0, green: 197.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        
        static let appOrange = UIColor(red: 231.0/255.0, green: 105.0/255.0, blue: 36.0/255.0, alpha: 1.0)
        
        
    }
    
    struct activitySize {
        static let size = CGSize(width: 40, height: 40)
    }
    
    enum loaderMessages : String {
        case loadingMessage = "Loading..."
    }
    
    struct Api {
        
        struct status {
            static let ok = 200
            static let error = 400
        }
    }
    
    struct NetworkError {
        
        static let timeOutInterval: TimeInterval = 20
        
        static let error = "Error"
        static let internetNotAvailable = "Internet Not Available"
        static let pleaseTryAgain = "Please Try Again"
        
        static let generic = 400
        static let genericError = "Please Try Again."
        
        static let serverErrorCode = 500
        static let serverNotAvailable = "Server Not Available"
        static let serverError = "Server Not Availabe, Please Try Later."
        
        static let timout = 401
        static let timoutError = "Network Time Out, Please Try Again."
        
        static let login = 403
        static let loginMessage = "Unable To Login"
        static let loginError = "Please Try Again."
        
        static let internet = 504
        static let internetError = "Internet Not Available"
        
        static let Media = 429
        static let MediaEror = "Internet Not Available"
        
    }
    
    struct NetworkSuccess {
        
        static let statusOK = 200
        
    }
    
    static func showBasicAlert (message: String) -> UIAlertController{
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        return alert
    }
    

    struct ApplicationXIBs {
        static let kPTSRLauncherView = "PTSRLauncherView"
        
        static let kPTFWInitialSetupView = "PTFWInitialSetupView"
    }
    
    struct ApplicationResources {
        static let kFrameworkResourcesBundle = "Resources"
    }
}

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
}

extension String {
    var isValidPhone: Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let components = self.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        
        return self == filtered
    }
}
//extension UIViewController {
//    var appDelegate: AppDelegate {
//        return AppDelegate.appDelegate
//    }
//}
