//
//  AutocompleteViewController.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit

protocol AutocompleteView: class {
    func show(elements: [String])
}

class AutocompleteViewController: UIViewController, AutocompleteView, UITableViewDataSource, UITableViewDelegate {
    private static let basicCellIdentifier = "BasicCell"
    @IBOutlet weak var tableView: UITableView!
    var presenter: AutocompletePresenter?
    private var elements = [String]()
    
    func show(elements: [String]) {
        self.elements = elements
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AutocompleteViewController.basicCellIdentifier)
        cell?.textLabel?.text = elements[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectElement(with: elements[indexPath.row])
    }
}
