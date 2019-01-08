//
//  TeamEntity.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

struct TeamEntity: Decodable {
    let identifier: String
    let badgeUrl: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "idTeam"
        case badgeUrl = "strTeamBadge"
        case name = "strTeam"
    }
}
