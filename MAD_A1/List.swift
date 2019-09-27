//
//  ListItem.swift
//  MAD_A1
//
//  Created by Harley Boss on 2019-09-24.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//

import Foundation

// This class represents a list item entry

class List {
    
    var id: Int = 0
    var listItems = [String]()
    
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
    
    // Get all items in the list
    public func getAllItems() -> [String] {
        return listItems
    }
}
