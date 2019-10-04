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
    @IBOutlet weak var create: UIButton!s
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        // Ensure that the string isn't empty any maybe at least 3 chars?
    }
    
    @IBAction func listCreate(_ sender: Any) {
        if listName.text != "" {
            if tabBarController != nil {
                if (tabBarController?.customizableViewControllers![1]) != nil {
                    
                }
                
            }
        }

    }
}
