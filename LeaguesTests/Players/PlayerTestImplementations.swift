//
//  AutocompleteTestImplementations.swift
//  LeaguesTests
//
//  Created by Macbook on 08/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

@testable import Leagues

class PlayersViewTestImplementation: PlayersView {
    var isLoading = false
    
    func setLoadingIndicator(visible: Bool) {
        isLoading = visible
    }
    
    var presenter: PlayersPresenter!
    var players = [PlayerViewModel]()
    
    func show(players: [PlayerViewModel]) {
        self.players = players
    }
    
    func selectElement(at position: Int) {
        presenter.didSelectPlayer(at: position)
    }
}

class PlayersPresenterDelegateImplementation: PlayersPresenterDelegate {
    var selectedIdentifier: String?
    func didSelectPlayer(with identifier: String) {
        selectedIdentifier = identifier
    }
}

class PlayersRepositoryTestsImplementation: PlayersRepository {
    func getElements(with teamIdentifier: String,
                     completion: @escaping (Result<[PlayerEntity], RepositoryError>) -> ()) {
        let players = Array(0...4).map{PlayerEntity(identifier: "\($0)", name: "P\($0)", birthDate: "\($0)", signingAmout: "\($0)", headImageUrlString: "\($0)", thumbnailImageUrlString: "\($0)")}
        completion(Result.value(players))
    }
}
