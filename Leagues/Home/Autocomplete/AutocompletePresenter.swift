//
//  AutocompletePresenter.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol AutocompletePresenterDelegate {
    func didSelect(model: AutocompleteModel)
}

protocol AutocompletePresenter: class {
    var delegate: AutocompletePresenterDelegate? { get }
    var view: AutocompleteView? { get }
    
    var elements: [AutocompleteModel] { get set }
    
    func set(currentText: String)
    
    //MARK: Interactions
    func didSelectElement(at position: UInt)
}

extension AutocompletePresenter {
    func set(currentText: String) {
        view?.show(elements: self.elements.filter { $0.text.hasPrefix(currentText) })
    }
}
