import Cocoa

struct Employee {
    var name: String
    var vacationRemaining: Int
    
    init(name: String, vacationRemaining: Int) {
        self.name = name
        self.vacationRemaining = vacationRemaining
    }
    
    mutating func takeVacation(for days: Int) {
        if vacationRemaining >= days {
            vacationRemaining -= days
        } else {
            print("You can't take any more days off!")
        }
    }
}

var e1 = Employee(name: "Mihai", vacationRemaining: 20)
e1.takeVacation(for: 5)
print(e1.vacationRemaining)

//var e2 = Employee(name: "Maria", vacationRemaining: 10)

var e2 = e1 // value
print("initial: \(e2.vacationRemaining)")
e1.vacationRemaining = 5
print("final: \(e2.vacationRemaining)")

class Person {
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
}

var p1 = Person(age: 10)
var p2 = p1 // reference

print("initial: \(p1.age)")
p2.age = 17
print("final: \(p1.age)")
