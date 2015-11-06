//
//  SearchViewController.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 10/19/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import UIKit

class MenuSearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {

    var menuFilter = MenuFilter()
    var allRecipes = [Recipe]()
    var shownRecipes = [Recipe]()
    
    @IBOutlet weak var mealSelector: UISegmentedControl!{
        didSet{
            menuFilter.meal = mealSelector.selectedSegmentIndex
        }
    }
    @IBOutlet weak var venueSelector: UISegmentedControl!{
        didSet{
            menuFilter.venue = venueSelector.selectedSegmentIndex
        }
    }
    @IBOutlet weak var searchField: UISearchBar!{
        didSet{
            searchField.delegate = self
        }

    }

    @IBOutlet weak var recipeTableView: UITableView!{
        didSet{
            recipeTableView.delegate = self
            recipeTableView.dataSource = self
        }
    }
//    @IBOutlet weak var mealSelector: UISegmentedControl!{
//        didSet{
//            filter.meal = mealSelector.selectedSegmentIndex
//        }
//    }
//
//    @IBOutlet weak var venueSelector: UISegmentedControl!{
//        didSet{
//            filter.venue = mealSelector.selectedSegmentIndex
//        }
//    }
//    
//    @IBOutlet weak var searchField: UISearchBar!{
//        didSet{
//            searchField.delegate = self
//        }
//    }
    
    var recipeTable : RecipeTableViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allRecipes.append(Recipe(name: "Grilled Chicken"))
        allRecipes.append(Recipe(name: "Broccoli"))
        allRecipes.append(Recipe(name: "Chicken Noodle Soup"))
        allRecipes.append(Recipe(name: "BBQ Chicken Pizza"))
        allRecipes.append(Recipe(name: "Vegetable Pizza"))
        allRecipes.append(Recipe(name: "Hawaiian Pizza"))
        allRecipes.append(Recipe(name: "Cereal"))
        allRecipes.append(Recipe(name: "Yogurt"))
        allRecipes.append(Recipe(name: "Grilled Salmon"))
        allRecipes.append(Recipe(name: "Tomato Soup"))
        allRecipes.append(Recipe(name: "Vanilla Ice Cream"))
        allRecipes.append(Recipe(name: "Chocolate Chip Cookies"))

        
        shownRecipes = allRecipes;

        // Do any additional setup after loading the view.
    }
    
    func printSomething(){
        print("I printed something")
    }
    
    @IBAction func mealChange(sender: UISegmentedControl) {
        menuFilter.meal = sender.selectedSegmentIndex
        reloadRecipes()
    }
    
    @IBAction func venueChange(sender: UISegmentedControl) {
        menuFilter.venue = sender.selectedSegmentIndex
        reloadRecipes()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        menuFilter.searchText = searchText
        reloadRecipes()
    }
//    @IBAction func mealChange(sender: UISegmentedControl) {
//        filter.meal = sender.selectedSegmentIndex
//        reloadRecipes()
//    }
//
//    @IBAction func venueChange(sender: UISegmentedControl) {
//        filter.venue = sender.selectedSegmentIndex
//        reloadRecipes()
//    }
//    
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        filter.searchText = searchBar.text!
//        reloadRecipes()
//        searchBar.resignFirstResponder()
//    }
    
    /* MARK - TableView
    // This contains the required methods for the tableview delegate/source methods
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //right now only one section for all the food, could potentially 
        //be divisions for entrees etc
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownRecipes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //        let cell = tableView.dequeueReusableCellWithIdentifier("Recipe", forIndexPath: indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell", forIndexPath: indexPath) as UITableViewCell
        
        
        // Configure the cell...
        cell.textLabel?.text = shownRecipes[indexPath.row].name
        //        cell.textLabel?.text = "My text"
        return cell
    }
    
    func reloadRecipes(){
        shownRecipes = menuFilter.filter(allRecipes)
        self.recipeTableView.reloadData()
    }
    
    @IBAction
    func comingBack(segue : UIStoryboardSegue){
        print("I came back")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! UINavigationController
        if let target = destination.topViewController as? RecipeViewController {
            let recipeIndex = recipeTableView.indexPathForSelectedRow!.row
            target.recipe = shownRecipes[recipeIndex]
            print(shownRecipes[recipeIndex].name)
        }
    }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



}
