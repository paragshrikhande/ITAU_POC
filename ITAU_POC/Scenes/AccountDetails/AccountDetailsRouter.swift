//
//  AccountDetailsRouter.swift
//  ITAU_POC
//
//  Created by Parag on 11/11/19.
//  Copyright (c) 2019 Parag. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol AccountDetailsRoutingLogic {
    func routeToLoginVC(segue: UIStoryboardSegue?)
}

protocol AccountDetailsDataPassing {
    var dataStore: AccountDetailsDataStore? { get }
}

class AccountDetailsRouter: NSObject, AccountDetailsDataPassing {
    weak var viewController: AccountDetailsViewController?
    var dataStore: AccountDetailsDataStore?
}

extension AccountDetailsRouter : AccountDetailsRoutingLogic {
    /// Navigate to Root view
    /// - Parameter segue: Segue Name
    func routeToLoginVC(segue: UIStoryboardSegue?) {
        if let accountDetailsVC = viewController {
            navigateToLoginVC(source: accountDetailsVC)
        }
    }
    
    // MARK: Navigation
    /// Pop View To Login
    /// - Parameter source: accountDetailsVC
    private func navigateToLoginVC(source: AccountDetailsViewController) {
        source.navigationController?.popToRootViewController(animated: true)
    }
}
