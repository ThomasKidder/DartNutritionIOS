//
//  NutrientIntake.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 11/2/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import Foundation


struct NutrientIntake {
    var recipeNutrient : Nutrient
    var currentIntake : Int
    var goalIntake : Int
    
    var predictedIntake : Int {
        return recipeNutrient.amount + currentIntake
    }
    
    init(recipeNutrient : Nutrient, currentIntake : Int, goalIntake : Int){
        self.recipeNutrient = recipeNutrient
        self.currentIntake = currentIntake
        self.goalIntake = goalIntake
    }
    
}
