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
        // Do any additional setup after loading the view.
       // create.addTarget(self, action: Selector(("buttonClicked:")), for: .touchDown)
    }
    
    @IBAction func createClicked(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
        
        listName.text = "ok"
    }
    
    
    @IBAction func listNameChanged(_ sender: UITextField) {
        // Ensure that the string isn't empty any maybe at least 3 chars?
       // create.isEnabled = true
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
