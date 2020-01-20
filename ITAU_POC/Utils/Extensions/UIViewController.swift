//
//  UIViewController.swift
//  ITAU_POC
//
//  Created by Parag on 18/01/20.
//  Copyright © 2020 Parag. All rights reserved.
//

import UIKit

extension UIViewController {
    /// Show Alert message
    /// - Parameters:
    ///   - titleString: Alter Title
    ///   - messageString: Alert Description
    func showAlertMessage(titleString : String, messageString : String) {
        let actionStr = NSLocalizedString("txt_Ok", comment: "")
        let alert = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionStr, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
