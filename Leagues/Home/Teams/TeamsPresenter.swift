//
//  TeamsPresenter.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol TeamsPresenterDelegate {
    func didSelectTeam(with identifier: String)
}

protocol TeamsPresenter: class {
    var delegate: TeamsPresenterDelegate? { get set }
    var view: TeamsView? { get set }
    var teamsRepository: TeamsRepository { get set }
    var elements: [TeamEntity] { get set }
    
    func set(leagueIdentifier: String?)
    
    //MARK: View Actions
    func didSelectTeam(at position: Int)
}

class TeamsPresenterImplementation: TeamsPresenter {
    var delegate: TeamsPresenterDelegate?
    var view: TeamsView?
    var teamsRepository: TeamsRepository
    var elements = [TeamEntity]()
    
    private var leagueIdentifier: String?
    
    init(teamsRepository: TeamsRepository) {
        self.teamsRepository = teamsRepository
    }
    
    func set(leagueIdentifier: String?) {
        guard let leagueIdentifier = leagueIdentifier else {
            // No league selected. Show empty list.
            elements = [TeamEntity]()
            view?.show(teams: [])
            return
        }
        guard leagueIdentifier != self.leagueIdentifier || elements.isEmpty else {
            // Return if the current league is the same with fetched elements
            return
        }
        self.leagueIdentifier = leagueIdentifier
        elements = [TeamEntity]()
        view?.setLoadingIndicator(visible: true)
        teamsRepository.getElements(with: leagueIdentifier) { [weak self] result in
            self?.view?.setLoadingIndicator(visible: false)
            switch result {
            case .value(let teams):
                self?.handleRecieved(teams: teams)
            case .error(let error):
                self?.handle(error: error)
            }
        }
    }
    
    private func handleRecieved(teams: [TeamEntity]) {
        elements = teams
        view?.show(teams: teams.map{ TeamViewModel(imageUrlString: $0.badgeUrl ?? "" ) } )
    }
    
    private func handle(error: RepositoryError) {
        
    }
    
    
}

//MARK:- View Actions
extension TeamsPresenterImplementation {
    func didSelectTeam(at position: Int) {
        guard position < elements.count else { return }
        self.delegate?.didSelectTeam(with: elements[position].identifier)
    }
}
