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

// checkpoint7
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("[Dog] Bark")
    }
}

class Cat: Animal {
    
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("[Cat] Meow!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("[Corgi] Bark")
    }
}

class Poodle: Dog {
    override func speak() {
        print("[Poodle] Bark")
    }
}

class Persian: Cat {
    override func speak() {
        print("[Persian] Meow!")
    }
}

class Lion: Cat {
    override func speak() {
        print("[Lion] Meow!")
    }
}

var lion = Lion(legs: 4, isTame: false)
lion.speak()
var persian = Persian(legs: 4, isTame: true)
persian.speak()
var poodle = Poodle(legs: 4)
poodle.speak()
var corgi = Corgi(legs: 4)
corgi.speak()
