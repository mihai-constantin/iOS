import Cocoa

// MARK: - Protocols

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
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
car.currentPassengers = 2
print(car.currentPassengers)

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
