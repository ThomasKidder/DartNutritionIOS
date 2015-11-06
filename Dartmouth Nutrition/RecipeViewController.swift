//
//  RecipeViewController.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 11/2/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var recipe : Recipe? {
        didSet {
            intakes = recipe!.nut.getNutrientIntake(GlobalUserData.currentIntake, goalNutrition: GlobalUserData.goalIntake)
        }
    }
    var intakes : [NutrientIntake] = [NutrientIntake]()
    var recipeTitle : String = "" {
        didSet{
            recipeNameLabel.text = recipeTitle
        }
    }
        
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    @IBOutlet weak var recipeTableView: UITableView! {
        didSet{
            recipeTableView.delegate = self
            recipeTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(recipe == nil){
            print("Recipe is nil")
        } else {
            print(recipe!.name)
            print(recipe!.nut.getCompleteNutrientList().count)
            intakes = recipe!.nut.getNutrientIntake(GlobalUserData.currentIntake, goalNutrition: GlobalUserData.goalIntake)
        }
        recipeTitle = recipe!.name
        recipeTableView.reloadData()
        print("Reloading data")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intakes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NutrientCell", forIndexPath: indexPath) as! NutrientCell
        
        cell.nutrientIntake = intakes[indexPath.row]
        return cell
    }
    
}
