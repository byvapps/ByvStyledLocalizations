//
//  StyledUISearchBarView.swift
//  ByvStylesIB
//
//  Created by Adrian Apodaca on 8/5/18.
//

import Foundation
import ByvStylesIB

@IBDesignable
extension StyledUISearchBar {
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
