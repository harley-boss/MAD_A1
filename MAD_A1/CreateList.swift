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
    @IBOutlet weak var createButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createButton.addTarget(self, action: Selector(("buttonClicked:")), for: .touchDown)
    }
    
    @IBAction func listNameChanged(_ sender: UITextField) {
        createButton.isEnabled = true
    }
    
    @IBAction func listCreate(_ sender: UIButton) {
        if listName.text != "" {
            if tabBarController != nil {
                if (tabBarController?.customizableViewControllers![1]) != nil {
                    
                }
                
            }
        }

    }
}
