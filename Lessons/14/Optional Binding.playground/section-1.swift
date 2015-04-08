// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var name : String?

name = "arun"
//name = nil

//bad!!
println(name!)

if name != nil {
    println(name!)
}

//optional binding
if let nonNilName = name {
    println(nonNilName)
}
