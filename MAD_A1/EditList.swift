//
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
    
    override func viewDidLoad() {
        
        super.viewDidLoad() ;
        setupUI();
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        performAction()
        return true
    }
    
    @IBAction func onClick(){
        performAction()
    }
    
    func performAction() {
         let newItemStr: String = textField.text!
        
        textView?.text += (newItemStr + "\n")
        
        textField.text = ""
    }
    
    func setList() {
        
    }
    
    func setupUI(){
        self.textField.delegate = self
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "add.png"), for: .normal)
        button.frame = CGRect(x: textField.frame.size.width - 40 , y: 5, width: 22, height: 22)
        button.addTarget(self, action: #selector(self.onClick), for: .touchUpInside)
        
        textField.rightView = button
        textField.rightViewMode = .always
        
    }
}
