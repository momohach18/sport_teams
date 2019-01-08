//
//  PlayerEntity.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

struct PlayerEntity: Decodable {

    let identifier: String
    let name: String
    let birthDate: String?
    let signingAmout: String?
    let headImageUrlString: String?
    let thumbnailImageUrlString: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "idPlayer"
        case name = "strPlayer"
        case birthDate = "dateBorn"
        case signingAmout = "strSigning"
        case headImageUrlString = "strCutout"
        case thumbnailImageUrlString = "strThumb"
    }
}

struct PlayersResponse: Decodable {
    let players: [PlayerEntity]
}
