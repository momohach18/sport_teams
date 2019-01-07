//
//  TeamsViewController.swift
//  Leagues
//
//  Created by Macbook on 07/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit

protocol TeamsView {
    var teams: [TeamViewModel] { get set }
    func setLoadingIndicator(visible: Bool)
}

struct TeamViewModel {
    
}

class TeamsViewController: UIViewController {
    
}
