//
//  AutocompleteTestImplementations.swift
//  LeaguesTests
//
//  Created by Macbook on 08/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

@testable import Leagues

class AutocompletionViewTestImplementation: AutocompleteView {
    
    var presenter: AutocompletePresenter!
    var elements: [String]?
    
    func show(elements: [String]) {
        self.elements = elements
    }
    
    func selectElement(at position: Int) {
        guard let element = elements?[position] else { return }
        presenter.didSelectElement(with: element)
    }
}

class AutocompletionPresenterDelegateImplementation: AutocompletePresenterDelegate {
    var selectedIdentifier: String?
    func didSelectElement(with identifier: String) {
        selectedIdentifier = identifier
    }
}
