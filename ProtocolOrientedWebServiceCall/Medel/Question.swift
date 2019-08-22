//
//  Question.swift
//  ProtocolOrientedWebServiceCall
//
//  Created by hasher on 20/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import Foundation
struct Question {
    let title: String
    let score: Int
    let tags: [String]
    let date: Date
    //let owner: User?
}

extension Question {
    private enum Keys: String, SerializationKey {
        case title
        case score
        case tags
        //case owner
        case date = "creation_date"
    }
    
    init(serialization: Serialization) {
        title = serialization.value(forKey: Keys.title)!
        score = serialization.value(forKey: Keys.score)!
        tags = serialization.value(forKey: Keys.tags)!
        let creationdate: Int = serialization.value(forKey: Keys.date)!
        date = Date(timeIntervalSince1970: TimeInterval(creationdate))
        /*if let ownerSerialization: Serialization = serialization.value(forKey: Keys.owner) {
            owner = User(serialization: ownerSerialization)
        } else {
            owner = nil
        }*/
    }
}
