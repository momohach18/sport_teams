//
//  UIViewController+Extensions.swift
//  Leagues
//
//  Created by Macbook on 08/01/2019.
//  Copyright © 2019 MAH. All rights reserved.
//

import UIKit
import MBProgressHUD

// MARK:- Loader
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

// MARK:- Alert
extension UIViewController {
    func showError(title: String?, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: L10n.Commun.ok, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}



