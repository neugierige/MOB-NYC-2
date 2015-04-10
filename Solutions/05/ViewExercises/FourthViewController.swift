//
//  FourthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class FourthViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 4"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build a scroll view that takes up the entire screen. 
        
        In the scroll view, place a blue box at the top (20px high, 10px horizontal margins with the screen, a very tall (1000+px, width the same as the screen) purple label containing white text in the middle, and a red box at the bottom (20px high, 10px horizontal margins with the screen). The scroll view should scroll the entire height of the content.
        
        Use Autolayout.

        
        Your view should be in self.exerciseView, not self.view.
        */
        
        
        let scroller = UIScrollView()
        scroller.contentSize = CGSize(width: self.exerciseView.frame.width, height: 1040)
        scroller.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let redBox = UIView()
        redBox.backgroundColor = UIColor.redColor()
        redBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let blueBox = UIView()
        blueBox.backgroundColor = UIColor.blueColor()
        blueBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let purpleLabel = UILabel()
        purpleLabel.backgroundColor = UIColor.purpleColor()
        purpleLabel.textColor = UIColor.whiteColor()
        purpleLabel.textAlignment = .Center
        purpleLabel.text = "Hello World"
        purpleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        scroller.addSubview(blueBox)
        scroller.addSubview(purpleLabel)
        scroller.addSubview(redBox)
        
        exerciseView.addSubview(scroller)
        
        
        let toolBarHeight = 44.0
        let screenHeight = exerciseView.frame.height
        let screenWidth = exerciseView.frame.width
        let navBarHeight = self.navigationController?.navigationBar.frame.height
        
        
        // scroller constraints
        
        let scrollTop = NSLayoutConstraint(item: scroller, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        
        let scrollLeading = NSLayoutConstraint(item: scroller, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0)
        
        let scrollTrailing = NSLayoutConstraint(item: scroller, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0)
        
        let scrollBottom = NSLayoutConstraint(item: scroller, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        
        exerciseView.addConstraints([scrollTop, scrollLeading, scrollTrailing, scrollBottom])
        
        // blue box
        
        let blueTop = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: scroller, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        
        let blueCenterX = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: scroller, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        
        let blueHeight = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20)
        
        let blueWidth = NSLayoutConstraint(item: blueBox, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 20)
        
        // purple label
        
        let purpleTop = NSLayoutConstraint(item: purpleLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: blueBox, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        
        let purpleCenterX = NSLayoutConstraint(item: purpleLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: scroller, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        
        let purpleHeight = NSLayoutConstraint(item: purpleLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 1000)
        
        let purpleWidth = NSLayoutConstraint(item: purpleLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: scroller, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0)
        
        // red box
        
        let redTop = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: purpleLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0)
        
        let redCenterX = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: scroller, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0)
        
        let redHeight = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 20)
        
        let redWidth = NSLayoutConstraint(item: redBox, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 20)
        
        
        scroller.addConstraints([blueTop, blueCenterX, blueHeight, blueWidth, purpleTop, purpleCenterX, purpleHeight, purpleWidth, redTop, redCenterX, redHeight, redWidth])
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }
    
    func next() {
        self.performSegueWithIdentifier("five", sender: nil)
    }

}
