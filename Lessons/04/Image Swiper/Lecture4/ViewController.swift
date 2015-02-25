//
//  ViewController.swift
//  Lecture4
//
//  Created by Arun Nagarajan on 2/24/15.
//  Copyright (c) 2015 Arun Nagarajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var filenameField: UILabel!
    
    var previousRating = [String : String]()
    
    var fileName = "Unknown"
//    var myFileNames = ["myfloridapic.jpg", "mydog.jpg"]
    @IBAction func buttonClicked(sender: AnyObject) {
        setViewsToRandomColors()
        
        updateImageAndRating()
    }
    
    @IBAction func longPressed(sender: AnyObject) {
        NSLog("got long press")
        updateImageAndRating()

    }
    override func viewDidLoad() {
        updateImageAndRating()
    }
    
    func updateImageAndRating() {
        let randomInt = arc4random_uniform(9) + 1
        /*var paddedNumber = "\(randomInt).jpg"
        if randomInt < 10 {
        paddedNumber = "0\(randomInt).jpg"
        }*/
        
        fileName = randomInt < 10 ? "0\(randomInt).jpg" : "\(randomInt).jpg"
        
        imageView.image = UIImage(named: fileName)
        ratingLabel.text = previousRating[fileName]
        filenameField.text = fileName 
    }
    
    @IBAction func swipedUp(sender: AnyObject) {
        setViewsToRandomColors()
    }
    
    @IBAction func swipedRight(sender: AnyObject) {
        previousRating[fileName] = "👍 I like it"
        updateImageAndRating()
    }
    
    @IBAction func swipedLeft(sender: AnyObject) {
        previousRating[fileName] = "👎 I hate it"
        updateImageAndRating()
    }
    
    func setViewsToRandomColors() {
        labelField.backgroundColor = makeRandomColor()
        
        self.view.backgroundColor = makeRandomColor()
    }
    
    func makeRandomColor() -> UIColor {
        
        let redComp = CGFloat(arc4random_uniform(100))/100
        let greenComp = CGFloat(arc4random_uniform(100))/100
        let blueComp = CGFloat(arc4random_uniform(100))/100
        
        let randomColor = UIColor(red: redComp, green: greenComp, blue: blueComp, alpha: 1.0)
        
        return randomColor
        
    }
}

