//
//  PlayersPresenter.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol PlayersPresenterDelegate {
    func didSelectPlayer(with identifier: String)
}

protocol PlayersPresenter: class {
    var delegate: PlayersPresenterDelegate? { get set }
    var playersRepository: PlayersRepository { get set }
    var players: [PlayerEntity] { get set }
    var view: PlayersView? { get set }
    func didLoadView()
    //MARK: View Actions
    func didSelectPlayer(at position: Int)
}

class PlayersPresenterImplementation: PlayersPresenter {
    var delegate: PlayersPresenterDelegate?
    
    var playersRepository: PlayersRepository
    
    var players: [PlayerEntity] = []
    
    var view: PlayersView?
    
    private var teamIdentifier: String
    
    init(teamIdentifier: String, playersRepository: PlayersRepository) {
        self.playersRepository = playersRepository
        self.teamIdentifier = teamIdentifier
    }
    
    func didLoadView() {
        view?.setLoadingIndicator(visible: true)
        playersRepository.getElements(with: teamIdentifier) { [weak self] result in
            self?.view?.setLoadingIndicator(visible: false)
            switch result {
            case .value(let players):
                self?.handleRecieved(players: players)
            case .error(let error):
                self?.handle(error: error)
            }
        }
    }
    
    private func handleRecieved(players: [PlayerEntity]) {
        self.players = players
        view?.show(players: players.map{ PlayerViewModel(identifier: $0.identifier,
                                                         name: $0.name,
                                                         position: $0.position,
                                                         birthDate: $0.birthDate,
                                                         signingAmout: $0.signingAmout,
                                                         imageUrlString: $0.headImageUrlString ?? $0.thumbnailImageUrlString
                                                         ) } )
        
    }
    
    private func handle(error: RepositoryError) {
        
    }
    
}

//MARK:- View Actions
extension PlayersPresenterImplementation {
    func didSelectPlayer(at position: Int) {
        guard position < players.count else { return }
        self.delegate?.didSelectPlayer(with: players[position].identifier)
    }
}
