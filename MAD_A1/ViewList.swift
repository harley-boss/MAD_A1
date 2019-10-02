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

class ViewListController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var GroceryList: UIButton!
    @IBOutlet weak var btnDrop: UIButton!
    
    var fruitList = ["Orange","Banana","Strawberry","Cherry","Plumb","Apple","Mango"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GroceryList.layer.cornerRadius=5
        tblView.isHidden = true
        
    }
    @IBAction func onClickDropButton(_ sender: Any) {
        
        if tblView.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    func animate(toggle: Bool) {
        if toggle {
             UIView.animate(withDuration: 0.3, animations: {
                       self.tblView.isHidden = false
                   })
        } else {
             UIView.animate(withDuration: 0.3, animations: {
                       self.tblView.isHidden = true
                   })
        }
    }
}

extension ViewListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruitList[indexPath.row]
        return cell
    }
    

}
