//
//  Camera.swift
//  MAD_A1
//
//  Created by Harley Boss on 2019-12-05.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//

import UIKit

class Camera: UIViewController {
    @IBOutlet weak var btnCamera: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cameraClicked(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(vc, animated: true)
    }
}


