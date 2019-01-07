//
//  TeamsPresenter.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol TeamsPresenterDelegate {
    
}

protocol TeamsPresenter {
    var delegate: TeamsPresenterDelegate? { get }
    var view: TeamsView? { get }
    
    var elements: [TeamEntity] { get set }
    
    //MARK: Interactions
    func didSelectTeam(with identifier: String)
}
