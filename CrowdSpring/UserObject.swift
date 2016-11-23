//
//  UserObject.swift
//  CrowdSpring
//
//  Created by Armard Bellamy on 10/5/16.
//  Copyright © 2016 Armard Bellamy. All rights reserved.
//

import SwiftyJSON

class UserObject {
    var profilePicUrl: String!
    var userName: String!
    
    required init(json: JSON) {
        profilePicUrl = json["picture"]["medium"].stringValue
        userName = json["email"].stringValue
    }
}


