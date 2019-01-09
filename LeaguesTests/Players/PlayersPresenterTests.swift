//
//  PlayerPresenterTests.swift
//  LeaguesTests
//
//  Created by Macbook on 08/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import Leagues

class PlayersPresenterSpec: QuickSpec {
    override func spec() {
        describe("PlayersPresenter") {
            let view = PlayersViewTestImplementation()
            let repository = PlayersRepositoryTestsImplementation()
            let presenter = PlayersPresenterImplementation(teamIdentifier: "L1", playersRepository: repository)
            let presenterDelegate = PlayersPresenterDelegateImplementation()
            presenter.view = view
            presenter.delegate = presenterDelegate
            view.presenter = presenter
            
            context("select team L1") {
                it("contains 3 elements") {
                    presenter.didLoadView()
                    expect(presenter.players.count).to(equal(5))
                    expect(presenter.players[2].name).to(equal("P2"))
                    expect(view.players.count).to(equal(5))
                    expect(view.players[2].signingAmout).to(equal("2"))
                    
                }
                
                it("select second") {
                    view.selectElement(at: 1)
                    expect(presenterDelegate.selectedIdentifier).to(equal("1"))
                }
            }
                        
            context("inexistent element") {
                it("return inexistent element error") {
                    
                }
            }
            
            context("malformatted json") {
                it("return technical error") {
                    
                }
            }
        }
    }
}
