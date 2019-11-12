/*
* FILE : ViewList.swift
* PROJECT : PROG3230 - Assignment #1
* PROGRAMMER : Nathan Davis
* FIRST VERSION : 10-04-2019
* DESCRIPTION :
* Displays expandable grocery lists
*/

import UIKit

class ViewListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Hard coded grocery lists for this iteration of the assignment
    let groceryList = [GroceryList(0, "Grocery List 1", ["Orange", "Purple", "Blue"]), GroceryList(1, "Grocery List 2", ["Rice", "Beans", "Carrots", "Harley"]), GroceryList(1, "Grocery List 3", ["Buns", "Burgers", "Hot Dogs", "Harley"]), GroceryList(1, "Grocery List 4", ["Nathan", "Justin", "Spencer", "Harley"]), ]
    @IBOutlet weak var tableView: UITableView!
    
    /*
    * Function : viewDidLoad
    * Description : On create lifecycle hook
    * Paramaters : None
    * Returns : None
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("view", comment: "")
        self.tableView.backgroundColor = .white
        self.tableView.tableFooterView = UIView()
    }
    
    /*
    * Function : tableView(_ tableView: UITableView, viewForHeaderInSection section: Int)
    * Description : Renders a button within the tableView headers
    *               and adds hadnleOpenClose action
    * Paramaters : None
    * Returns : None
    */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle(groceryList[section].getListName(), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.contentHorizontalAlignment = .center
        button.contentEdgeInsets = UIEdgeInsetsMake(0,10,0,0)
        button.addTarget(self, action: #selector(handleOpenClose), for: .touchUpInside)
        button.tag = section
        return button
    }
    
    /*
    * Function : tableView(_ tableView: UITableView, heightForHeaderInSection section: Int)
    * Description : Sets header height
    * Paramaters : None
    * Returns : None
    */
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    /*
    * Function : handleOpenClose(button: UIButton)
    * Description : Collapses and expands tableview sections
    * Paramaters : button: UIButton
    * Returns : None
    */
    @objc func handleOpenClose(button: UIButton) {
        let section = button.tag
        var indexPaths = [IndexPath]()
        for row in groceryList[section].getAllItems().indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = groceryList[section].isExpanded
        groceryList[section].isExpanded = !isExpanded
        
        if(isExpanded) {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    /*
    * Function : numberOfSections(in tableView: UITableView)
    * Description : Sets number of sections in tableview
    * Paramaters : None
    * Returns : None
    */
    func numberOfSections(in tableView: UITableView) -> Int {
        return groceryList.count
    }
    
    /*
    * Function : tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    * Description : set cell background and text color
    * Paramaters : None
    * Returns : None
    */
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = .black
    }
    
   /*
   * Function : tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
   * Description : set number of rows in each list section
   * Paramaters : None
   * Returns : None
   */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(!groceryList[section].isExpanded) {
            return 0
        } 
        return groceryList[section].getAllItems().count
    }
    
    /*
    * Function : tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    * Description : returns a single cell for a single row
    * Paramaters : None
    * Returns : None
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellList", for: indexPath)
        let listName = groceryList[indexPath.section].getAllItems()[indexPath.row]
            cell.textLabel?.text = listName
        return cell
    }
}
