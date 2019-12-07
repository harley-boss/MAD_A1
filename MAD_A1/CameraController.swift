//
//  CameraController.swift
//  MAD_A1
//
//  Created by Harley Boss on 2019-12-07.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//

import UIKit
import AVKit

class CameraController: UIViewController,
                        UIImagePickerControllerDelegate,
                        UINavigationControllerDelegate {
    
    
    @IBOutlet weak var cameraView: UIView!
    var session: AVCaptureSession?
    var input: AVCaptureDeviceInput?
    var output: AVCaptureOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchCamera()
    }
    
    func launchCamera() {
        //Initialize session an output variables this is necessary
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image", "public.movie"]
        pickerController.sourceType = .camera
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
