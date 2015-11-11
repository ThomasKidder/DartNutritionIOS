//
//  Nutrient.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 11/2/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import Foundation

struct Nutrient : CustomStringConvertible {
    var name : String
    var isGood : Bool
    var units : String
    var amount : Int
    
    var description : String {
        return name + units
    }
    
    init(name : String, isGood : Bool = true, units : String = "", amount : Int = 0){
        self.name = name
        self.isGood = isGood
        self.units = units
        self.amount = amount
    }
    
}
