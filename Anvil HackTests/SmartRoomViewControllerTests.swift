//
//  SmartRoomViewControllerTests.swift
//  Anvil Hack
//
//  Created by Franco Meloni on 22/04/2017.
//  Copyright © 2017 Franco Meloni. All rights reserved.
//

import Quick
import Nimble

@testable import Anvil_Hack

class SmartRoomViewControllerTests: QuickSpec {
    override func spec() {
        var smartRoomViewController: SmartRoomViewController! = UIStoryboard(name: "Main", bundle: nil) as!SmartRoomViewController
        
        beforeEach {
            smartRoomViewController = UIStoryboard(name: "Main", bundle: nil) as!SmartRoomViewController
        }
        
        
    }
}
