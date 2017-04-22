//
//  User.swift
//  Anvil Hack
//
//  Created by Franco Meloni on 22/04/2017.
//  Copyright © 2017 Franco Meloni. All rights reserved.
//

import UIKit

private let nameKey = "name"
private let phoneKey = "phoneNumber"

class User: NSObject, NSCoding {
    let name: String
    let phoneNumber: String
    
    init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey:nameKey) as? String ?? ""
        self.phoneNumber = aDecoder.decodeObject(forKey:phoneKey) as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: nameKey)
        aCoder.encode(self.phoneNumber, forKey: phoneKey)
    }
}
