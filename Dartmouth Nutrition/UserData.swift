//
//  UserData.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 11/5/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import Foundation


struct Conversions {
    static let GramsFatToCalories : Int = 9
    static let GramsCarbsToCalories : Int = 4
    static let GramsProteinToCalories : Int = 4
    
}
//based on DV
//DV doesn't give all percentages, but American Heart Association recommends 7% or less sat fat and 1% or less trans fats
struct Defaults {
    static let Calories : Int = 2000
    
    //based on American Dietary Guidelines 
    // recommended 20-35% - DV default : 30%
    static let percentFat : Float = 0.3
    // recommended 10-35% - DV default : 10%
    static let percentProtein : Float  = 0.1
    //carbs should be between 45-65% - DV default : 60%
    //carbs are derived as 100% - fat - protein

    // no DV for sugar -- this is why https://www.quora.com/Why-dont-U-S-food-labels-include-a-Daily-Value-for-sugar
    // hard to provide a reasonable guidelines -- something that should be discussed
    static let gramsSugar : Int = 100
    
    // based on American Heart Association
    // probably shouldn't be configurable
    static let percentSatFat : Float = 0.07
    static let percentTransFat : Float = 0.01

    //in g
    static let Fiber : Int = 25
    
    //in mg
    static let Cholesterol : Int = 300
    static let Sodium : Int = 2400
    static let Potassium : Int = 3500
    static let Calcium : Int = 1000
    static let Iron : Int = 18
    static let Thiamin : Float = 1.5
    static let Riboflavin : Float = 1.7
    static let Niacin : Int = 20
    static let Phosphorus : Int = 1000
    static let Zinc : Int = 15
    
    //in mcg
    static let Folacin : Int = 400
    
    //in % ; there are International Units (IU) but nutrition info is just % for vitamins usually
    static let VitaminPercent : Int = 100
    
    
}
struct GlobalUserData {
    //configurables (calories / protein / fat)
    static var goalCalories = Defaults.Calories
    static var goalPercentFat = Defaults.percentFat
    static var goalPercentProtein = Defaults.percentProtein
    
    static var currentIntake = NutritionInfo()
    static var goalIntake = NutritionInfo(calories: goalCalories, percentFat: goalPercentFat, percentProtein: goalPercentProtein)
    static var recipes = [Recipe]()
}