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
    func showError(title: String?, message: String)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectTeam(at: indexPath.row)
    }
}

//MARK:- Layout
extension TeamsViewController{
    var collectionViewLayout: UICollectionViewFlowLayout {
        return collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    }
    
    func updateLayout(width: CGFloat) {
        let layoutDescriptor = TeamsCollectionViewLayoutDescriptor(with: width)
        collectionViewLayout.itemSize = layoutDescriptor.cellSize
        collectionViewLayout.sectionInset = layoutDescriptor.insets
        collectionViewLayout.minimumLineSpacing = layoutDescriptor.verticalSpacing
        collectionViewLayout.minimumInteritemSpacing = layoutDescriptor.horizontalSpacing
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateLayout(width: self.view.frame.width)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateLayout(width: size.width)
        collectionViewLayout.invalidateLayout()
    }
}
