//
//  Constants.swift
//  twoClosets
//
//  Created by Riddhi on 06/10/17.
//  Copyright © 2017 Riddhi. All rights reserved.
//

import UIKit
import AdSupport

let userDefault = UserDefaults.standard
let appDel = UIApplication.shared.delegate as! AppDelegate

let appLanguage =  Bundle.main.preferredLocalizations.first!

let ISDebug = true
let APP_NAME = "Prepwyzr"

//Live URl..............................................................//..........
//let URL_BASE = ""



class Constants {
    
    //MARK:- Device frame
    static let screenSize = UIScreen.main.bounds
    static let WIDTH = screenSize.width
    static let HEIGHT = screenSize.height
    
    //MARK:- UIDevice Related
    //static let deviceUUID = UIDevice.current.identifierForVendor?.uuidString
    //static let deviceUUID : String? = "56066FC5-8233-493C-84DC-88DAE5080454"
    //static let deviceUUID : String? = "35C8A06C-4C1A-46D2-81C2-CD05D900429C"
    //static let deviceUUID : String? = "DD3F0E5B-34F6-4377-96CC-680BEBCE9CD2"
    //static let deviceUUID : String? = "D110BA41-26C1-47EC-AFFD-A64CEAD0738A" //<-- testdemo/Pratik13
    

    //MARK:- Notification Center
    static let kNotiPrepareVC_ReloadList = Notification.Name("PrepareVC_ReloadList")
    static let kNotiPrepareVC_RetakeTest = Notification.Name("QuestionListVC_RetakeTest")
    
    //MARK:- Webservices
    static let URL_BASE = "" //Base URL
    
    static let apiSecurityKey = "!894$4v!B7b8REj"

    static let kColotCorrectGreen = "#4CAF50"
    static let kColotIncorrectRed = "#E53935"
    static let kColotNotAnsweredOrange = "#FBC02D"

    //MARK:- UUID
//    static func deviceUUID() -> String {
//
//        guard ASIdentifierManager.shared().isAdvertisingTrackingEnabled else {
//            return ""
//        }
//        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
//    }
 
    static var deviceUUID : String {

        guard ASIdentifierManager.shared().isAdvertisingTrackingEnabled else {
            return ""
        }
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
    
    
    //MARK:- UIView Methods
    static func setBorderTo(_ view: UIView, withBorderWidth widthView: Float, radiousView: Float, color bordercolor: UIColor) {
        view.layer.borderWidth = CGFloat(widthView)
        view.layer.borderColor = bordercolor.cgColor
        view.layer.cornerRadius = CGFloat(radiousView)
        view.layer.masksToBounds = true
    }
    
    static func printLog(strLog:String) {
        if ISDebug {
            print(strLog)
        }
    }
    
    //MARK:- UIcolor Methods
    static let kColor_Green = UIColor.color(fromHexString: "0x009688")
    static let kColor_Red = UIColor.color(fromHexString: "0xE53935")
    
    //MARK:- Common Methods For ViewControllers
    static func openActionsFromViewController(objView:UIViewController,objNavi:UINavigationController) -> Void {
        
        let alert = UIAlertController(title: "Options", message: "Select Option", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alert.addAction(UIAlertAction(title: "About Us", style: .default) { action in
            
            if let objAboutUSVC = objView.storyboard?.instantiateViewController(withIdentifier: "AboutUSVC") as? AboutUSVC {
                //objAboutUSVC.isFromLoginOrRegistrationScreen = true
                objNavi.pushViewController(objAboutUSVC, animated: true)
            }
            
        })
        
        alert.addAction(UIAlertAction(title: "Contact Us", style: .default) { action in
            
            if let objContactUSVC = objView.storyboard?.instantiateViewController(withIdentifier: "ContactUSVC") as? ContactUSVC {
                //objContactUSVC.isFromLoginOrRegistrationScreen = true
                objNavi.pushViewController(objContactUSVC, animated: true)
            }
            
        })
        
        alert.addAction(UIAlertAction(title: "Exit", style: .default) { action in
            exit(0)
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { action in
        })
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            
            objView.present(alert, animated: true, completion: nil)
            
        } else {
            
            alert.modalPresentationStyle = .popover
            if let presenter = alert.popoverPresentationController {
                presenter.sourceView = objView.view
                //presenter.sourceRect = sender.bounds
            }
            
            objView.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    //MARK:- Alert Text
    
    //Login
    static let kLogin_UserNameAndPwd = "Please enter username and password"
    
    //Register
    static let kLogin_UserName = "Please enter username"
    static let kLogin_ValidUserName = "Username Already Taken"
    
    static let kLogin_FullName = "Please enter full name"
    static let kLogin_Email = "Please enter email"
    static let kLogin_ValidEmail = "Please enter valid email"
    static let kLogin_Mobile = "Please enter valid mobile number"
    static let kLogin_Mobile_Digit = "Mobile number should be 10 digits long"
    static let kLogin_Password = "Please enter password"
    static let kLogin_ConfirmPassword = "Please enter confirm password"
    
    static let kLogin_PasswordCountMsg = "Password should be at least 6 characters long"
    static let kLogin_PasswordStrong = "Password should be alphanumeric and should not have spaces"
    
    static let kLogin_PwdAndConfirmPwdMatch = "Password Does not match"
    
}
