//
//  SmartViewNetworkManager.swift
//  Anvil Hack
//
//  Created by Franco Meloni on 22/04/2017.
//  Copyright © 2017 Franco Meloni. All rights reserved.
//

import UIKit
import Alamofire

enum AnalyzeImageRequestType: String {
    case enter = "enter"
    case onDemand = "onDemand"
}

private let baseURL = "localhost://"
private let analyzeEndpoint = "analyse"
private let exitEndpoint = "exit"

class SmartRoomNetworkManager{
    func analyze(user: User, type:AnalyzeImageRequestType) {
        let parameters = ["userName": user.name,
                          "phone": user.phoneNumber,
                          "type": type.rawValue]
        
        _ = Alamofire.request(baseURL + analyzeEndpoint, parameters: parameters)
    }
    
    func exit(user: User) {
        let parameters = ["userName": user.name,
                          "phone": user.phoneNumber]
        
        _ = Alamofire.request(baseURL + exitEndpoint, parameters: parameters)
    }
}
