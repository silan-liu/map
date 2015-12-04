//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension Array {
    func myMap<U>(f: Element -> U) -> [U] {
        var result: [U] = []
        for elem in self {
            result.append(f(elem))
        }

        return result
    }

    func myFilter(f:Element -> Bool)-> [Element] {
        var result: [Element] = []
        for elem in self {
            if f(elem) {
                result.append(elem)
            }
        }
        
        return result
    }

    func myReduce<U>(initialValue: U, combine:(U, Element) -> U) -> U {
        var result = initialValue
        for elem in self {
            result = combine(result, elem)
        }

        return result
    }
}

func map<T, U>(array:[T], f:T -> U) -> [U] {
    var result: [U] = []
    for elem in array {
        result.append(f(elem))
    }

    return result
}

func filter<T>(array:[T], f:T -> Bool) -> [T] {
    var result: [T] = []
    for elem in array {
        if f(elem) {
            result.append(elem)
        }
    }

    return result
}

func reduce<T, U>(array:[T], _ initialValue: U, combine:(U, T) -> U) -> U {
    var result = initialValue
    for elem in array {
        result = combine(result, elem)
    }

    return result
}

let array = [1, 2, 3]
var t = map(array) { x in x + 1}
print(t)

t = array.myMap { return $0 + 2 }
print(t)

t = filter(array) { x in x > 1}
print(t)

t = array.myFilter {x in x > 2 }
print(t)

var l = reduce(array, 0) { result, x in
    return result + x
}
print(l)

l = array.myReduce(2, combine: {
    return $0 * $1
})
print(l)


let testArray = ["test1", "test2", "test3", ""]

let array1 = testArray.map { (str: String) -> Int? in
    let count = str.characters.count
    guard count > 0 else {
        return nil
    }

    return count
}

let array2 = testArray.flatMap { (str: String) -> Int? in
    let count = str.characters.count
    guard count > 0 else {
        return nil
    }

    return count
}


let formatter = NSNumberFormatter()
formatter.numberStyle = .SpellOutStyle
let string = "how11 are you3"
let result = string.characters.split(" ")
    .map {$0.count}
    .flatMap { (n: Int) in formatter.stringFromNumber(n) }
    .map { "\($0) letters" }
    .flatMap { $0.stringByAddingPercentEncodingWithAllowedCharacters(.URLFragmentAllowedCharacterSet()) }
    .flatMap { NSURL(string: "http://www.abc.com/\($0)") }


print(result)