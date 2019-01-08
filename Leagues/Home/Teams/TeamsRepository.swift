//
//  TeamsRepository.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol TeamsRepository {
    func getElements(with leagueIdentifier: String,
                     completion: (Result<[TeamEntity], RepositoryError>) -> ())
}
