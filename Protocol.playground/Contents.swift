//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol FoodConsumer {
    var calerieCount: Double { get set }
    var hydrationLevel: Double { get set }
}

protocol Food {
    func beConsumedBy<T: FoodConsumer>(inout consumer: T, grams: Double)
}

extension FoodConsumer {
    mutating func eat(food: Food, grams: Double) {
        food.beConsumedBy(&self, grams: grams)
    }
}

struct Cat: FoodConsumer {
    var calerieCount: Double = 0
    var hydrationLevel: Double = 0
}

struct Kibble: Food {
    let caloriesPerGram: Double = 40

    func beConsumedBy<T : FoodConsumer>(inout consumer: T, grams: Double) {
        consumer.calerieCount += grams * caloriesPerGram
    }
}

// @objc can have optional methods and only Class can confirm it
@objc protocol ObjcProtocol {
    optional func test()
    func print()
}

// only Class can confirm it
protocol ClassProtocol: class {
    func test()
}

class qq: ClassProtocol {
    func test() {

    }
}

class Dog: ObjcProtocol {
    @objc func print() {

    }
}

var cat = Cat(calerieCount: 10, hydrationLevel: 12)
let kibble = Kibble()
cat.eat(kibble, grams: 10)
print(cat.calerieCount)
