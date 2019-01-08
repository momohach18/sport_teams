//
//  AutocompleteTestImplementations.swift
//  LeaguesTests
//
//  Created by Macbook on 08/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

@testable import Leagues

class TeamsViewTestImplementation: TeamsView {
    var isLoading = false
    
    func setLoadingIndicator(visible: Bool) {
        isLoading = visible
    }
    
    var presenter: TeamsPresenter!
    var elements = [TeamViewModel]()
    
    func show(teams: [TeamViewModel]) {
        self.elements = teams
    }
    
    func selectElement(at position: Int) {
        presenter.didSelectTeam(at: position)
    }
}

class TeamsPresenterDelegateImplementation: TeamsPresenterDelegate {
    var selectedIdentifier: String?
    func didSelectTeam(with identifier: String) {
        selectedIdentifier = identifier
    }
}

class TeamsRepositoryTestsImplementation: TeamsRepository {
    func getElements(with leagueIdentifier: String,
                     completion: (Result<[TeamEntity], RepositoryError>) -> ()) {
        completion(Result.value([TeamEntity(identifier: "1", badgeUrl: "U1", name: "\(leagueIdentifier)-T1"),
                                 TeamEntity(identifier: "2", badgeUrl: "U2", name: "\(leagueIdentifier)-T2"),
                                 TeamEntity(identifier: "3", badgeUrl: "U3", name: "\(leagueIdentifier)-T3")]))
    }
}
