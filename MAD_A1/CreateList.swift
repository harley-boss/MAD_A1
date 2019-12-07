/*
 * FILE : CreateList.swift
 * PROJECT : PROG3230 - Assignment #1
 * PROGRAMMER : Harley Boss / Spencer Billings
 * FIRST VERSION : 10-04-2019
 * DESCRIPTION : Allows user to name a grocery list
 */

import UIKit
import CoreData

class CreateListController: UIViewController {
    
    @IBOutlet weak var listName: UITextField!
    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var listTitle: UILabel!
    
    @IBOutlet weak var trailerConstraint: NSLayoutConstraint!
    
    var menuShown: Bool = false
    
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
        self.trailerConstraint.constant = -150
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
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let context = appDelegate.persistentContainer.viewContext
            
            let newItem = NSEntityDescription.insertNewObject(forEntityName: "Item", into: context)
            
            newItem.setValue(listName.text!, forKey: "listName")
            
            do{
                try context.save()
            }catch{
                
            }
            listName.text = ""
        }        
    }
    
    /*
     * Function : listNameChanged
     * Description : Listener for the text field that's called whenever text is entered
     * Paramaters : UITextField
     * Returns : None
     */
    @IBAction func menuBarItemClicked(_ sender: Any){
        self.trailerConstraint.constant = 0
        self.menuShown = false
    }
    
    @IBAction func listNameChanged(_ sender: UITextField) {
        // Do validation in the future
    }
    @IBAction func menuButtonClicked(_ sender: Any) {
        if (menuShown) {
            trailerConstraint.constant = 0
        } else {
            trailerConstraint.constant = -150
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
        menuShown = !menuShown
    }
}
