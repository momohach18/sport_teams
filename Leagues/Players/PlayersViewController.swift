//
//  PlayersViewController.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit

protocol PlayersView {
    func show(players: [PlayerViewModel])
    func setLoadingIndicator(visible: Bool)
    func showError(title: String?, message: String)
}

struct PlayerViewModel {
    let identifier: String
    let name: String
    let position: String?
    let birthDate: String?
    let signingAmout: String?
    let imageUrlString: String?
}

class PlayersViewController: UIViewController, PlayersView, UICollectionViewDelegate, UICollectionViewDataSource {
    var presenter: PlayersPresenter?
    private var players = [PlayerViewModel]()
    private static let playerCellIdentifier = "PlayerCollectionViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoadView()
    }
    
    func show(players: [PlayerViewModel]) {
        self.players = players
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayersViewController.playerCellIdentifier, for: indexPath) as? PlayerCollectionViewCell
        cell?.configure(with: players[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectPlayer(at: indexPath.row)
    }
}

//MARK:- Layout
extension PlayersViewController{
    var collectionViewLayout: UICollectionViewFlowLayout {
        return collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    }
    
    func updateLayout(width: CGFloat) {
        let layoutDescriptor = PlayersCollectionViewLayoutDescriptor(with: width)
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
