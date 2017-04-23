//
//  ViewController.swift
//  Anvil Hack
//
//  Created by Franco Meloni on 22/04/2017.
//  Copyright © 2017 Franco Meloni. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import UserNotifications

protocol SmartRoomNetworkManagerProtocol {
    func analyze(user: User, type:AnalyzeImageRequestType) -> DataRequest?
    func exit(user: User) -> DataRequest?
}

class SmartRoomViewController: UIViewController {

    var useBeaconManager = true
    var beaconManager = UIApplication.shared.castedDelegate.beaconManager
    var networkManager: SmartRoomNetworkManagerProtocol = SmartRoomNetworkManager()
    var center = UNUserNotificationCenter.current()
    var user: User! = UIApplication.shared.castedDelegate.applicationUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        if useBeaconManager {
            self.beaconManager.delegate = self
            self.beaconManager.requestAlwaysAuthorization()
        }
    }
    
    @IBAction func sendAnalyzeRequest(_ sender: Any) {
        _ = self.networkManager.analyze(user: self.user, type: .onDemand)
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
        print("Entered on the region")
        self.notifyUserForRoomEntrance()
        _ = self.networkManager.analyze(user: self.user, type: .enter)
    }
    
    func beaconManager(_ manager: Any, didExitRegion region: CLBeaconRegion) {
        print("Exited from the region")
        _ = self.networkManager.exit(user: self.user)
    }
    
    func beaconManager(_ manager: Any, monitoringDidFailFor region: CLBeaconRegion?, withError error: Error) {
        print("Error while monitoring beacons: \(error)")
    }
    
    private func notifyUserForRoomEntrance() {
        let content = UNMutableNotificationContent()
        content.title = "You entered on a smart Room"
        content.body = "You entered on a smart Room"
        content.sound = UNNotificationSound.default()
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        self.center.add(request, withCompletionHandler: nil)
    }
}

