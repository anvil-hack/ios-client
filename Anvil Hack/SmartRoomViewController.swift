//
//  ViewController.swift
//  Anvil Hack
//
//  Created by Franco Meloni on 22/04/2017.
//  Copyright © 2017 Franco Meloni. All rights reserved.
//

import UIKit
import CoreLocation

class SmartRoomViewController: UIViewController {

    fileprivate let beaconManager = ESTBeaconManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
    }
}

extension SmartRoomViewController: ESTBeaconManagerDelegate {
    func beaconManager(_ manager: Any, didChange status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            self.beaconManager.startMonitoring(for: CLBeaconRegion(
                proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, major: 1107, minor: 1107, identifier: "monitored region"))
        }
    }
    
    func beaconManager(_ manager: Any, didEnter region: CLBeaconRegion) {
    }
    
    func beaconManager(_ manager: Any, didExitRegion region: CLBeaconRegion) {
    }
    
    func beaconManager(_ manager: Any, monitoringDidFailFor region: CLBeaconRegion?, withError error: Error) {
    }
}

