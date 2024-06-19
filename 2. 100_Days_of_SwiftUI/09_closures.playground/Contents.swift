import Cocoa

let sayHello = { (name: String) -> String in
    "Hello \(name)"
}

print(sayHello("Mihai"))

var a = [1,2,3,4,5]

a.sort { (x: Int, y: Int) -> Bool in
    return x > y
}

print(a)
