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
    func setLoadingIndicator(visible: Bool)
    func set(searchBarText: String)
}

class HomeViewController: UIViewController {
    var presenter: HomePresenter?
    @IBOutlet weak var teamsContainerView: UIView!
    @IBOutlet weak var autocompleteContainerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoadView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "TeamsViewController":
            guard let teamsViewController = segue.destination as? TeamsViewController else { return }
            configure(teamsViewController: teamsViewController)
        case "AutocompleteViewController":
            guard let autocompleteViewController = segue.destination as? AutocompleteViewController else { return }
            configure(autocompleteViewController: autocompleteViewController)
        default:
            break
        }
    }
    
    func configure() {
        presenter = HomePresenterImplementation(autocompletePresenter: AutocompletePresenterImplementation(),
                                                teamsPresenter: TeamsPresenterImplementation(teamsRepository: TeamsRepositoryImplementation()),
                                                leaguesRepository: LeaguesRepositoryImplementation(),
                                                view: self)
    }
    
    func configure(teamsViewController: TeamsViewController) {
        teamsViewController.presenter = presenter?.teamsPresenter
        presenter?.teamsPresenter.view = teamsViewController
    }
    
    func configure(autocompleteViewController: AutocompleteViewController) {
        autocompleteViewController.presenter = presenter?.autocompletePresenter
        presenter?.autocompletePresenter.view = autocompleteViewController
    }
    
}

extension HomeViewController: HomeView {
    
    func showAutocompleteView() {
        autocompleteContainerView.isHidden = false
        teamsContainerView.isHidden = true
    }
    
    func showTeamsView() {
        view.endEditing(true)
        autocompleteContainerView.isHidden = true
        teamsContainerView.isHidden = false
    }
    
    func set(searchBarText: String) {
        searchBar.text = searchBarText
        view.endEditing(true)
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.set(searchText: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.didTapCancel()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.didTapCancel()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        presenter?.didStartEditingSearchText()
    }
}
