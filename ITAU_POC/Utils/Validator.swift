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
    func validated(_ value: String?) throws -> String {
        var resultStr : String = ""
        if let userNameValue = value {
            resultStr = userNameValue
            do {
                if try NSRegularExpression(pattern: "^([0-9]{3}\\.[0-9]{3}\\.[0-9]{3}-[0-9]{2})|([A-Z0-9a-z.0-9_%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4})$", options: .caseInsensitive).firstMatch(in: userNameValue, options: [], range: NSRange(location: 0, length: userNameValue.count)) == nil {
                    throw ValidationError(AppConstant.txtInvalidUserName)
                }
            } catch {
                throw ValidationError(AppConstant.txtInvalidUserName)
            }
        }
        return resultStr
    }
}

struct PasswordValidator: ValidatorConvertible {
    func validated(_ value: String?) throws -> String {
        var resultStr : String = ""
        if let passwordValue = value {
            resultStr = passwordValue
            do {
                if try NSRegularExpression(pattern: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]", options: .caseInsensitive).firstMatch(in: passwordValue, options: [], range: NSRange(location: 0, length: passwordValue.count)) == nil {
                    throw ValidationError(AppConstant.txtInvalidPassword)
                }
            } catch {
                throw ValidationError(AppConstant.txtInvalidPassword)
            }
        }
        return resultStr
    }
}
