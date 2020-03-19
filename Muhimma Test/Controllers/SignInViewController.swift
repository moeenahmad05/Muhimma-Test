//
//  SignInViewController.swift
//  AWS_Cognito_Sample
//
//  Created by Moeen Ahmad on 5/4/18.
//  Copyright © 2018 Deloitte. All rights reserved.
//

import AWSCognitoIdentityProvider
import SkyFloatingLabelTextField
import NVActivityIndicatorView

class SignInViewController: UIViewController, NVActivityIndicatorViewable , UITextFieldDelegate {
    
    @IBOutlet weak var emailID: UITextField!
      override func viewDidLoad() {
          super.viewDidLoad()

             // Save Auth
           let AccessToken = "d5dtZ5eOoL47DAxwj6dIl48T3fi4ZUvq7MpU06QA"
                 let Defaults = UserDefaults.standard
                 Defaults.set(AccessToken, forKey: "userAuthToken")
                 Defaults.synchronize()
          
          
      }

    //-------------------------------------------------------------------------
    // MARK: - IBOutlet
    //-------------------------------------------------------------------------
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    //-------------------------------------------------------------------------
    // MARK: - Variables
    //-------------------------------------------------------------------------
    var passwordAuthenticationCompletion: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>?
    var usernameText: String?
    
    //-------------------------------------------------------------------------
    // MARK: - Lifecycle functions
    //-------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.password.text = nil
        self.username.text = usernameText
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    //-------------------------------------------------------------------------
    // MARK: - User defined functions
    //-------------------------------------------------------------------------
    @IBAction func signInPressed(_ sender: AnyObject) {
        if (self.username.text != nil && self.password.text != nil) {
            let authDetails = AWSCognitoIdentityPasswordAuthenticationDetails(username: self.username.text!, password: self.password.text! )
            self.passwordAuthenticationCompletion?.set(result: authDetails)
            
            guard let email = username.text else {
                         return
                     }
                     
                     
                  if email == "" {
                         let alert = Constants.showBasicAlert(message: "email is empthy ")
                         self.present(alert, animated: true, completion: nil)
                     }
                  else {
                         
                         let param: [String: Any] = [
                             "email" : username.text!,
                            
                        ]
                      
                         
                         self.loginCall(parameters: param as NSDictionary)
                     }
            
        } else {
            let alertController = UIAlertController(title: "Missing information",
                                                    message: "Please enter a valid user name and password",
                                                    preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
            alertController.addAction(retryAction)
        }
    }
}

extension SignInViewController: AWSCognitoIdentityPasswordAuthentication {
    
    public func getDetails(_ authenticationInput: AWSCognitoIdentityPasswordAuthenticationInput, passwordAuthenticationCompletionSource: AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails>) {
        self.passwordAuthenticationCompletion = passwordAuthenticationCompletionSource
        DispatchQueue.main.async {
            if (self.usernameText == nil) {
                self.usernameText = authenticationInput.lastKnownUsername
            }
        }
    }
    
    public func didCompleteStepWithError(_ error: Error?) {
        DispatchQueue.main.async {
            if let error = error as NSError? {
                let alertController = UIAlertController(title: error.userInfo["__type"] as? String,
                                                        message: error.userInfo["message"] as? String,
                                                        preferredStyle: .alert)
                let retryAction = UIAlertAction(title: "Retry", style: .default, handler: nil)
                alertController.addAction(retryAction)
                self.present(alertController, animated: true, completion:  nil)
            } else {
                self.username.text = nil
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    
      @IBAction func Login(_ sender: Any) {
        
       guard let email = emailID.text else {
              return
          }
          
          
       if email == "" {
              let alert = Constants.showBasicAlert(message: "email is empthy ")
              self.present(alert, animated: true, completion: nil)
          }
       else {
              
              let param: [String: Any] = [
                  "email" : emailID.text!,
                 
             ]
           
              
              self.loginCall(parameters: param as NSDictionary)
          }
          
      }
      
      func loginCall(parameters: NSDictionary) {
          self.showLoader()
          
          UserHandler.logIn(parameter: parameters, success: { (successResponse) in
              self.stopAnimating()
              print(successResponse.message!)
              print(successResponse.status!)
              print(successResponse.result!)
              
              if successResponse.status == true {
                  if successResponse.result.count > 0 {
                     
                        
                    
                  }
              }
              else if successResponse.status == false {
                  let alert = Constants.showBasicAlert(message: "Something Went Wrong")
                  self.present(alert, animated: true, completion: nil)
                  
                 
              }
              
          }) { (error) in
              self.stopAnimating()
              let alert = Constants.showBasicAlert(message: error.message)
              self.present(alert, animated: true, completion: nil)
             
              
          }
      }
      
      // loader
      
      func showLoader(){
          self.startAnimating(Constants.activitySize.size, message: Constants.loaderMessages.loadingMessage.rawValue ,messageFont: UIFont.systemFont(ofSize: 14), type: NVActivityIndicatorType.ballClipRotatePulse)
      }
      
    
}
