//
//  HomeViewController.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit

protocol HomeView {
    func showAutocompleteView()
    func showTeamsView()
    func showEmptyView()
    func setLoadingIndicator(visible: Bool)
}

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
