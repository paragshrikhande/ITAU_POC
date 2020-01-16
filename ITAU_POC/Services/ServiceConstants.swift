//
//  ServiceConstants.swift
//  ITAU_POC
//
//  Created by Parag on 25/11/19.
//  Copyright © 2019 Parag. All rights reserved.
//

import Foundation

struct ServiceConstants {
    
    private struct Domains {
        static let Dev = "https://bank-app-test.herokuapp.com/api"
    }
    
    private struct Routes {
        static let Api = "/"
    }
    
    struct UrlCollection{
        struct LoginUrl {
            static let login = "login"
        }
        struct StatementUrl {
            static let statements = "statements/"
        }
    }
    
    private static let Route = Routes.Api
    static let BaseURL = Domains.Dev + Route
}

