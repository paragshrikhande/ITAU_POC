//
//  Validator.swift
//  ITAU_POC
//
//  Created by Parag on 10/12/19.
//  Copyright © 2019 Parag. All rights reserved.
//

import Foundation

protocol ValidatorConvertible {
    func validated(_ value: String?) throws -> String
}

enum ValidatorType {
    case username
    case password
}

enum VaildatorFactory {
    /// Validate For Given Input
    /// - Parameter type: Validation Type .userName / .password
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .username: return UserNameValidator()
        case .password: return PasswordValidator()
        }
    }
}

struct ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

struct UserNameValidator: ValidatorConvertible {
    /// Validate for User Name
    /// - Parameter value: User Name Input
    func validated(_ value: String?) throws -> String {
        var resultStr : String = ""
        if let userNameValue = value {
            resultStr = userNameValue
            do {
                if try NSRegularExpression(pattern: "^([0-9]{3}\\.[0-9]{3}\\.[0-9]{3}-[0-9]{2})|([A-Z0-9a-z.0-9_%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4})$", options: .caseInsensitive).firstMatch(in: userNameValue, options: [], range: NSRange(location: 0, length: userNameValue.count)) == nil {
                    throw ValidationError(NSLocalizedString("txt_InvalidUserName", comment: ""))
                }
            } catch {
                throw ValidationError(NSLocalizedString("txt_InvalidUserName", comment: ""))
            }
        }
        return resultStr
    }
}

struct PasswordValidator: ValidatorConvertible {
    /// Validate for password
    /// - Parameter value: Password input
    func validated(_ value: String?) throws -> String {
        var resultStr : String = ""
        if let passwordValue = value {
            resultStr = passwordValue
            do {
                if try NSRegularExpression(pattern: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]", options: .caseInsensitive).firstMatch(in: passwordValue, options: [], range: NSRange(location: 0, length: passwordValue.count)) == nil {
                    throw ValidationError(NSLocalizedString("txt_InvalidPassword", comment: ""))
                }
            } catch {
                throw ValidationError(NSLocalizedString("txt_InvalidPassword", comment: ""))
            }
        }
        return resultStr
    }
}
