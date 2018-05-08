//
//  StyledUIButton.swift
//  ByvStyles
//
//  Created by Adrian Apodaca on 7/5/18.
//

import UIKit
import ByvStylesIB

@IBDesignable
extension StyledUIButton {
    @IBInspectable var styledLocTitle: String? {
        get {
            return nil
        }
        set {
            if let newValue = newValue {
                self.styledLocTitle(newValue)
            }
        }
    }
}
