//
//  ViewController.swift
//  Lesson 8
//
//  Created by Anar Enhsaihan on 4/19/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit
import SwiftyJSON




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        makeGoogleCall()
        makeCallToNowhere()
        makeRegularJSONCall()
        makeSwiftyJSONCall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //TODO one: Write and call a function that make a successful network connection to google.com using core networking APIs, then print out the results.
    
    func makeGoogleCall() {
        
        let url = NSURL(string: "http://google.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            if (error == nil) {
                println(data)
            }
        })
        task.resume()
    }
    
    //TODO two: Write and call a function that makes a failing network connection (using core networking APIs) to http://generalassemb.ly/foobar.baz, a nonexistant page. Print out the status code and body of the response.
    
    func makeCallToNowhere() {
        
        let url = NSURL(string: "http://generalassemb.ly/foobar.baz")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            if error == nil {
                
                if let responseObj = response as? NSHTTPURLResponse {
                    println(responseObj.statusCode)
                }
            }
        })
        task.resume()
    }
    
    //TODO three: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON using core networking APIs. Create a model class that corresponds to the JSON response object, populate it with the contents of that JSON using NSJSONSerialization, then print out the model.
    
    func makeRegularJSONCall() {
        
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=New%20York,US")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            if error == nil {
                
                var jsonError : NSError?
                var jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &jsonError) as! NSDictionary
                
                var model = Model()
                
                model.coord = jsonDict["coord"] as! NSMutableDictionary
                model.sys = jsonDict["sys"] as! NSMutableDictionary
                model.weather = jsonDict["weather"] as! NSArray
                model.main = jsonDict["main"] as! NSMutableDictionary
                
                println(model.sys)
                
            }
            
        })
        task.resume()
    }
    
    //TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.

    func makeSwiftyJSONCall() {
        
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=New%20York,US")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            if (error == nil) {
                
                let json = JSON(data: data, options: NSJSONReadingOptions.allZeros, error: nil)
                
                var model = Model()
                
                model.coord["lon"] = json["coord"]["lon"].double
                model.coord["lat"] = json["coord"]["lat"].double
                
                println(model.coord)
            }
        })
        task.resume()
    }

}












