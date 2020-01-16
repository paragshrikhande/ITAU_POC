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
    
    func getLoggedInUserId() -> String? {
        return UserDefaults.standard.string(forKey: AppConstant.txtUserID)
    }
    
    func getLoggedInUserName() -> String? {
        return UserDefaults.standard.string(forKey: AppConstant.txtUserName)
    }
    
    func storeUserData(userId : String?, userName : String?) {
        UserDefaults.standard.removeObject(forKey: AppConstant.txtUserID)
        UserDefaults.standard.removeObject(forKey: AppConstant.txtUserName)
        
        UserDefaults.standard.set(userId, forKey: AppConstant.txtUserID)
        UserDefaults.standard.set(userName, forKey: AppConstant.txtUserName)
        UserDefaults.standard.synchronize()
    }
    
    func clearLoginData() {
        resetDefaults()
    }
    
    private func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
