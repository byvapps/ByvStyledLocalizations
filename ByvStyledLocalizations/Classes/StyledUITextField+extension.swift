//
//  StyledUITextField.swift
//  ByvStylesIB
//
//  Created by Adrian Apodaca on 8/5/18.
//

import Foundation
import ByvStylesIB

@IBDesignable
extension StyledUITextField {
    @IBInspectable var styledLocPlaceholder: String? {
        get {
            return nil
        }
        set {
            if let newValue = newValue {
                self.styledLocPlaceholder(newValue)
            }
        }
    }
}
