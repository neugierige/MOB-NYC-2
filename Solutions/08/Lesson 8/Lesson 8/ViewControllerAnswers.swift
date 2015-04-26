//
//  ViewController.swift
//  Lesson 8
//
//  Created by Anar Enhsaihan on 4/19/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit
import SwiftyJSON

//TODO one: Write and call a function that make a successful network connection to google.com using core networking APIs, then print out the results.

//TODO two: Write and call a function that makes a failing network connection (using core networking APIs) to http://generalassemb.ly/foobar.baz, a nonexistant page. Print out the status code and body of the response.

//TODO three: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON using core networking APIs. Create a model class that corresponds to the JSON response object, populate it with the contents of that JSON using NSJSONSerialization, then print out the model.

//TODO four: Make a successful network connection to http://api.openweathermap.org/data/2.5/weather?q=New%20York,US, an API that speaks JSON. Populate a your above-defined model with the contents of that JSON using SwiftyJSON, then print out the model.


class ViewControllerAnswers: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todoThree()
        todoFour()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func todoOne() {
        makeNetworkCall(NSURL(string: "http://google.com")!)
    }
    
    func todoTwo() {
        let url = NSURL(string: "http://generalassemb.ly/foobar.baz")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            println(response)
        })
        task.resume()
    }
    
    func todoThree() {
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=New%20York,US,")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            var jsonError: NSError?
            let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as! NSDictionary
            
            if let unwrappedError = jsonError {
                println("json error: \(unwrappedError)")
            } else {
                
                var model = Model()
                
                model.coord = jsonDict.valueForKeyPath("coord") as! NSMutableDictionary
                model.sys = jsonDict.valueForKeyPath("sys") as! NSMutableDictionary
                model.weather = jsonDict.valueForKeyPath("weather") as! NSArray
                model.main = jsonDict.valueForKeyPath("main") as! NSMutableDictionary
                model.wind = jsonDict.valueForKeyPath("wind") as! NSMutableDictionary
                model.clouds = jsonDict.valueForKeyPath("clouds") as! NSMutableDictionary
                model.dt = jsonDict.valueForKeyPath("dt") as! Int
                model.id = jsonDict.valueForKeyPath("id") as! Int
                model.name = jsonDict.valueForKeyPath("name") as! String
                model.cod = jsonDict.valueForKeyPath("cod") as! Int
                
                println(model)
            }
        })
        task.resume()
    }
    
    func todoFour() {
        let url = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?q=New%20York,US,")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            var jsonError: NSError?
            
            let json = JSON(data: data, options: .allZeros, error: &jsonError)
            
            if let unwrappedError = jsonError {
                println("json error: \(unwrappedError)")
                
            } else {
                var model = Model()
                
                model.coord["lon"] = json["coord"]["lon"].double
                model.coord["lat"] = json["coord"]["lat"].double
                
            }
            
            
            
            
            
        })
        task.resume()
    }
    
    func makeNetworkCall(url: NSURL) {
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            let string = NSString(data: data, encoding: NSUTF8StringEncoding)
            println(string)
        })
        task.resume()
    }
    
}

