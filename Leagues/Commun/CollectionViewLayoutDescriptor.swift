//
//  CollectionViewLayoutDescriptor.swift
//  Leagues
//
//  Created by Macbook on 10/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit

protocol CollectionViewLayoutDescriptor {
    var cellSize: CGSize { get }
    var insets: UIEdgeInsets { get }
    var verticalSpacing: CGFloat { get }
    var horizontalSpacing: CGFloat { get }
}
