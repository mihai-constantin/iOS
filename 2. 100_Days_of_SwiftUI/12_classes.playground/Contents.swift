import Cocoa

// MARK: - Reference

class Person {
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
}

var p1 = Person(age: 10)
var p2 = p1

p2.age = 20
print(p1.age)

// MARK: - Inheritance

class Vehicle {
    var isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    var isConvertible: Bool // = false
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

var teslaX = Car(isElectric: true, isConvertible: false)

//var teslaX = Car(isElectric: true)
print(teslaX.isElectric)
print(teslaX.isConvertible)
