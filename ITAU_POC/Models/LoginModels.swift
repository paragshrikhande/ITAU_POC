//
//  LoginModels.swift
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

struct LoginInfo : Encodable {
    var user: String?
    var password: String?
}

struct UserAccount : Codable {
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Double?
}

struct LoginResponse: Codable {
    let userAccount: UserAccount
    let error: ErrorModel
}

enum Login {
    // MARK: Use cases
    enum LoginModel {
        struct Request {
            var loginInfo: LoginInfo?
        }
        
        struct Response {
            var loginResponse: LoginResponse?
        }
        
        struct ViewModel {
            let loginResponse: LoginResponse?
        }
    }
}
