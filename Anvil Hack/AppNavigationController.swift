//
//  AppNavigationController.swift
//  Anvil Hack
//
//  Created by Franco Meloni on 22/04/2017.
//  Copyright © 2017 Franco Meloni. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        if UIApplication.shared.castedDelegate.applicationUser == nil {
            self.viewControllers = [self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") ?? UIViewController()]
        }
        else {
            self.viewControllers = [self.storyboard?.instantiateViewController(withIdentifier: "SmartRoomVC") ?? UIViewController()]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
