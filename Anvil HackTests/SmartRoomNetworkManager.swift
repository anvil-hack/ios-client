//
//  SmartRoomNetworkManager.swift
//  Anvil Hack
//
//  Created by Franco Meloni on 22/04/2017.
//  Copyright © 2017 Franco Meloni. All rights reserved.
//

import Quick
import Nimble
import Mockingjay
import Foundation

@testable import Anvil_Hack

private let baseURL = "baseURL/"

class SmartRoomNetworkManagerTest: QuickSpec {
    override func spec() {
        describe("SmartRoomNetworkManager tests") {
            var networkManager: SmartRoomNetworkManager!
            let testUser = User(name: "name", phoneNumber: "phone")
            var postData: String?
            
            beforeEach {
                networkManager = SmartRoomNetworkManager(baseURL: baseURL)
                postData = nil
            }
            
            context("When analyze method is called", {
                it("the methods calls the right endpoint and contains the correct data", closure: {
                    func builder(request:URLRequest) -> Response {
                        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
                        return .success(response, .noContent)
                    }
                    
                    func matcher(request:URLRequest) -> Bool {
                        return request.url?.absoluteString.hasPrefix(baseURL + networkManager.analyzeEndpoint) ?? false
                    }
                    
                    self.stub(matcher, builder)
                    
                    let dataRequest = networkManager.analyze(user: testUser, type: .enter)
                    
                    postData = String.init(data: dataRequest!.request!.httpBody!, encoding: String.Encoding.utf8)
                    
                    expect(postData).toEventually(contain(["\(networkManager.nameKey)=\(testUser.name)",
                        "\(networkManager.phoneNumberKey)=\(testUser.phoneNumber)",
                        "\(networkManager.typeKey)=" + AnalyzeImageRequestType.enter.rawValue]))
                })
            })
            
            context("When exit method is called", {
                it("the methods calls the right endpoint and contains the correct data", closure: {
                    func builder(request:URLRequest) -> Response {
                        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
                        return .success(response, .noContent)
                    }
                    
                    func matcher(request:URLRequest) -> Bool {
                        return request.url?.absoluteString.hasPrefix(baseURL + networkManager.exitEndpoint) ?? false
                    }
                    
                    self.stub(matcher, builder)
                    
                    let dataRequest = networkManager.exit(user: testUser)
                    
                    postData = String.init(data: dataRequest!.request!.httpBody!, encoding: String.Encoding.utf8)
                    
                    expect(postData).toEventually(contain(["\(networkManager.nameKey)=\(testUser.name)",
                        "\(networkManager.phoneNumberKey)=\(testUser.phoneNumber)"]))
                })
            })
        }
    }
}
