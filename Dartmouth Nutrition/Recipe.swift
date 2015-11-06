//
//  Recipe.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 11/3/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import Foundation

struct Recipe {
    var recipeId : Int = 0
    var name : String
    var venue : Int = 0
    var meal : Int = 0
    
    var nut : NutritionInfo
    
    init(name : String){
        self.name = name
        nut = NutritionInfo(calories: 300, fatCalories: 100, fatTotal: 3, fatSaturated: 1, fatTrans: 2, carbs: 10, sugar: 5, fiber: 5, protein: 3, cholesterol: 30, sodium: 30, potassium: 40, vitA: 30, vitC: 20, calcium: 40, iron: 10, thiamin: 10, niacin: 15, vitB6: 25, vitB12: 25, folacin: 10, phosphorus: 13, zinc: 35)
        
    }
    
}