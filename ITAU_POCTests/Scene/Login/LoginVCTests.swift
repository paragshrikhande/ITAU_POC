//
//  LoginVCTests.swift
//  ITAU_POCTests
//
//  Created by Parag on 16/01/20.
//  Copyright © 2020 Parag. All rights reserved.
//

import Foundation
import XCTest

@testable import ITAU_POC

class LoginVCTests : XCTestCase {
    var loginViewController: LoginViewController!
    var window: UIWindow!
    
    override func setUp() {
        window = UIWindow()
        //        setupLoginViewController()
    }
    
    func setupLoginViewController()
    {
        let bundle = Bundle(for: self.classForCoder)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
    }
    
    // MARK: - Test Username
    func testValidUserName() {
        let loginInfo = LoginInfo(user: "pp@pp.com", password: "Password@123")
        let validator = VaildatorFactory.validatorFor(type: .username)
        do {
            let result : String = try validator.validated(loginInfo.user)
            XCTAssertTrue(result == loginInfo.user)
        }
        catch(let error) {
            XCTAssertFalse(error.localizedDescription.count > 0, AppConstant.txtInvalidUserName)
        }
    }
    
    // MARK: - Test Password
    func testValidPassword() {
        let loginInfo = LoginInfo(user: "pp@pp.com", password: "Password@123")
        let validator = VaildatorFactory.validatorFor(type: .password)
        do {
            let result : String = try validator.validated(loginInfo.password)
            XCTAssertTrue(result == loginInfo.password)
        }
        catch(let error) {
            XCTAssertFalse(error.localizedDescription.count > 0, AppConstant.txtInvalidPassword)
        }
    }
}
