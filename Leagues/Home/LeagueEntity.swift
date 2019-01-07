//
//  LeagueEntity.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

struct LeagueEntity: Decodable {
    let identifier: String
    let name: String
    let sport: String?
    let alternativeName: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "idLeague"
        case name = "strLeague"
        case sport = "strSport"
        case alternativeName = "strLeagueAlternate"
    }
}
