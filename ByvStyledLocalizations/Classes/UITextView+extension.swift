//
//  UITextView+extension.swift
//  ByvLocalizations
//
//  Created by Adrian Apodaca on 1/5/18.
//

import Foundation
import ByvLocalizations
import ByvStyles

public extension UITextView {
    private func observeStyledLocChanges() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.localizeStyledText),
            name: ByvLocalizator.notiName,
            object: nil)
        self.localizeStyledText()
    }
    
    public func styledLocText(_ format: String, args:[CVarArg]? = nil, comment: String? = nil) {
        self.formatText = ByvFormatLoc(format: format, args: args, comment: comment)
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
