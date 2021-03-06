//
//  LoginWorker.swift
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

class LoginWorker {
    /// Authenticate User
    /// - Parameters:
    ///   - username: User Name
    ///   - password: Password
    ///   - completion: Response received from service
    func authenticateUser(username: String, password: String, completion: @escaping (Bool, LoginResponse?, Error?) -> Void) {
        guard let urlString = URL(string: ServiceConstants.BaseURL + ServiceConstants.UrlCollection.LoginUrl.login)
            else {
                return
        }
        let body = LoginInfo(user: username, password: password)
        
        ServiceHandler.postRequest(url: urlString, responseType: LoginResponse.self, body: body) {
            response, error in
            if let response = response {
                completion(true, response, nil)
            } else {
                completion(false, nil, error)
            }
        }
    }
}
