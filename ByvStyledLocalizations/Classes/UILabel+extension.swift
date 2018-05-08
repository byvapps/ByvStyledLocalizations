//
//  UILabel+extension.swift
//  ByvLocalizations_Example
//
//  Created by Adrian Apodaca on 1/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ByvLocalizations
import ByvStyles

extension UILabel {
    
    private func observeStyledLocChanges() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.localizeStyledText),
            name: ByvLocalizator.notiName,
            object: nil)
        self.localizeStyledText()
    }
    
    public func styledLocText(_ taggedFormat: String, args:[CVarArg]? = nil, comment: String? = nil) {
        self.formatText = ByvFormatLoc(format: taggedFormat, args: args, comment: comment)
        self.observeStyledLocChanges()
    }
    
    public func setLocArgs(_ newValue:[CVarArg]) {
        self.formatText?.args = newValue
        self.localizeStyledText()
    }
    
    @objc func localizeStyledText() {
        if let formatLoc = formatText {
            if let args = formatLoc.args {
                self.styledText(String(format: formatLoc.format.localize(comment: formatLoc.comment), arguments: args))
            } else {
                self.styledText(formatLoc.format.localize(comment: formatLoc.comment))
            }
            self.superview?.layoutSubviews()
        }
    }
}
