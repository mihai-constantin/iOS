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
