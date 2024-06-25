import Cocoa

struct AppData {
    static let version: String = "1.2.3"
    static let saveFilename: String = "settings.json"
}

struct Employee {
    var name: String
    var password: String
    
    static let example = Employee(name: "Mihai", password: "123")
}

Employee.example.name
Employee.example.password

// checkpoint6
struct Car {
    private let model: String
    private let numberOfSeats: Int
    private(set) var currentGear: Int
    
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = currentGear
    }
    
    mutating func gearUp() {
        if currentGear == 10 {
            print("Max gear!")
        } else {
            currentGear += 1
        }
    }
    
    mutating func gearDown() {
        if currentGear == 0 {
            print("Min gear!")
        } else {
            currentGear -= 1
        }
        
    }
}

var car = Car(model: "VW", numberOfSeats: 4, currentGear: 2)
car.gearUp()
print(car.currentGear)
car.gearUp()
print(car.currentGear)
car.gearDown()
print(car.currentGear)
car.gearDown()
print(car.currentGear)
car.gearDown()
print(car.currentGear)
car.gearDown()
print(car.currentGear)
car.gearDown()
print(car.currentGear)
