//
//  GroceryList.swift
//  MAD_A1
//
//  Created by Harley Boss on 2019-09-24.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//


import UIKit

class CreateListController: UIViewController {
    
    @IBOutlet weak var listName: UITextField!
    @IBOutlet weak var create: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createClicked(_ sender: Any) {
        //Only change tabs if the list had a name
        if(!(listName.text?.isEmpty)!){
            GroceryList.sharedList.listName = listName.text!
            self.tabBarController?.selectedIndex = 1
            listName.text = ""
        }        
    }
    
    
    @IBAction func listNameChanged(_ sender: UITextField) {
        // Do validation in the future
    }
}
