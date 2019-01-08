//
//  AutocompletePresenter.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import Foundation

protocol AutocompletePresenterDelegate {
    func didSelectSearchElement(with identifier: String)
}

protocol AutocompletePresenter: class {
    var delegate: AutocompletePresenterDelegate? { get set }
    var view: AutocompleteView? { get set }
    
    func set(elements: [AutocompleteModel])
    func set(currentText: String)
    
    //MARK: Interactions
    func didSelectElement(with string: String)
}

class AutocompletePresenterImplementation: AutocompletePresenter {
    var delegate: AutocompletePresenterDelegate?
    
    weak var view: AutocompleteView?
    
    private var elements = [AutocompleteModel]()
    private var currentText = ""
    func set(elements: [AutocompleteModel]) {
        self.elements = elements
        self.set(currentText: currentText)
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
        self.delegate?.didSelectSearchElement(with: element.identifier)
    }
}
