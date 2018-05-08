//
//  UIButton+extension.swift
//  ByvLocalizations
//
//  Created by Adrian Apodaca on 1/5/18.
//

import Foundation
import UIKit
import ByvLocalizations
import ByvStyles

public extension UIButton {
    public func observeStyledLocChanges() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.localizeStyledText),
            name: ByvLocalizator.notiName,
            object: nil)
        self.localizeStyledText()
    }
    
    public func styledLocTitle(_ format: String, args:[CVarArg]? = nil, comment: String? = nil) {
        self.formatTitle = ByvFormatLoc(format: format, args: args, comment: comment)
        self.observeStyledLocChanges()
    }
    
    public func setLocTitleArgs(_ newValue:[CVarArg]) {
        self.formatTitle?.args = newValue
        self.localizeStyledText()
    }
    
    @objc func localizeStyledText() {
        if let formatLoc = formatTitle {
            if let args = formatLoc.args {
                self.styledTitle(String(format: formatLoc.format.localize(comment: formatLoc.comment), arguments: args))
            } else {
                self.styledTitle(formatLoc.format.localize(comment: formatLoc.comment))
            }
        }
    }
}
