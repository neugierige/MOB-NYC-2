//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    @IBOutlet weak var inputField: UITextField!
    
    @IBOutlet weak var outputField: UILabel!
    
    @IBAction func printEventOrOdd(sender: AnyObject) {
        let inputValue = inputField.text!.toInt()!
        
//        if inputValue % 2 == 0 {
//            outputField.text = "Its even"
//        } else {
//            outputField.text = "Its odd"
//        }
//        
        outputField.text = inputValue % 2 == 0 ? "Its even" :  "Its odd"
        
    }
    
}
