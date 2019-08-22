//
//  User.swift
//  ProtocolOrientedWebServiceCall
//
//  Created by hasher on 20/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import Foundation
struct User {
    let name: String?
    let profileImageURL: URL?
    let reputation: Int?
}

extension User {
    private enum Keys: String, SerializationKey {
        case reputation
        case name = "display_name"
        case profileImage = "profile_image"
    }
    
    init(serialization: Serialization) {
        name = serialization.value(forKey: Keys.name)
        reputation = serialization.value(forKey: Keys.reputation)
        if let url: String = serialization.value(forKey: Keys.profileImage) {
            profileImageURL = URL(string: url)
        } else {
            profileImageURL = nil
        }
    }
}
