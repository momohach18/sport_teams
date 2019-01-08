//
//  UIViewController+Loader.swift
//  Leagues
//
//  Created by Macbook on 08/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    func setLoadingIndicator(visible: Bool) {
        if visible {
            MBProgressHUD.showAdded(to: view, animated: true)
        }
        else {
            MBProgressHUD.hide(for: view, animated: true)
        }
    }
}
