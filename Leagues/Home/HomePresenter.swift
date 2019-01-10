//
//  HomePresenter.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol HomePresenter: class {
    var autocompletePresenter: AutocompletePresenter { get }
    var teamsPresenter: TeamsPresenter { get }
    var leaguesRepository: LeaguesRepository { get }
    var playersPresenter: PlayersPresenter? { get }
    var view: HomeView? { get }
    
    //MARK: Actions from view
    func didLoadView()
    func didTapCancel()
    func set(searchText: String)
    func didStartEditingSearchText()
}

class HomePresenterImplementation: HomePresenter {
    var autocompletePresenter: AutocompletePresenter
    var teamsPresenter: TeamsPresenter
    var leaguesRepository: LeaguesRepository
    var view: HomeView?
    fileprivate var leagues = [LeagueEntity]()
    private var selectedTeamIdentifier: String?
    
    init(autocompletePresenter: AutocompletePresenter,
         teamsPresenter: TeamsPresenter,
         leaguesRepository: LeaguesRepository,
         view: HomeView?) {
        self.autocompletePresenter = autocompletePresenter
        self.teamsPresenter = teamsPresenter
        self.leaguesRepository = leaguesRepository
        self.view = view
        self.teamsPresenter.delegate = self
        self.autocompletePresenter.delegate = self
    }
    
    private func set(selectedLeague: LeagueEntity) {
        teamsPresenter.set(leagueIdentifier: selectedLeague.identifier)
    }
    
    var playersPresenter: PlayersPresenter? {
        guard let selectedTeamIdentifier = selectedTeamIdentifier else { return nil }
        return PlayersPresenterImplementation(teamIdentifier: selectedTeamIdentifier,
            playersRepository: PlayersRepositoryImplementation())
    }
}

//MARK:- AutocompletePresenterDelegate
extension HomePresenterImplementation: AutocompletePresenterDelegate {
    func didSelectSearchElement(with identifier: String) {
        guard let selectedLeague = leagues.first(where: { $0.identifier == identifier }) else { return }
        set(selectedLeague: selectedLeague)
        view?.set(searchBarText: selectedLeague.name)
        view?.showTeamsView()
    }
}


//MARK:- TeamsPresenterDelegate
extension HomePresenterImplementation: TeamsPresenterDelegate {
    func didSelectTeam(with identifier: String) {
        selectedTeamIdentifier = identifier
        view?.pushPlayersView()
    }
}

//MARK:- Actions from view
extension HomePresenterImplementation {
    func didLoadView() {
        view?.setLoadingIndicator(visible: true)
        leaguesRepository.getAllElements { [weak self] result in
            self?.view?.setLoadingIndicator(visible: false)
            switch result {
            case .value(let leagues):
                self?.handleRecieved(leagues: leagues)
            case .error(let error):
                self?.handle(error: error)
            }
        }
    }
    
    private func handleRecieved(leagues: [LeagueEntity]) {
        self.leagues = leagues
        autocompletePresenter.set(elements: leagues.map{ AutocompleteModel(text: $0.name,
                                                                        identifier: $0.identifier) })
    }
    
    private func handle(error: RepositoryError) {
        switch error {
        case .network:
            view?.showError(title: L10n.Error.Network.title,
                            message: L10n.Error.Network.body)
        case .technical:
            view?.showError(title: L10n.Error.Technical.title,
                            message: L10n.Error.Technical.body)
        case .notfound:
            view?.showError(title: L10n.Error.Notfound.title,
                            message: L10n.Error.Notfound.Body.plural)
        }
    }
    
    func didTapCancel() {
        view?.showTeamsView()
    }
    
    func set(searchText: String) {
        autocompletePresenter.set(currentText: searchText)
        guard let selectedLeague = leagues.first(where: { $0.name.lowercased() == searchText.lowercased() }) else {
            return
        }
        set(selectedLeague: selectedLeague)
    }
    
    func didStartEditingSearchText() {
        view?.showAutocompleteView()
    }
}
