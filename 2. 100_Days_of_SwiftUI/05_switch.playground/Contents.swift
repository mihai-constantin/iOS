import Cocoa

var x = 5

switch x {
case 5:
    print("5")
    fallthrough
case 4:
    print("4")
    fallthrough
case 3:
    print("3")
    
case 2:
    print("2")
    
default:
    print("default")
}
