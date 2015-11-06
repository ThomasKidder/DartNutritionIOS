//
//  MenuFilter.swift
//  Dartmouth Nutrition
//
//  Created by Thomas Kidder on 10/19/15.
//  Copyright © 2015 Thomas Kidder. All rights reserved.
//

import Foundation

struct MenuFilter {
    
    var meal : Int = 0
    var venue : Int = 0
    var searchText : String = ""
    
    func filter(allItems : [Recipe]) -> [Recipe] {
        return allItems.filter({ (recipe : Recipe) -> Bool in
            let categoryMatch = recipe.venue == venue && recipe.meal == meal
            let stringMatch = searchText.isEmpty || recipe.name.lowercaseString.rangeOfString(self.searchText.lowercaseString) != nil
            return (categoryMatch && stringMatch)
        })
    }
    
}
