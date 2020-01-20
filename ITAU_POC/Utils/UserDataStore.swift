//
//  UserDataStore.swift
//  ITAU_POC
//
//  Created by Parag on 03/12/19.
//  Copyright © 2019 Parag. All rights reserved.
//

import Foundation
class UserDataStore {
    static let shared = UserDataStore()
    private init() {
    }
    
    /// Get Logged in user id
    func getLoggedInUserId() -> String? {
        return UserDefaults.standard.string(forKey: AppConstant.txtUserID)
    }
    
    /// Get logged in user name
    func getLoggedInUserName() -> String? {
        return UserDefaults.standard.string(forKey: AppConstant.txtUserName)
    }
    
    /// Store User Id and User name
    /// - Parameters:
    ///   - userId: User Id
    ///   - userName: User Name
    func storeUserData(userId : String?, userName : String?) {
        UserDefaults.standard.removeObject(forKey: AppConstant.txtUserID)
        UserDefaults.standard.removeObject(forKey: AppConstant.txtUserName)
        
        UserDefaults.standard.set(userId, forKey: AppConstant.txtUserID)
        UserDefaults.standard.set(userName, forKey: AppConstant.txtUserName)
        UserDefaults.standard.synchronize()
    }
    
    /// Clear Login Data
    func clearLoginData() {
        resetDefaults()
    }
    
    /// Reset Login Data
    private func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
