//
//  AuthenticationService.swift
//  WeAsk
//
//  Created by Bohirjon Akhmedov on 04/07/21.
//

import Foundation
import FirebaseAuth

protocol AuthenticationServiceProtocol {
    var authenticationDelegate: AuthenticationDelegate? {get set}
    func login(email: String, password: String)
    func signUp(email: String , password: String)
}

class AuthenticationService : AuthenticationServiceProtocol {
    
    var authenticationDelegate: AuthenticationDelegate?
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [self] result, error in
            guard let authenticationDelegate = authenticationDelegate else {return}
            if let error = error {
                let authenticationResult = AuthenticationResult(isSuccess: false, userName: nil, errorMessage: error.localizedDescription, userUId: "")
                authenticationDelegate.onLoginFinished(authenticationResult: authenticationResult)
            } else if let result = result {
                let userName = result.user.email!
                let userUId = result.user.uid
                let authenticationResult = AuthenticationResult(isSuccess: true, userName: userName, errorMessage: nil, userUId: userUId)
                authenticationDelegate.onLoginFinished(authenticationResult: authenticationResult)
            } else {
                let authenticationResult = AuthenticationResult(isSuccess: false, userName: nil, errorMessage: "could not get any data", userUId: "")
                authenticationDelegate.onLoginFinished(authenticationResult: authenticationResult)
            }
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [self] result, error in
            guard let authenticationDelegate = authenticationDelegate else {return}
            
            guard error != nil else {
                authenticationDelegate.onLoginFinished(authenticationResult: AuthenticationResult(isSuccess: false, userName: nil, errorMessage: error.debugDescription, userUId: ""))
                return
            }
            
            if let result = result {
                let userName = result.user.displayName
                let userUId = result.user.uid
                authenticationDelegate.onLoginFinished(authenticationResult: AuthenticationResult(isSuccess: true, userName: userName, errorMessage: nil, userUId: userUId))
            } else {
                let authenticationResult = AuthenticationResult(isSuccess: false, userName: nil, errorMessage: "could not get any data", userUId: "")
                authenticationDelegate.onLoginFinished(authenticationResult: authenticationResult)
            }
        }
    }
}

protocol AuthenticationDelegate {
    func onLoginFinished(authenticationResult: AuthenticationResult)
}
