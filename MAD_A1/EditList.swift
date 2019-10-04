/*
 * FILE : EditList.swift
 * PROJECT : PROG3230 - Assignment #1
 * PROGRAMMER : Justin Struk
 * FIRST VERSION : 10-04-2019
 * DESCRIPTION :
 * Allows user the enter items to add to their grocery list
 */
//  EditList.swift
//  MAD_A1
//
//  Created by Harley Boss on 2019-09-27.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//

import UIKit

class EditListController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    
    /*
     * Function : viewDidLoad
     * Description : On create lifecycle hook
     * Paramaters : None
     * Returns : None
     */
    override func viewDidLoad() {
        super.viewDidLoad() ;
        setupUI();
    }
    
    /*
     * Function : viewDidAppear
     * Description : On view appear lifecycle hook, calls method that sets up list
     * Paramaters : None
     * Returns : None
     */
    override func viewDidAppear(_ animated: Bool) {
        setList()
    }
    
    
    /*
     * Function : textFileShouldReturn
     * Description : method delegate for textfield
                     return key event, calls performAction() to add item to list
     * Paramaters : _textField (field event occured on)
     * Returns : None
     */
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        performAction()
        return true
    }
    
    /*
     * Function : onClick
     * Description : Event handler to button press, calls method to add item from textfield to list
     * Paramaters : None
     * Returns : None
     */
    @IBAction func onClick(){
        performAction()
    }
    
    /*
     * Function : performActiom
     * Description : Takes text from textfield (current "item") and adds it to the textview (list/all items)
     * Paramaters : None
     * Returns : None
     */
    func performAction() {
        let newItemStr: String = textField.text!
        if newItemStr == "" {
            return
        }
        textView?.text += (newItemStr + "\n")
        textView?.text += ("---------------------------------------\n")
        textField.text = ""
    }
    
    /*
     * Function : setList
     * Description : Sets the list name label to the name the user entered on the first tab
     * Paramaters : None
     * Returns : None
     */
    func setList() {
        listNameLabel.text = "List Name: " + GroceryList.sharedList.listName
    }
    
    
    /*
     * Function : setupUI
     * Description : Sets up the UI that needs to be done through code such as the overlayed "+" add button in the textfield
     * Paramaters : None
     * Returns : None
     */
    func setupUI(){
        setList();
        view.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        self.textField.delegate = self
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "add.png"), for: .normal)
        button.frame = CGRect(x: textField.frame.size.width - 40 , y: 5, width: 22, height: 22)
        button.addTarget(self, action: #selector(self.onClick), for: .touchUpInside)
        textField.rightView = button
        textField.rightViewMode = .always
    }
}
