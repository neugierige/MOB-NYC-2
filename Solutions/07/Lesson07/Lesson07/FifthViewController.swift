//
//  FifthViewController.swift
//  Lesson07
//
//  Created by Rudd Taylor on 9/30/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let file = "vc5.txt"
        
        let docDirectory = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last as NSURL
        
        let url = docDirectory.URLByAppendingPathComponent(file)
        
        // extract from textview
        
        let stringInTextView = textView.text
        
        let stringArray = stringInTextView.componentsSeparatedByString(" ")
        
        let stringForFile = "\(stringArray)"
        
        stringForFile.writeToURL(url, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
    }
}







