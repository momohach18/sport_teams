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
            let presenter = PlayersPresenterImplementation(playersRepository: repository)
            let presenterDelegate = PlayersPresenterDelegateImplementation()
            presenter.view = view
            presenter.delegate = presenterDelegate
            view.presenter = presenter
            
            context("empty team") {
                it("return all") {
                    expect(view.players.count).to(equal(0))
                }
            }
            
            context("select team L1") {
                it("contains 3 elements") {
                    presenter.set(teamIdentifier: "L1")
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
            
            context("retest empty team") {
                it("return all") {
                    presenter.set(teamIdentifier: nil)
                    expect(view.players.count).to(equal(0))
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
