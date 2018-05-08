//
//  UISearchBar+extension.swift
//  ByvLocalizations
//
//  Created by Adrian Apodaca on 1/5/18.
//

import Foundation
import ByvLocalizations
import ByvStyles

public extension UISearchBar {
    private func observeStyledLocChanges() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.localizeStyledText),
            name: ByvLocalizator.notiName,
            object: nil)
        self.localizeStyledText()
    }
    
    public func styledLocPlaceholder(_ format: String, args:[CVarArg]? = nil, comment: String? = nil) {
        self.formatText = ByvFormatLoc(format: format, args: args, comment: comment)
        self.observeStyledLocChanges()
    }
    
    public func setLocPlaceholderArgs(_ newValue:[CVarArg]) {
        self.formatText?.args = newValue
        self.localizeStyledText()
    }
    
    @objc func localizeStyledText() {
        if let formatLoc = formatText {
            if let args = formatLoc.args {
                self.styledPlaceholder(String(format: formatLoc.format.localize(comment: formatLoc.comment), arguments: args))
            } else {
                self.styledPlaceholder(formatLoc.format.localize(comment: formatLoc.comment))
            }
        }
    }
}
