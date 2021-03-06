//
//  TeamsRepository.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation
import Alamofire

protocol TeamsRepository {
    func getElements(with leagueIdentifier: String,
                     completion: @escaping (Result<[TeamEntity], RepositoryError>) -> ())
}


class TeamsRepositoryImplementation: TeamsRepository {
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
    func getElements(with leagueIdentifier: String,
                     completion: @escaping (Result<[TeamEntity], RepositoryError>) -> ()) {
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id=\(leagueIdentifier)") else {
            completion(Result.error(RepositoryError.technical))
            return
        }
        guard reachabilityManager?.isReachable == true else {
            completion(Result.error(RepositoryError.network))
            return
        }
        Alamofire.request(url).responseData { dataResponse in
            guard let data = dataResponse.data else {
                completion(Result.error(RepositoryError.technical))
                return
            }
            let teamsResponse = try? JSONDecoder().decode(TeamsResponse.self, from: data)
            guard let teams = teamsResponse?.teams else {
                completion(Result.error(RepositoryError.technical))
                return
            }
            completion(Result.value(teams))
        }
    }
}
