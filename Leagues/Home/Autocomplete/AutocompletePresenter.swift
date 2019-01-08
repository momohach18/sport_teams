//
//  AutocompletePresenter.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol AutocompletePresenterDelegate {
    func didSelectElement(with identifier: String)
}

protocol AutocompletePresenter: class {
    var delegate: AutocompletePresenterDelegate? { get }
    var view: AutocompleteView? { get }
    
    func set(elements: [AutocompleteModel])
    func set(currentText: String)
    
    //MARK: Interactions
    func didSelectElement(with string: String)
}

class AutocompletePresenterImplementation: AutocompletePresenter {
    var delegate: AutocompletePresenterDelegate?
    
    weak var view: AutocompleteView?
    
    private var elements = [AutocompleteModel]()
    
    func set(elements: [AutocompleteModel]) {
        self.elements = elements
    }
    
    func set(currentText: String) {
        guard !currentText.isEmpty else {
            view?.show(elements: self.elements.map { $0.text })
            return
        }
        view?.show(elements: self.elements.filter { $0.text.lowercased().hasPrefix(currentText.lowercased()) }
                                          .map { $0.text })
    }
    
    func didSelectElement(with string: String) {
        guard let element = elements.first(where: { $0.text == string}) else { return }
        self.delegate?.didSelectElement(with: element.identifier)
    }
}
