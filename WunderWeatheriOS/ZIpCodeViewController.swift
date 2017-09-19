//
//  ZIpCodeViewController.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import UIKit


class ZIpCodeViewController: UIViewController, UITextFieldDelegate {
    
    var presentZipCode = ""
    var tempureatureValue = TempVariables.feranite
    
    @IBAction func tempScaleChanged(_ sender: AnyObject) {
        tempureatureValue = TempVariables(rawValue: sender.selectedSegmentIndex)!
    }
    
    @IBOutlet weak var tempScaleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var zipTextField: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if(zipTextField.isFirstResponder) {
            self.view.endEditing(true)
        } else {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
}
