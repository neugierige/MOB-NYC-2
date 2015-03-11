import UIKit

class Vehicle { }

class Bus : Vehicle { }

class Bike : Vehicle { }

class Animal { }

class Dog : Animal, MakesSound {
    func sound() -> String {
        return "Woof"
    }
}

class Cat : Animal, MakesSound {
//    var description : String {
//        get {
//            return "Cat"
//        }
//    }
    func sound() -> String {
        return "Meow"
    }
}

protocol MakesSound {
//    var description : String { get  }
    func sound() -> String
}

func printTheSoundItMakes(object : MakesSound ) -> String {
//    object.
    return object.sound()
}

let aDog = Dog()
let aCat = Cat()

printTheSoundItMakes(aDog)
printTheSoundItMakes(aCat)



























