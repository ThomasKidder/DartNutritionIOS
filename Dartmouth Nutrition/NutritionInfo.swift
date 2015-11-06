//
//  NutritionInfo.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 10/5/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import Foundation

struct NutritionInfo {
    var calories : Nutrient = Nutrient(name : "Calories", isGood: false)
    var fatCalories : Nutrient = Nutrient(name : "Calories from Fat", isGood: false)
    var fatTotal : Nutrient = Nutrient(name: "Fat", units: "g", isGood : false)
    var fatSaturated : Nutrient = Nutrient(name: "Saturated Fat", units: "g", isGood: false)
    var fatTrans : Nutrient = Nutrient(name: "Trans Fat", units: "g", isGood: false)
    var carbs : Nutrient = Nutrient(name: "Carbs", units: "g", isGood : false)
    var sugar : Nutrient = Nutrient(name: "Sugar", units: "g", isGood : false)
    var fiber : Nutrient = Nutrient(name: "Fiber", units: "g")
    var protein : Nutrient = Nutrient(name: "Protein", units: "g")
    
    var cholesterol : Nutrient = Nutrient(name: "Cholesterol", units: "mg", isGood: false)
    var sodium : Nutrient = Nutrient(name : "Sodium", units: "mg", isGood: false)
    var potassium : Nutrient = Nutrient(name : "Potassium", units: "mg")
    
    var vitA : Nutrient = Nutrient(name: "Vitamin A", units: "%")
    var vitC : Nutrient = Nutrient(name: "Vitamin C", units: "%")
    var calcium : Nutrient = Nutrient(name: "Calcium", units: "%")
    var iron : Nutrient = Nutrient(name: "Iron", units: "%")
    var thiamin : Nutrient = Nutrient(name: "Riboflavin", units: "%")
    var niacin : Nutrient = Nutrient(name: "Niacin", units: "%")
    var vitB6 : Nutrient = Nutrient(name: "Vitamin B6", units: "%")
    var vitB12 : Nutrient = Nutrient(name: "Vitamin B12", units : "%")
    var folacin : Nutrient = Nutrient(name : "Folacin", units : "%")
    var phosphorus : Nutrient = Nutrient(name : "Phosphorus", units: "%")
    var zinc : Nutrient = Nutrient(name : "Zinc", units: "%")
    
    // default init
    init(calories : Int = 0, fatCalories : Int = 0, fatTotal : Int = 0, fatSaturated : Int = 0, fatTrans: Int = 0, carbs: Int = 0, sugar: Int = 0, fiber : Int = 0, protein : Int = 0, cholesterol : Int = 0, sodium : Int = 0, potassium: Int = 0, vitA : Int = 0, vitC : Int = 0, calcium : Int = 0, iron : Int = 0, thiamin : Int = 0, niacin : Int = 0, vitB6: Int = 0, vitB12 : Int = 0, folacin : Int = 0, phosphorus : Int = 0, zinc : Int = 0){
        
        self.calories.amount = calories
        self.fatCalories.amount = fatCalories
        self.fatTotal.amount = fatTotal
        self.fatSaturated.amount = fatSaturated
        self.fatTrans.amount = fatTrans
        self.carbs.amount = carbs
        self.sugar.amount = sugar
        self.fiber.amount = fiber
        self.protein.amount = protein
        self.cholesterol.amount = cholesterol
        self.sodium.amount = sodium
        self.potassium.amount = potassium
        self.vitA.amount = vitA
        self.vitC.amount = vitC
        self.calcium.amount = calcium
        self.iron.amount = iron
        self.thiamin.amount = thiamin
        self.niacin.amount = niacin
        self.vitB6.amount = vitB6
        self.vitB12.amount = vitB12
        self.folacin.amount = folacin
        self.phosphorus.amount = phosphorus
        self.zinc.amount = zinc;
    }
    
    // creates customized goal intake based on user's
    // configured goal calories/fat/protein
    // vitamins and other things use defaults
    init(calories : Int, percentFat : Float, percentProtein : Float){
        let percentCarbs = 1.0 - percentFat - percentProtein
        
        let caloriesFat : Int = Int(Float(calories) * percentFat)
        let caloriesProtein : Int = Int(Float(calories) * percentProtein)
        let caloriesCarbs : Int = Int(Float(calories) * percentCarbs)
        
        let gramsFat = caloriesFat / Conversions.GramsFatToCalories
        let gramsSatFat = Int(Float(calories) * Defaults.percentSatFat) / Conversions.GramsFatToCalories
        let gramsTransFat = Int(Float(calories) * Defaults.percentTransFat) / Conversions.GramsFatToCalories
        let gramsProtein = caloriesProtein / Conversions.GramsProteinToCalories
        let gramsCarbs = caloriesCarbs / Conversions.GramsCarbsToCalories
        
        self.calories.amount = calories
        self.fatCalories.amount = caloriesFat
        self.fatTotal.amount = gramsFat
        self.fatSaturated.amount = gramsSatFat
        self.fatTrans.amount = gramsTransFat
        self.carbs.amount = gramsCarbs
        self.sugar.amount = Defaults.gramsSugar
        self.fiber.amount = Defaults.Fiber
        self.protein.amount = gramsProtein
        self.cholesterol.amount = Defaults.Cholesterol
        self.sodium.amount = Defaults.Sodium
        self.potassium.amount = Defaults.Potassium
        self.vitA.amount = Defaults.VitaminPercent
        self.vitC.amount = Defaults.VitaminPercent
        self.calcium.amount = Defaults.Calcium
        self.iron.amount = Defaults.Iron
        self.thiamin.amount = Int(Defaults.Thiamin)
        self.niacin.amount = Defaults.Niacin
        self.vitB6.amount = Defaults.VitaminPercent
        self.vitB12.amount = Defaults.VitaminPercent
        self.folacin.amount = Defaults.Folacin
        self.phosphorus.amount = Defaults.Phosphorus
        self.zinc.amount = Defaults.Zinc
    }
        
    func getNutrientIntake(currentNutrition : NutritionInfo, goalNutrition : NutritionInfo) -> [NutrientIntake] {
        
        var result = [NutrientIntake]()
        var currentNutrients : [Nutrient] = currentNutrition.getCompleteNutrientList()
        var goalNutrients : [Nutrient] = goalNutrition.getCompleteNutrientList()
        
        for (index, nutrient) in getCompleteNutrientList().enumerate() {
            result.append(NutrientIntake(recipeNutrient: nutrient, currentIntake : currentNutrients[index].amount, goalIntake : goalNutrients[index].amount))
        }
        
        return result
    }
    
    func getCompleteNutrientList() -> [Nutrient] {
        var result = [Nutrient]()
        
        result.append(calories)
        result.append(fatCalories)
        result.append(fatTotal)
        result.append(fatSaturated)
        result.append(fatTrans)
        result.append(carbs)
        result.append(sugar)
        result.append(fiber)
        result.append(protein)
        result.append(cholesterol)
        result.append(sodium)
        result.append(potassium)
        result.append(vitA)
        result.append(vitC)
        result.append(calcium)
        result.append(iron)
        result.append(thiamin)
        result.append(vitB6)
        result.append(vitB12)
        result.append(folacin)
        result.append(phosphorus)
        result.append(zinc)

        return result
    }
    
    
//    var
    
    
    
   // var fatCalories : Nutrient
//    var calories: Int
//    var fatCalories: Int
//    
//    //in grams
//    var fatTotal: Float
//    var fatSaturated: Float
//    var fatPolyUnSat: Float
//    var fatMonoUnSat: Float
//    var fatTrans: Float
//    var carbs: Int
//    var fiber: Int
//    var sugar: Int
//    var protein: Int
//    
//    //in mg
//    var cholesterol: Int
//    var sodium: Int
//    var potassium: Int
//
//    //in percent
//    var vitA: Int
//    var vitC: Int
//    var calcium: Int
//    var iron: Int
//    var thiamin: Int
//    var riboflavin: Int
//    var niacin: Int
//    var vitB6: Int
//    var vitB12: Int
//    var folacin: Int
//    var phosphorus: Int
//    var zinc: Int
    
    
}
