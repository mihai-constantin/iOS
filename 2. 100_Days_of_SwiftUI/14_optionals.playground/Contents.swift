import Cocoa

func double(number: Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}
let input = 5

var x = double(number: input)

let dict = [
    "A": 97,
    "B": 98,
    "C": 99
]

let value = dict["A"] ?? 0 // value - Int

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let letter = book?.author?.first?.uppercased() ?? "A"
print(letter)

// MARK: - checkpoint 9

func f(array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

f(array: nil)
f(array: [])
f(array: [1, 2, 3, 4, 5])
