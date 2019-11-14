//
//  DetailViewController.swift
//  MAD_A1
//
//  Created by Nathan Davis on 2019-11-14.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var contentText: String?
    @IBOutlet weak var contentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if contentText != nil {
            self.contentLabel.text = contentText!
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
