/*
 * FILE : CreateList.swift
 * PROJECT : PROG3230 - Assignment #1
 * PROGRAMMER : Harley Boss / Spencer Billings
 * FIRST VERSION : 10-04-2019
 * DESCRIPTION : Allows user to name a grocery list
 */

import UIKit

class CreateListController: UIViewController {
    
    @IBOutlet weak var listName: UITextField!
    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var listTitle: UILabel!
    
    
    
    /*
     * Function : viewDidLoad
     * Description : On create lifecycle hook
     * Paramaters : None
     * Returns : None
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        listName.addTarget(self, action: #selector(showKeyboard), for: .touchDown)
        view.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        self.title = NSLocalizedString("create", comment: "")
        
        listTitle.text = NSLocalizedString("nameList", comment: "list name")
        create.setTitle(NSLocalizedString("create", comment: "button text"), for: .normal)
    }
    
    
    
    
    @objc func showKeyboard(textField: UITextField) {
        self.listName.becomeFirstResponder()
    }
    
    
    
    
    /*
     * Function : createClicked
     * Description : Function called when create button is clicked, sets the list name and presents second tab
     * Paramaters : Any
     * Returns : None
     */
    @IBAction func createClicked(_ sender: Any) {
        if(!(listName.text?.isEmpty)!){
            self.listName.resignFirstResponder()
            GroceryList.sharedList.listName = listName.text!
            self.tabBarController?.selectedIndex = 1
            listName.text = ""
        }        
    }
    
    /*
     * Function : listNameChanged
     * Description : Listener for the text field that's called whenever text is entered
     * Paramaters : UITextField
     * Returns : None
     */
    @IBAction func listNameChanged(_ sender: UITextField) {
        // Do validation in the future
    }
}
