//
//  ViewController.swift
//  AlertController
//
//  Created by Arun Nagarajan on 3/19/15.
//  Copyright (c) 2015 Arun Nagarajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonFromStoryboard: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonClicked(sender: AnyObject) {
        var alert = UIAlertController(title: "hey this is the title", message: "my message", preferredStyle: .Alert)
        
        var password : UITextField!
        
        let cancel = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel) { (action) -> Void in
            NSLog("cancel clicked")
            NSLog("password is \(password.text)")
        }
        
        let delete = UIAlertAction(title: "Delete", style: .Destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(delete)
        
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.secureTextEntry = true
            password = textfield
        }
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

