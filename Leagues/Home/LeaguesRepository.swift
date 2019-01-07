//
//  LeaguesRepository.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol LeaguesRepository {
    func getAllElements(completion: (Result<[LeagueEntity], RepositoryError>) -> ())
}

class LeaguesRepositoryImplementation: LeaguesRepository {
    func getAllElements(completion: (Result<[LeagueEntity], RepositoryError>) -> ()) {
    }
}
