//
//  SearchViewController.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 10/19/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    var filter = MenuFilter()
    
    @IBOutlet weak var mealSelector: UISegmentedControl!{
        didSet{
            filter.meal = mealSelector.selectedSegmentIndex
        }
    }
    
    @IBOutlet weak var venueSelector: UISegmentedControl!{
        didSet{
            filter.venue = mealSelector.selectedSegmentIndex
        }
    }
    
    @IBOutlet weak var searchField: UISearchBar!{
        didSet{
            searchField.delegate = self
        }
    }
    
    var recipeTable : RecipeTableViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    func printSomething(){
        print("I printed something")
    }
    
    @IBAction func mealChange(sender: UISegmentedControl) {
        filter.meal = sender.selectedSegmentIndex
        recipeTable?.updateFilter(filter)
    }

    @IBAction func venueChange(sender: UISegmentedControl) {
        filter.venue = sender.selectedSegmentIndex
        recipeTable?.updateFilter(filter)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        filter.searchText = searchBar.text
        recipeTable?.updateFilter(filter)
        //searchBar.resignFirstResponder()
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
