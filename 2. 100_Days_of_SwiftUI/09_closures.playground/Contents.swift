import Cocoa

let sayHello = { (name: String) -> String in
    "Hello \(name)"
}

print(sayHello("Mihai"))

let x = {
    print("Good morning")
}
x()

var a = [1,2,3,4,5]

a.sort { (x: Int, y: Int) -> Bool in
    return x > y
}
print(a)

a.sort {
    return $0 < $1
}
print(a)

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        numbers.append(generator())
    }
    
    return numbers
}

let array = makeArray(size: 5) {
    Int.random(in: 0...100)
}
print(array)

func f(using f2: () -> ()) {
    f2()
}

f {
    print("Hello")
}


// MARK: - checkpoint5

// sorted, filter, map
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let result = luckyNumbers.filter {
    $0 % 2 == 1
}.sorted {
    $0 < $1
}.map { a in
    "\(a) is a lucky number"
}

for x in result {
    print(x)
}

