//
//  FifthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FifthViewController: ExerciseViewController {
    
    // set properties for green button and center Y constraint of green button
    
    var greenButton : UIButton!
    var centerYConstraint : NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 5"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Create a green button with a red border that says ‘Tap me!’ (50px by 50px), center it in the middle of the screen.
        Once tapped, the button should animate up 20 pixels and turn red, then immediately back down 20 pixels and turn back to green. It should not be clickable while animating.
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        greenButton = UIButton()
        greenButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        greenButton.setTitle("Tap Me", forState: UIControlState.Normal)
        greenButton.backgroundColor = UIColor.greenColor()
        greenButton.layer.borderColor = UIColor.redColor().CGColor
        greenButton.layer.borderWidth = 1
        greenButton.addTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        exerciseView.addSubview(greenButton)
        
        
        // Constraints for green button
        
        let centerXConstraint = NSLayoutConstraint(item: greenButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        centerYConstraint = NSLayoutConstraint(item: greenButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        let heightConstraint = NSLayoutConstraint(item: greenButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 50)
        
        exerciseView.addConstraints([centerXConstraint, centerYConstraint, heightConstraint])
    }
    
    func buttonTapped(sender: UIButton) {
        
        greenButton.userInteractionEnabled = false
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
            
            self.greenButton.backgroundColor = UIColor.redColor()
            self.centerYConstraint.constant = -20
            self.view.layoutIfNeeded()
            
            }) { (NULL) -> Void in
                
                self.greenButton.backgroundColor = UIColor.greenColor()
                self.centerYConstraint.constant = 0
                self.view.layoutIfNeeded()
                
                self.greenButton.userInteractionEnabled = true
        }
        
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("six", sender: nil)
    }

}
