//
//  AutocompleteTests.swift
//  LeaguesTests
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import Leagues

class AutocompleteSpec: QuickSpec {
    override func spec() {
        describe("Autocomplete") {
            let view = AutocompletionViewTestImplementation()
            let presenter = AutocompletePresenterImplementation()
            let presenterDelegate = AutocompletionPresenterDelegateImplementation()
            presenter.view = view
            presenter.delegate = presenterDelegate
            view.presenter = presenter
            presenter.set(elements: [AutocompleteModel(text: "English Premier League", identifier: "1"),
                                     AutocompleteModel(text: "English League Championship", identifier: "2"),
                                     AutocompleteModel(text: "Scottish Premier League", identifier: "3"),
                                     AutocompleteModel(text: "German Bundesliga", identifier: "4"),
                                     AutocompleteModel(text: "Italian Serie A", identifier: "5"),
                                     AutocompleteModel(text: "French Ligue 1", identifier: "6")])
            

            context("empty string") {
                presenter.set(currentText: "")
                it("return all") {
                    expect(view.elements?.count).to(equal(6))
                }
            }
            
            context("existing elements") {
                it("contains 2 elements") {
                    presenter.set(currentText: "eng")
                    expect(view.elements?.count).to(equal(2))
                }
                
                it("select second") {
                    view.selectElement(at: 1)
                    expect(presenterDelegate.selectedIdentifier).to(equal("2"))
                }
                
                it("contains 1 element") {
                    presenter.set(currentText: "German")
                    expect(view.elements?.count).to(equal(1))
                }
            }
            
            context("retest empty string") {
                it("return all") {
                    presenter.set(currentText: "")
                    expect(view.elements?.count).to(equal(6))
                }
            }
            
            context("inexistent element") {
                it("return nothing") {
                    presenter.set(currentText: "br")
                    expect(view.elements?.count).to(equal(0))
                }
            }
        }
    }
}

