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
    var view: HomeView? { get }
    
    //MARK: Interactions
    func didLoadView()
    func didTapCancel()
}

class HomePresenterImplementation {
    var autocompletePresenter: AutocompletePresenter
    var teamsPresenter: TeamsPresenter
    var leaguesRepository: LeaguesRepository
    var view: HomeView?
    fileprivate var leagues = [LeagueEntity]()
    
    init(autocompletePresenter: AutocompletePresenter,
         teamsPresenter: TeamsPresenter,
         leaguesRepository: LeaguesRepository,
         view: HomeView?) {
        self.autocompletePresenter = autocompletePresenter
        self.teamsPresenter = teamsPresenter
        self.leaguesRepository = leaguesRepository
        self.view = view
    }
}

extension HomePresenter {
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
        autocompletePresenter.set(elements: leagues.map{ AutocompleteModel(text: $0.name,
                                                                        identifier: $0.identifier) })
    }
    
    private func handle(error: RepositoryError) {
        
    }
}
