//
//  LeaguesRepository.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation
import Alamofire

protocol LeaguesRepository {
    func getAllElements(completion: @escaping (Result<[LeagueEntity], RepositoryError>) -> ())
}

class LeaguesRepositoryImplementation: LeaguesRepository {
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
    func getAllElements(completion: @escaping (Result<[LeagueEntity], RepositoryError>) -> ()) {
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/1/all_leagues.php") else {
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
            let leaguesResponse = try? JSONDecoder().decode(LeaguesResponse.self, from: data)
            guard let leagues = leaguesResponse?.leagues else {
                completion(Result.error(RepositoryError.technical))
                return
            }
            completion(Result.value(leagues))
        }
    }
}
