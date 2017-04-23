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

private let defautlBaseURL = "http://178.62.14.170:4242/"


class SmartRoomNetworkManager: SmartRoomNetworkManagerProtocol {
    private let baseURL: String
    
    let analyzeEndpoint = "analyse"
    let exitEndpoint = "exit"
    
    let nameKey = "username"
    let phoneNumberKey = "phone"
    let typeKey = "type"
    
    init(baseURL: String = defautlBaseURL) {
        self.baseURL = baseURL
    }
    
    func analyze(user: User, type:AnalyzeImageRequestType) -> DataRequest? {
        let parameters = [self.nameKey: user.name,
                          self.phoneNumberKey: user.phoneNumber,
                          self.typeKey: type.rawValue]
        
        return Alamofire.request(self.baseURL + analyzeEndpoint, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
    }
    
    func exit(user: User) -> DataRequest? {
        let parameters = ["userName": user.name,
                          "phone": user.phoneNumber]
        
        return Alamofire.request(self.baseURL + exitEndpoint, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
    }
}
