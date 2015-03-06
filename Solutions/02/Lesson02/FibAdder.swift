//
//  FibAdder.swift
//  Lesson02
//
//  Created by Arun Nagarajan on 3/5/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class FibAdder {
//    func fibonacciNumberAtIndex(index : Int) -> Int {
//        var previousMinus2 = 0
//        var previousMinus1 = 1
//        var current = 1
//        
//        if index <= 1 { return 0 }
//        
//        for i in 2...index {
//            current = previousMinus2 + previousMinus1
//            
//            previousMinus1 = previousMinus2
//            previousMinus2 = current
//        }
//        
//        return current
//    }
//
    func fibRecursive(index : Int) -> Int {
        if index == 1 { return 0 }
        if index == 2 { return 1 }
        
        return fibRecursive(index - 1 ) + fibRecursive(index - 2)
    }
}