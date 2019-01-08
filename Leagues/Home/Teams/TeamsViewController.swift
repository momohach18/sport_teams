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

class TeamsViewController: UIViewController {
    
}
