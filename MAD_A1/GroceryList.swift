//
//  GroceryList.swift
//  MAD_A1
//
//  Created by Harley Boss on 2019-09-24.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//

import Foundation

// This class represents a list item entry

class GroceryList {
    
    var id: Int = 0
    var listName: String = ""
    var listItems = [String]()
    var isExpanded: Bool
    
    init (_ id : Int, _ listName : String, _ listItems : [String]) {
        self.listName = listName
        self.id = id
        self.listItems = listItems
        self.isExpanded = true
    }
    
    // Add an item to the list
    public func addItem(_ itemName : String) {
        listItems.append(itemName)
    }
    
    // Removes a single occurance of an item from the list based on the name
    // Case-sensitive
    public func removeItem(_ itemName : String) {
        for item in listItems {
            if itemName == item {
                if let index = listItems.firstIndex(of: item) {
                    listItems.remove(at: index)
                }
                break
            }
        }
    }
    
    // Removes an item based on its index
    public func removeItem(_ itemIndex : Int) {
        if itemIndex <= listItems.count {
            listItems.remove(at: itemIndex)
        }
    }
    
    // Removes an item based on its index
    public func removeAllItems() {
        listItems.removeAll();
    }
    
    public func getListName() -> String {
        return listName
    }
    
    // Get all items in the list
    public func getAllItems() -> [String] {
        return listItems
    }
}
