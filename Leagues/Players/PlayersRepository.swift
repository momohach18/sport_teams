//
//  PlayersRepository.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation
import Alamofire

protocol PlayersRepository {
    func getElements(with teamIdentifier: String,
                     completion: @escaping (Result<[PlayerEntity], RepositoryError>) -> ())
}

class PlayersRepositoryImplementation: PlayersRepository {
    func getElements(with teamIdentifier: String,
                     completion: @escaping (Result<[PlayerEntity], RepositoryError>) -> ()) {
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/1/lookup_all_players.php?id=\(teamIdentifier)") else {
            completion(Result.error(RepositoryError.technical))
            return
        }
        Alamofire.request(url).responseData { dataResponse in
            guard let data = dataResponse.data else {
                completion(Result.error(RepositoryError.technical))
                return
            }
            let playersResponse = try? JSONDecoder().decode(PlayersResponse.self, from: data)
            guard let players = playersResponse?.player else {
                completion(Result.error(RepositoryError.technical))
                return
            }
            completion(Result.value(players))
        }
    }
}
