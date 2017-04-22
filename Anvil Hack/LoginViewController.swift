//
//  LoginViewController.swift
//  Anvil Hack
//
//  Created by Franco Meloni on 22/04/2017.
//  Copyright © 2017 Franco Meloni. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {

    @IBOutlet weak var nameField: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneNumberField: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func saveUser(_ sender: Any) {
        let user = User(name: self.nameField.text ?? "", phoneNumber: self.phoneNumberField.text ?? "")
        
        UIApplication.shared.castedDelegate.applicationUser = user
        self.performSegue(withIdentifier: "ShowSmartRoomVC", sender: sender)
    }
    
}
