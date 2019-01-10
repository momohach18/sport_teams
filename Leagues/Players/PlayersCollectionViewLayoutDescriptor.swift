//
//  PlayersCollectionViewLayoutDescriptor.swift
//  Leagues
//
//  Created by Macbook on 10/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit

struct PlayersCollectionViewLayoutDescriptor: CollectionViewLayoutDescriptor {
    var cellSize: CGSize {
        let cellsPerRow = self.cellsPerRow
        let cellWidth: CGFloat = ( self.collectionWidth - (CGFloat(cellsPerRow + 1)) * self.spacing ) / CGFloat(cellsPerRow)
        let cellHeight: CGFloat = 158
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    var insets: UIEdgeInsets {
        return UIEdgeInsets(top: self.spacing,
                            left: self.spacing,
                            bottom: self.spacing,
                            right: self.spacing)
    }
    
    var verticalSpacing: CGFloat {
        return self.spacing
    }
    
    var horizontalSpacing: CGFloat {
        return self.spacing
    }
    
    init(with width: CGFloat) {
        self.collectionWidth = width
    }
    
    private var collectionWidth: CGFloat
    
    private let spacing: CGFloat = 12
    
    private var cellsPerRow: CGFloat {
        if collectionWidth > 1000 {
            return 3
        }
        if collectionWidth > 720 {
            return 2
        }
        else {
            return 1
        }
    }
}
