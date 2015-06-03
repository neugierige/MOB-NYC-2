// Playground - noun: a place where people can play

import UIKit
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely()

var str = "Hello, playground"

let url = NSURL(string: "http://mashable.com/stories.json")!

let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
    
    var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as NSDictionary
    
    var children = responseDictionary["new"] as NSArray
    for child in children {
        var title = child["title"] as String
    }
})
task.resume()

//
//let url = NSURL(string: "http://www.reddit.com/.json")!
//
//let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
//    
//    var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as NSDictionary
//    
//    var dataDictionary = responseDictionary["data"] as NSDictionary
//    var children = dataDictionary["children"] as NSArray
//    for child in children {
//        var childsData = child["data"] as NSDictionary
//        var title = childsData["title"] as String
//    }
//})
//task.resume()

//let url = NSURL(string: "http://google.com/")!
//
//let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
//
//    println(data)
//    var string = NSString(data: data, encoding: NSUTF8StringEncoding)!
//    println(string)
//    println(response)
//    println(error)
//
//})
//task.resume()
