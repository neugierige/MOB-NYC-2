//
//  FirstViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        let string: AnyObject? = userDefaults.objectForKey("test_string")
        let number: AnyObject? = userDefaults.objectForKey("test_number")
        
        let stringAndNumber = "\(string!) \(number!)"
        
        textView.text = stringAndNumber
    }
}