import Cocoa

// MARK: - Protocols

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
    func canTakeMorePassengers() -> Bool
}

extension Vehicle {
    func canTakeMorePassengers() -> Bool {
        return currentPassengers <= 4
    }
}

struct Car: Vehicle {
    var name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("Driving \(distance) km")
    }
}

struct Bicycle: Vehicle {
    var name = "Bicycle"
    var currentPassengers = 2
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("Cycling \(distance) km")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too long")
    } else {
        vehicle.travel(distance: distance)
    }
}

var car = Car()
commute(distance: 5000, using: car)
print(car.name)
print(car.currentPassengers)
car.currentPassengers = 4
print(car.currentPassengers)
print(car.canTakeMorePassengers())

var bike = Bicycle()
print(bike.name)
print(bike.currentPassengers)
bike.currentPassengers = 4
print(bike.currentPassengers)
commute(distance: 100, using: bike)

// MARK: - Extensions

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var text = "    Hello there!    "
print(text.trimmed())

var quote = "         Luke, I am your father!    "
quote.trim()
print(quote)

var multiLine = """
This is a multi line
text
good morning
"""

print(multiLine.lines.count)

// MARK: - Protocol Extensions

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hello! I'm \(name).")
    }
}

struct Employee: Person {
    let name: String
}

var employee = Employee(name: "Bob")
employee.sayHello()

// checkpoint 8

protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get }
    var agent: String { get }
    
    func summary()
}

extension Building {
    func summary() {
        print("Agent: \(agent); Number of rooms: \(numberOfRooms); Cost: \(cost)")
    }
}

struct House: Building {
    let numberOfRooms: Int
    let cost: Int
    let agent: String
}

struct Office: Building {
    let numberOfRooms: Int
    let cost: Int
    let agent: String
}

let house = House(numberOfRooms: 4, cost: 100_000, agent: "Agent 007")
house.summary()
let office = Office(numberOfRooms: 20, cost: 500_000, agent: "Office Agent")
office.summary()
