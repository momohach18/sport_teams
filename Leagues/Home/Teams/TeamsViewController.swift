//
//  TeamsViewController.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit

protocol TeamsView {
    func show(teams: [TeamViewModel])
    func setLoadingIndicator(visible: Bool)
}

struct TeamViewModel {
    let imageUrlString: String
}

class TeamsViewController: UIViewController, TeamsView, UICollectionViewDelegate, UICollectionViewDataSource {
    var presenter: TeamsPresenter?
    private var teams = [TeamViewModel]()
    private static let teamCellIdentifier = "TeamCollectionViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    func show(teams: [TeamViewModel]) {
        self.teams = teams
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsViewController.teamCellIdentifier, for: indexPath) as? TeamCollectionViewCell
        cell?.configure(with: teams[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

