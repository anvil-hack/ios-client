//
//  SmartRoomViewControllerTests.swift
//  Anvil Hack
//
//  Created by Franco Meloni on 22/04/2017.
//  Copyright © 2017 Franco Meloni. All rights reserved.
//

import Quick
import Nimble
import Alamofire

@testable import Anvil_Hack

fileprivate class SpyNetworkManager: SmartRoomNetworkManagerProtocol {
    fileprivate var analyzeCalled = false
    fileprivate var exitCalled = false
    
    fileprivate func analyze(user: User, type: AnalyzeImageRequestType) -> DataRequest? {
        self.analyzeCalled = true
        
        return nil
    }
    
    fileprivate func exit(user: User) -> DataRequest? {
        self.exitCalled = true
        
        return nil
    }
}

class SmartRoomViewControllerTests: QuickSpec {
    override func spec() {
        var smartRoomViewController: SmartRoomViewController!
        var networkManager: SpyNetworkManager!
        
        beforeEach {
            smartRoomViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SmartRoomVC") as!SmartRoomViewController
            smartRoomViewController.useBeaconManager = false
            networkManager = SpyNetworkManager()
            smartRoomViewController.networkManager = networkManager
            smartRoomViewController.user = User(name: "", phoneNumber: "")
        }
        
        describe("SmartRoomViewControllerTests") {
            context("When beacon enter method is called", { 
                it("Analyze method is called on the networkManager", closure: { 
                    smartRoomViewController.beaconManager(smartRoomViewController.beaconManager, didEnter: CLBeaconRegion(proximityUUID: UUID(), identifier: ""))
                    
                    expect(networkManager.analyzeCalled) == true
                })
            })
        }
        
    }
}
