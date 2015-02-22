// Playground - noun: a place where people can play

import UIKit

let str = "Hello, playground"
println(str)

5+5

let welcome = "hello"
let name : String = "arun"

var friendsName : String

let currentYear : Int = 2015


let welcomemssage = welcome + " " + name

var nicermessage = "hello \(name)!!"

nicermessage.hasSuffix("arun!!")

"hello world".hasPrefix("k")

nicermessage.isEmpty

//String
//Int
//Float
//Double
//Bool

var number = 10.011

10 + 1
10 - 1

10.0 / 3

11 % 2

var k = 10

if k % 3 == 1 {
    println("remainder is 1")
}

k % 2

welcome + String(1)

arc4random_uniform(100)

welcome
//----

// create variable called temp
// if temprature is less than 20 print - too cold
// if temprature is more than 20 but less than 60 - still cold
// if more than 60 - spring time


let temp = arc4random_uniform(110)

if temp <  20 {
    println("brrr")
} else if temp >= 20 && temp < 60 {
    println("getting warmer")
} else {
    println("yay spring!")
}

var myFavoriteColors : [String] = ["Green", "Purple", "Red"]
myFavoriteColors.count

var myOthersColors = ["Blue"]

var allColors = myFavoriteColors + ["Black"]


//myFavoriteColors[6] = "yellow"

myFavoriteColors.removeAtIndex(0)
myFavoriteColors

let boros = ["Manhattan", "Staten Island", "Brooklyn", "Bronx", "Queens"]

// traditional for-loop

// Take note that in addition to incrementing by using the ++ operator,
// You can also decrement using the -- operator, such as i--
// Just make sure to set up your initial iterator and condition correctly!

for var i = 0; i < boros.count; i++ {
    
    println("The index of \(boros[i]) is \(i)")
    
}

// for-in loop

for boro in boros {
    
    println("Welcome to \(boro)")
}

var boroCount = 0

var i = 10

i = i + 1
i += 1
i++

while boroCount < 5 {
    println("current boro is \(boros[boroCount])")
    boroCount++
}

for i in 1...10 {
    println(i)
}

for var i = 1; i <= 10 ; i++ {
    print(i)
}

//
//"Write a program that prints the numbers from 1 to 100. 
//But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. 
//For numbers which are multiples of both three and five print “FizzBuzz”."

for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        println("FizzBuzz")
    } else if i % 3 == 0 {
        println("Fizz")
    } else if i % 5 == 0 {
        println("Buzz")
    } else  {
        println(i)
    }
}

for i in 1...100 {
    var toPrint = ""
    i % 3 == 0 ? toPrint.join(["Fizz"]) : ""
    i % 5 == 0 ? toPrint.join(["Buzz"]) : ""
    if toPrint.isEmpty {
        toPrint = String(i)
    }
    println(toPrint)
}

var z = 1

if z == 1 {
    println("its 1")
} else {
    println("its not one")
}

println(z == 1 ? "its 1" : "its not one")



func sayHello() {
    println("hello world!")
}

sayHello()
arc4random_uniform(10)


func sayHelloTo(name: String, day: String) -> String {
    sayHello()
    return "hello \(name), have a good \(day)!"
}

var finalMessage = sayHelloTo("arun", "thursday")

var anotherMessage = sayHelloTo("Danning", "thursday")






