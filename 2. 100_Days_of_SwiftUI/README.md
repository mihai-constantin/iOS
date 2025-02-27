# [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui)

### Day 0
* Core features to learn: Swift, SwiftUI, Networking, Working with data, Version Control
* Extension skills: UIKit, Testing, Core Data, Architecture, Multithreading
* Resources:
    * https://developer.apple.com/tutorials/swiftui
    * https://www.apple.com/education/k12/learn-to-code/  

### Days 1-15 - Introduction to Swift
* Variables (var), constants (let)
* Data types: String, Int, Double, Bool
* String interpolation

```
# Multi-line string
var greeting = """
Hello,
playground
"""

# Int separator
var a = 100_000_000
```

* Complex data types: arrays, dictionaries, sets, tuples
* Type annotations
```
var greeting : String = "Hello"
var number   : Double = 10
```
* **If** statements, ternary conditional operator
* **Switch**, fallthrough
* **Loops**: for, while
* **Functions**, parameters, return values, default values, handling errors
* **Closures**, passing functions into functions
* **Structs**, mutating functions, computing properties, getters and setters
* didSet, willSet property observers
* Initializers
* **Access control**: public, private, fileprivate, private(set)
* Static properties and methods
* **Classes**, inheritance, deinitializer
* **Protocols**, **extensions**
* opaque return types: ``func f() -> some View { }``
* **Protocol extensions**
* **Optionals**, guard let, nil coalescing

### Days 16-18: Project 1 - WeSplit
* Forms, Pickers
* NavigationStack, navigationTitle
* **@State** wrapper, bindings

### Day 19: Challenge Project 1
* Unit Conversions App

### Days 20-22: Project 2 - Guess The Flag
* VStack, HStack, ZStack
* Colors and frames
* Gradients: Linear, Radial, Angular
* Buttons and Images
* Alerts

## Days 23-24: Project 3 - ColorsAndFrames
* Views and modifiers
* Conditional modifiers, custom modifiers
* Custom bindings

### Day 25: Milestone: Projects 1-3
* RockPaperScissors challenge

## Days 26-28: Project 4 - BetterRest
* Working with dates and stepper
* CreateML, CoreML
* Make predictions (CoreML) using a trained model (CreateML)

## Days 29-31: Project 5 - Word Scramble
* Working with lists, strings
* Loading file resources from app bundle
