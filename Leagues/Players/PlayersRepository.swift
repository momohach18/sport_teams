//
//  PlayersRepository.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol PlayersRepository {
    func getElements(with teamIdentifier: String,
                     completion: @escaping (Result<[PlayerEntity], RepositoryError>) -> ())
}
