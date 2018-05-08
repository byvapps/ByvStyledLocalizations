//
//  ByvStUILabel.swift
//  ByvStyles
//
//  Created by Adrian Apodaca on 4/5/18.
//

import UIKit
import ByvStylesIB

@IBDesignable
extension StyledUILabel {

    @IBInspectable var styledLocText: String? {
        get {
            return nil
        }
        set {
            if let newValue = newValue {
                self.styledLocText(newValue)
            }
        }
    }
}

