//
//  PlayerCollectionViewCell.swift
//  Leagues
//
//  Created by Macbook on 09/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    func configure(with viewModel: PlayerViewModel) {
        nameLabel.text = viewModel.name
        positionLabel.text = viewModel.position
        birthDateLabel.text = "\(L10n.Player.birthdate): \(viewModel.birthDate ?? "")"
        priceLabel.text = "\(L10n.Player.price): \(viewModel.signingAmout ?? "")"
        guard let imageUrlString = viewModel.imageUrlString else { return }
        let url = URL(string: imageUrlString)
        imageView.kf.setImage(with: url)
    }
}
