//
//  ViewList.swift
//  MAD_A1
//
//  Created by Harley Boss on 2019-09-27.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//


// Use this link for the View tab to create an expandable table
// https://medium.com/ios-os-x-development/ios-how-to-build-a-table-view-with-collapsible-sections-96badf3387d0

import UIKit

class ViewListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let actualList = [GroceryList(0, "Grocery List 1", ["Orange", "Purple", "Blue"]), GroceryList(1, "Grocery List 2", ["Nathan", "Justin", "Spencer", "Harley"])]
    
    let lists = ["Grocery list 1", "Grocery list 2", "Grocery list 3"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.backgroundColor = .darkGray
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsetsMake(0,10,0,0)
        button.addTarget(self, action: #selector(handleOpenClose), for: .touchUpInside)
        
        button.tag = section
        return button
    }
    
    @objc func handleOpenClose(button: UIButton) {
        let section = button.tag
        // we'll try to close the seciton first by deleting the rows
        var indexPaths = [IndexPath]()
        for row in actualList[section].getAllItems().indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let isExpanded = actualList[section].isExpanded
        actualList[section].isExpanded = !isExpanded
        if(isExpanded) {
            tableView.deleteRows(at: indexPaths, with: .fade)
        }
        else {
            tableView.insertRows(at: indexPaths, with: .fade)

        }
        

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 34
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return actualList.count
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = .white

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(!actualList[section].isExpanded) {
            return 0
        } 
        return actualList[section].getAllItems().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellList", for: indexPath)
        
        let listName = actualList[indexPath.section].getAllItems()[indexPath.row]
            cell.textLabel?.text = listName
        return cell
    }

}
