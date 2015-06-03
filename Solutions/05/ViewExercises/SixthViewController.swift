//
//  SixthViewController.swift
//  ViewExercises
//
//  Created by Rudd Taylor on 9/9/14.
//  Copyright (c) 2014 Rudd Taylor. All rights reserved.
//

import UIKit

class SixthViewController: ExerciseViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.exerciseDescription.text = "View 6"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.exerciseView.addSubview(tableView)
        self.tableView.frame = self.exerciseView.frame
        self.tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.navigationController!.navigationBar.frame), 0, 0, 0)
        self.tableView.autoresizingMask = self.exerciseView.autoresizingMask
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        /* TODO:
        The table view cells on this screen are blank.
        
        Add a label to each cell that is green and centered, and have its text say “Row {X}” (X is the row number of the cell). The tableview should rotate correctly. Use Autolayout.
        */
        
        var greenLabel = UILabel()
        greenLabel.backgroundColor = UIColor.greenColor()
        greenLabel.text = "Row \(indexPath.row)"
        greenLabel.textAlignment = .Center
        greenLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        cell?.addSubview(greenLabel)
        
        let labelCenterX = NSLayoutConstraint(item: greenLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: cell, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        let labelCenterY = NSLayoutConstraint(item: greenLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: cell, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        let labelHeight = NSLayoutConstraint(item: greenLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: cell, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let labelWidth = NSLayoutConstraint(item: greenLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: cell, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        
        cell?.addConstraints([labelCenterX, labelCenterY, labelHeight, labelWidth])
        
        return cell!
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
}
