//
//  LoginInteractor.swift
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

protocol LoginBusinessLogic {
    func loginUser(request: Login.LoginModel.Request)
    func getUserDetails()
    
}

protocol LoginDataStore {
    var userDetails: UserAccount? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker = LoginWorker()
    var userDetails: UserAccount?
    
    // MARK: Do something
    func loginUser(request: Login.LoginModel.Request) {
        let user = request.loginInfo?.user
        let password = request.loginInfo?.password
        presenter?.presentStartLoaderActivity()
        worker.authenticateUser(username: user ?? "", password: password ?? "") { [weak self] (success, response, error) in
            
            if(success) {
                if let responseData = response, let userId = responseData.userAccount.userId {
                    UserDataStore.shared.storeUserData(userId: String(format: "%d", userId), userName: user)
                    let response = Login.LoginModel.Response(loginResponse: responseData)
                    self?.userDetails = response.loginResponse?.userAccount
                    self?.presenter?.presentAuthenticationResult(response: response)
                }
            }
            else {
                self?.presenter?.presentStopLoaderActivity()
            }
        }
    }
    
    func getUserDetails() {
        let userName = UserDataStore.shared.getLoggedInUserName()
        let loginInfo = LoginInfo(user: userName, password: "")
        let request = Login.LoginModel.Request(loginInfo: loginInfo)
        presenter?.presentLoggedInUserDetails(request: request)
    }
}
