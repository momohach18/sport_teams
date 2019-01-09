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
}

struct PlayerViewModel {
    let identifier: String
    let name: String
    let birthDate: String?
    let signingAmout: String?
    let headImageUrlString: String?
    let thumbnailImageUrlString: String?
}

class PlayersViewController: UIViewController {
    
}
