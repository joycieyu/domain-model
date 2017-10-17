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
    public var amount : Int
    public var currency : String

    init(amount : Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    public func convert(_ to: String) -> Money {
        return self
    }

    public func add(_ to: Money) -> Money {
        return Money(amount: self.amount + to.amount, currency)
    }
    
    public func subtract(_ from: Money) -> Money {
        return Money(amount: self.amount - from.amount, currency)
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
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
    return self.type.Hourly * hours
  }
  
  open func raise(_ amt : Double) {
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
    return
  }
  
  open func toString() -> String {
    return self.firstName + " " + self.lastName
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
    return members.contains(where: (child) -> Bool)
  }
  
  open func householdIncome() -> Int {
    return sum(members.income)
  }
}





