//
//  PlayersPresenter.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol PlayersPresenterDelegate {
    
}

protocol PlayersPresenter: class {
    var delegate: PlayersPresenterDelegate? { get }
    var leaguesRepository: PlayersRepository { get }
    var view: HomeView? { get }
    //MARK: Interactions
    func didSelectPlayer(with identifier: String)
}
