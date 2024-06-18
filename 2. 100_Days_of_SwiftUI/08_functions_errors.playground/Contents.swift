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
