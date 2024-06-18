import Cocoa

enum PasswordError: Error {
    case short
    case obvious
}

func checkPassword(_ pass: String) throws -> String {
    if pass.count < 5 {
        throw PasswordError.short
    }
    if pass == "12345" {
        throw PasswordError.obvious
    }
    if pass.count < 8 {
        return "OK"
    } else if pass.count < 12 {
        return "Good"
    }
    else {
        return "Excellent"
    }
}

do {
    let result = try checkPassword("123")
    print(result)
} catch {
    if let resultError = error as? PasswordError {
        switch resultError {
        case .short:
            print("Password too short")
        case .obvious:
            print("Password too obvious")
        }
    }
}

enum CustomError: Error {
    case outOBounds
    case noRoot
}

func checkpoint4(number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw CustomError.outOBounds
    }
    
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    
    throw CustomError.noRoot
}

do {
    let result = try checkpoint4(number: 10_421)
    print(result)
} catch {
    if let error = error as? CustomError {
        switch error {
        case .outOBounds:
            print("Number is not in range.")
        case .noRoot:
            print("No root found.")
        }
    }
}


