//
//  TextField.swift
//  ITAU_POC
//
//  Created by Parag on 13/01/20.
//  Copyright © 2020 Parag. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    /// Validate text field for given input
    /// - Parameter validationType: Validation Type .username or .password
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
