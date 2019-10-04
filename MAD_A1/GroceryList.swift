/*
 * FILE : GroceryList.swift
 * PROJECT : PROG3230 - Assignment #1
 * PROGRAMMER : Harley Boss
 * FIRST VERSION : 10-04-2019
 * DESCRIPTION : Class used to represent a grocery list and all its items
 */

import Foundation


class GroceryList {
    static let sharedList = GroceryList(0,"",[])
    var id: Int = 0
    var listName: String = ""
    var listItems = [String]()
    var isExpanded: Bool
    
    
    /*
     * Function : init
     * Description : Class constructor
     * Paramaters : id : int, listName : String, listItems : String array
     * Returns : None
     */
    init (_ id : Int, _ listName : String, _ listItems : [String]) {
        self.listName = listName
        self.id = id
        self.listItems = listItems
        self.isExpanded = true
    }
    
    /*
     * Function : addItem
     * Description : Adds an item to the list
     * Paramaters : itemName : String
     * Returns : None
     */
    public func addItem(_ itemName : String) {
        listItems.append(itemName)
    }
    
    /*
     * Function : removeItem
     * Description : Removes an item from the list based on its name
     * Paramaters : itemName : String
     * Returns : None
     */
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
    
    /*
     * Function : removeItem
     * Description : Removes an item from the list based on its index
     * Paramaters : itemIndex : Int
     * Returns : None
     */
    public func removeItem(_ itemIndex : Int) {
        if itemIndex <= listItems.count {
            listItems.remove(at: itemIndex)
        }
    }
    
    /*
     * Function : removeAllItems
     * Description : Removes all entries from the list
     * Paramaters : None
     * Returns : None
     */
    public func removeAllItems() {
        listItems.removeAll();
    }
    
    /*
     * Function : getListName
     * Description : Returns the name of the list
     * Paramaters : None
     * Returns : String
     */
    public func getListName() -> String {
        return listName
    }
    
    /*
     * Function : getAllItems
     * Description : Returns all items in the list
     * Paramaters : None
     * Returns : String array
     */
    public func getAllItems() -> [String] {
        return listItems
    }
}
