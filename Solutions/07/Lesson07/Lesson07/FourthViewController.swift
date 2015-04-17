//
//  FourthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let file = "vc3.txt"
        
        let docDirectory = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last as NSURL
        
        let url = docDirectory.URLByAppendingPathComponent(file)
        
        let text = String(contentsOfURL: url, encoding: NSUTF8StringEncoding, error: nil)
        
        textView.text = text
    }
}







