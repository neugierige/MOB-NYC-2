//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var outputField: UILabel!

    @IBAction func addAndUpdate(sender: AnyObject) {
        if inputField.text != nil && inputField.text != "" {
            let inputValue = inputField.text!.toInt()!
            let currentValue = outputField.text!.toInt()!
            let sum = inputValue + currentValue
            outputField.text = String(sum)
            inputField.text = ""
        }
    }
    
    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
}
