//
//  MapViewController.swift
//  Lesson04
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var dict : [String : String] = [:]
    
    var arrayOfKeys = [String]()
    var arrayOfValues = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        TODO three: Add TWO text views and a table view to this view controller, either using code or storybaord. Accept keyboard input from the two text views. When the 'return' button is pressed on the SECOND text view, add the text view data to a dictionary. The KEY in the dictionary should be the string in the first text view, the VALUE should be the second.
        TODO four: Make this class a UITableViewDelegate and UITableViewDataSource that supply this table view with cells that correspond to the values in the dictionary. Each cell should print out a unique pair of key/value that the map contains. When a new key/value is inserted, the table view should display it.
        TODO five: Make the background of the text boxes in this controller BLUE when the keyboard comes up, and RED when it goes down. Start with UIKeyboardWillShowNotification and NSNotificationCenter.
        */
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showKeyboard", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hideKeyboard", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dict.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("reusableCell") as UITableViewCell
        
        cell.textLabel?.text = "\(arrayOfKeys[indexPath.row]) : \(arrayOfValues[indexPath.row])"
        
        return cell
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        let textEntry = textField.text
        
        if (textEntry != nil) {
            
            let topText = topTextField.text
            let bottomText = bottomTextField.text
            
            dict[topText] = bottomText
            
            topTextField.text = ""
            bottomTextField.text = ""
            
            addKeysAndValuesToDict()
            
            tableView.reloadData()
        }
        
        textField.resignFirstResponder()
        
        return false
    }
    
    func addKeysAndValuesToDict() {
        
        arrayOfKeys = dict.keys.array
        arrayOfValues = dict.values.array
    }
    
    func showKeyboard() {
        
        topTextField.backgroundColor = UIColor.blueColor()
        bottomTextField.backgroundColor = UIColor.blueColor()
    }
    
    func hideKeyboard() {
        
        topTextField.backgroundColor = UIColor.redColor()
        bottomTextField.backgroundColor = UIColor.redColor()
    }

    
    
}












