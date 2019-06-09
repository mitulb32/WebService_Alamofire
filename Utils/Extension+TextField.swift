//
//  Extension+TextField.swift
//  Pro Services
//
//  Created by Riddhi on 03/10/17.
//  Copyright © 2017 Riddhi. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self.text)
        if !result {
            self.becomeFirstResponder()
        }
        return result
    }
    
    func useUnderline() {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    //MARK:- TextField Set Bottom Border Color
    func setBottomBorder(color:CGColor) {
        
        self.borderStyle = UITextBorderStyle.none;
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    //MARK:- TextField Set Place Holder Color
    func setPlaceHolderColor(color : UIColor) {
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : color])
    }
    
    //MARK:- TextField Left Padding
    func setLeftPaddingPoints(_ amount:CGFloat) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    //MARK:- TextField Right Padding
    func setRightPaddingPoints(_ amount:CGFloat) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    //MARK:- Add Border
    func addBorderToTextField(colorForBorder:UIColor,width:CGFloat,cornerRadius:CGFloat) -> Void {
        
        self.layer.borderColor = colorForBorder.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
}
