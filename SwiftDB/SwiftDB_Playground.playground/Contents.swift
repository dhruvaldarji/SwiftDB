//
//  SwiftDB_Playground.playground
//  SwiftDB
//
//  Created by Dhruval Darji on 3/14/16.
//  Copyright © 2016 Dhruval Darji. 
//  All rights reserved.
//


import Cocoa


let AppName = "SwiftDB"

var str = "Hello, " + AppName

func printBreak() {
    print()
    print()
    print()
}

protocol SwiftProtocol {
    // Protocol definition goes here.
}


protocol AnotherOne {
    // Protocol definition goes here.
}


struct SwiftStructure : SwiftProtocol, AnotherOne {
    // Structure definition goes here.
}


class SuperClass {
    func SayHello(){
        print("Hello!")
    }
}

class SubClass: SuperClass {
    var HelloString = "Hello"
    func SayHello(Name : String) -> Void {
        print(HelloString + ", " + Name)
    }
}

let BaseObject = SuperClass()
BaseObject.SayHello()

let EnhancedObject = SubClass()
EnhancedObject.SayHello(AppName);


class SwiftClass: SuperClass, SwiftProtocol, AnotherOne {
    // Class definition goes here.
}

printBreak()


class GraphicObject {
    func Draw(){
        print("Nothing")
    }
}

class Ship: GraphicObject {
    override func Draw(){
        print("Spaceship")
    }
}

class EmpireSpaceship: Ship {
    override func Draw() {
        print("Empire Spaceship");
    }
}

class RebelSpaceship: Ship {
    override func Draw() {
        print("Rebel Spaceship");
    }
}

class DeathStar: GraphicObject {
    override func Draw() {
        print("The Death Star")
    }
}

let SpaceShips = [EmpireSpaceship(), RebelSpaceship(), DeathStar()]

for ship in SpaceShips {
    ship.Draw()
}


var myVariable : Int = 10
var myString : String = "Dhruval was here."


typealias AudioSample = UInt16

// Once you define the type alias you can use it anywhere.

var MaxAmplitudeFound = AudioSample.min;
// Max Amplitude is now 0



let possibleString : String? = "An Optional String."

let forcedeString : String = possibleString!
// Note: Forced requires exclamation mark.

let assumedString : String! = "An Implicitly Unwrapped Optional String."
let implicitString : String = assumedString
// Note: No need for an exclamation mark.


printBreak()


(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")

for index in 1...5 {
    print ("\(index) times 5 is \(index * 5)")
}

printBreak()


