//
//  TeamCollectionViewCell.swift
//  Leagues
//
//  Created by Macbook on 08/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit
import Kingfisher

class TeamCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    func configure(with viewModel: TeamViewModel) {
        let url = URL(string: viewModel.imageUrlString)
        imageView.kf.setImage(with: url)
    }
}
