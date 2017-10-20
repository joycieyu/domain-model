//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
    public var amount : Double
    public var currency : String

    init(amount : Double, currency: String) {
        self.amount = amount
        self.currency = currency
        return
    }
    public func convert(_ to: String) -> Money {
        switch self.currency {
        case "USD" :
            switch to {
            case "GBP":
                return Money(amount: self.amount * 0.5, currency: "GBP" )
            case "EUR":
                return Money(amount: self.amount * 1.5, currency: "EUR" )
            case "CAN":
               return Money(amount: self.amount * 1.25, currency: "CAN" )
            default :
                return self
            }
        case "GBP" :
            switch to {
            case "USD" :
                return Money(amount: self.amount * 2, currency: "USD" )
            case "EUR":
                return Money(amount: self.amount * 3, currency: "EUR" )
            case "CAN":
                return Money(amount: self.amount * 1.64, currency: "CAN" )
            default :
                return self
            }
        case "EUR" :
            switch to {
            case "USD" :
                return Money(amount: self.amount * (2/3), currency: "USD" )
            case "GBP":
                return Money(amount: self.amount * 0.9, currency: "GBP" )
            case "CAN":
                return Money(amount: self.amount * 0.83, currency: "CAN" )
            default :
                return self
            }
        case "CAN" :
            switch to {
            case "USD" :
                return Money(amount: self.amount * 0.8, currency: "USD" )
            case "GBP":
                return Money(amount: self.amount * (1/3), currency: "GBP" )
            case "EUR":
                return Money(amount: self.amount * 1.2, currency: "EUR" )
            default :
                return self
            }
        default :
            return self
        }
    }
    
    public func add(_ to: Money) -> Money {
        if (to.currency != self.currency) {
            let selfConverted = self.convert(to.currency)
            return Money(amount: to.amount + selfConverted.amount, currency: to.currency)
        }
        return Money(amount: self.amount + to.amount, currency: self.currency)
    }
    
    public func subtract(_ from: Money) -> Money {
        if (from.currency != self.currency) {
            let selfConverted = self.convert(from.currency)
            return Money(amount: self.amount - selfConverted.amount, currency: from.currency)
        }
        return Money(amount: self.amount - from.amount, currency: self.currency)
    }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
    return
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
    switch type {
        case .Hourly(let pay) :
        return Int(Double(hours) * pay)
    case .Salary(let pay) :
        return pay
    }
  }
  
  open func raise(_ amt : Double) {
    switch type {
    case .Hourly(var pay) :
        pay = pay + amt
    case .Salary(var pay) :
       pay = Int(Double(pay) + amt)
    }
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0
    
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        return
    }
  fileprivate var _job : Job? = nil
  open var job : Job? {
    get {
        return self.job
    }
    set(value) {
        self.job = value
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get {
        return self.spouse
    }
    set(value) {
        self.spouse = value
    }
  }
  
  open func toString() -> String {
    return "[Person: firstName:\(self.firstName) lastName:\(self.lastName) age:\(self.age) job:\(self.job) spouse:\(self.spouse)]"
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
    self.members.append(spouse1)
    self.members.append(spouse2)
    return
  }
  
  open func haveChild(_ child: Person) -> Bool {
    //return members.contains(where: child -> Bool)
    return false
  }
  
  open func householdIncome() -> Int {
    var sum = 0
    for person in members {
        //sum += person.job.calculateIncome(0)
    }
    return sum
  }
}





