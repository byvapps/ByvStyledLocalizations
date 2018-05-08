//
//  ViewController.swift
//  ByvStyledLocalizations
//
//  Created by adrianByv on 05/08/2018.
//  Copyright (c) 2018 adrianByv. All rights reserved.
//

import UIKit
import ByvLocalizations
import ByvStylesIB

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: StyledUISearchBar!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var languageName: UILabel!
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.reloadLabels),
            name: ByvLocalizator.notiName,
            object: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func change(_ sender: UIButton) {
        let av = UIAlertController(title: "Language".localize(comment: "Action sheet title"), message: "Select the language you want".localize(comment: "Action sheet description"), preferredStyle: .actionSheet)
        for language in ByvLocalizator.shared.availableLanguages {
            av.addAction(UIAlertAction(title: language.name(), style: .default, handler: { (action) in
                ByvLocalizator.shared.setLanguage(code: language.code)
            }))
        }
        av.addAction(UIAlertAction(title: "Cancel".localize(), style: .cancel, handler: nil))
        
        self.present(av, animated: true, completion: nil)
    }
    
    @objc func reloadLabels() {
        languageName.text = ByvLocalizator.shared.currentLanguage.name()
    }
}

