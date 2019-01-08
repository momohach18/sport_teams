//
//  TeamPresenterTests.swift
//  LeaguesTests
//
//  Created by Macbook on 08/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import Leagues

class TeamsPresenterSpec: QuickSpec {
    override func spec() {
        describe("TeamsPresenter") {
            let view = TeamsViewTestImplementation()
            let repository = TeamsRepositoryTestsImplementation()
            let presenter = TeamsPresenterImplementation(teamsRepository: repository)
            let presenterDelegate = TeamsPresenterDelegateImplementation()
            presenter.view = view
            presenter.delegate = presenterDelegate
            view.presenter = presenter
            
            context("empty league") {
                it("return all") {
                    expect(view.elements.count).to(equal(0))
                }
            }
            
            context("select league L1") {
                it("contains 3 elements") {
                    presenter.set(leagueIdentifier: "L1")
                    expect(presenter.elements.count).to(equal(3))
                    expect(presenter.elements[2].badgeUrl).to(equal("U3"))
                    expect(presenter.elements[2].name).to(equal("L1-T3"))
                    expect(view.elements.count).to(equal(3))
                    expect(view.elements[2].imageUrlString).to(equal("U3"))
                    
                }
                
                it("select second") {
                    view.selectElement(at: 1)
                    expect(presenterDelegate.selectedIdentifier).to(equal("2"))
                }
            }
            
            context("retest empty league") {
                it("return all") {
                    presenter.set(leagueIdentifier: nil)
                    expect(view.elements.count).to(equal(0))
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
