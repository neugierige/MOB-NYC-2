// Playground - noun: a place where people can play

import UIKit


class Vehicle {
    var numberOfWheels = 0
}

class Bike : Vehicle {
}

class Bus : Vehicle {
    func numberOfPeopleInTheBus() -> Int {
        return 10
    }
}

var aBus = Bus()
aBus.numberOfWheels = 4

var aBike = Bike()
aBike.numberOfWheels = 2

func printVehicleDetails(aVehicle : Vehicle) -> String {
    if aVehicle is Bus {
        var bus = aVehicle as Bus
        return "its a bus with \(bus.numberOfPeopleInTheBus()) people"
    }
    return "this has \(aVehicle.numberOfWheels) wheels"
}


printVehicleDetails(aBus)
printVehicleDetails(aBike)


























