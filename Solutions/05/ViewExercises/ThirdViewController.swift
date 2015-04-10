//
//  ThirdViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class ThirdViewController: ExerciseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 3"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: "next")
        /* TODO:
        Build four blue squares, 20 points wide, one in each corner of the screen.
        They must stay in their respective corners on device rotation. 
        
        Use Autolayout.
        
        Your view should be in self.exerciseView, not self.view
        */
        
        
        let navBarHeight = self.navigationController?.navigationBar.frame.height
        
        let boxDimension : CGFloat = 20
        let boxColor = UIColor.blueColor()
        
        let tlBox = UIView()
        let trBox = UIView()
        let blBox = UIView()
        let brBox = UIView()
        
        exerciseView.addSubview(tlBox)
        exerciseView.addSubview(trBox)
        exerciseView.addSubview(blBox)
        exerciseView.addSubview(brBox)
        exerciseView.setTranslatesAutoresizingMaskIntoConstraints(false)
        tlBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        trBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        blBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        brBox.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        
        let evTop = NSLayoutConstraint(
            item: exerciseView,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.topLayoutGuide,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 0.0)
        let evLeft = NSLayoutConstraint(
            item: exerciseView,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0,
            constant: 0.0)
        let evRight = NSLayoutConstraint(
            item: exerciseView,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1.0,
            constant: 0.0)
        let evBottom = NSLayoutConstraint(
            item: exerciseView,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.bottomLayoutGuide,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 0.0)
        view.addConstraints([evTop, evRight, evLeft, evBottom])
        
        let tlBoxTop = NSLayoutConstraint(item: tlBox, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0)
        let tlBoxLeft = NSLayoutConstraint(item: tlBox, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: exerciseView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        let tlBoxWidth = NSLayoutConstraint(item: tlBox, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: boxDimension)
        let tlBoxHeight = NSLayoutConstraint(item: tlBox, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: boxDimension)
        exerciseView.addConstraints([tlBoxTop, tlBoxLeft, tlBoxWidth, tlBoxHeight])
        
        let trBoxTop = NSLayoutConstraint(item: trBox, attribute: .Top, relatedBy: .Equal, toItem: exerciseView, attribute: .Top, multiplier: 1, constant: 0)
        let trBoxRight = NSLayoutConstraint(item: trBox, attribute: .Right, relatedBy: .Equal, toItem: exerciseView, attribute: .Right, multiplier: 1, constant: 0)
        let trBoxWidth = NSLayoutConstraint(item: trBox, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: boxDimension)
        let trBoxHeight = NSLayoutConstraint(item: trBox, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: boxDimension)
        exerciseView.addConstraints([trBoxTop, trBoxRight, trBoxWidth, trBoxHeight])
        
        let blBoxBottom = NSLayoutConstraint(item: blBox, attribute: .Bottom, relatedBy: .Equal, toItem: exerciseView, attribute: .Bottom, multiplier: 1, constant: -navBarHeight!)
        let blBoxLeft = NSLayoutConstraint(item: blBox, attribute: .Left, relatedBy: .Equal, toItem: exerciseView, attribute: .Left, multiplier: 1, constant: 0)
        let blBoxHeight = NSLayoutConstraint(item: blBox, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: boxDimension)
        let blBoxWidth = NSLayoutConstraint(item: blBox, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: boxDimension)
        exerciseView.addConstraints([blBoxBottom, blBoxLeft, blBoxHeight, blBoxWidth])
        
        let brBoxBottom = NSLayoutConstraint(item: brBox, attribute: .Bottom, relatedBy: .Equal, toItem: exerciseView, attribute: .Bottom, multiplier: 1, constant: -navBarHeight!)
        let brBoxRight = NSLayoutConstraint(item: brBox, attribute: .Right, relatedBy: .Equal, toItem: exerciseView, attribute: .Right, multiplier: 1, constant: 0)
        let brBoxHeight = NSLayoutConstraint(item: brBox, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: boxDimension)
        let brBoxWidth = NSLayoutConstraint(item: brBox, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: boxDimension)
        exerciseView.addConstraints([brBoxBottom, brBoxRight, brBoxHeight, brBoxWidth])
        
        tlBox.backgroundColor = boxColor
        trBox.backgroundColor = boxColor
        blBox.backgroundColor = boxColor
        brBox.backgroundColor = boxColor
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    func next() {
        self.performSegueWithIdentifier("four", sender: nil)
    }

}
