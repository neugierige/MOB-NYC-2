//
//  Mammal.swift
//  Lesson03
//
//  Created by Anar Enhsaihan on 3/12/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import Foundation

class Mammal: Animal {
    
    override func prettyAnimalName() -> String {
        return "Mammal name: " + self.name
    }
}