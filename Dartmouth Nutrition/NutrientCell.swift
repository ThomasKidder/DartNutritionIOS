//
//  NutritionFactCell.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 11/2/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import UIKit

class NutrientCell: UITableViewCell {
    
    //the name of this nutrient as well as the amount of that nutrient in this cell
    @IBOutlet weak var recipeNutrientLabel: UILabel!
    
    @IBOutlet weak var currentIntakeLabel: UILabel!
    //what the users current intake of this nutrient is
    
    @IBOutlet weak var predictedIntakeLabel: UILabel!
    //what the users intake of this nutrient will be after consuming this food item
    
    var nutrientIntake : NutrientIntake? {
        didSet {
            updateUI()
        }
    }

    
    func updateUI(){
        if let intake = nutrientIntake {
            let nut = intake.recipeNutrient
            recipeNutrientLabel.text = "\(nut.name) : \(nut.amount)\(nut.units)"
//            currentIntakeLabel.text = "\(intake.currentIntake)\(nut.units)"
//            predictedIntakeLabel.text = "\(intake.predictedIntake)\(nut.units)"
        }
    }
    
}
