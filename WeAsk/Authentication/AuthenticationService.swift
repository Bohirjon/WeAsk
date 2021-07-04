//
//  AuthenticationService.swift
//  WeAsk
//
//  Created by Bohirjon Akhmedov on 04/07/21.
//

import Foundation
import FirebaseAuth

protocol AuthenticationServiceProtocol {
    var authenticationProtocol: AuthenticationProtocol { get }
    func login(login: String, password: String)
}

class AuthenticationService {
    
    var authenticationProtocol: AuthenticationProtocol?
    
    func login(login: String, password: String) {
        Auth.auth().signIn(withEmail: login, password: password) { [self] result, error in
            guard let authProtocol = authenticationProtocol else {return}
            
            if let error = error {
                let authenticationResult = AuthenticationResult(isSuccess: false, userName: nil, errorMessage: error.localizedDescription)
                authProtocol.onLoginFinished(authenticationResult: authenticationResult)
            } else if let result = result {
                let userName = result.user.email!
                let authenticationResult = AuthenticationResult(isSuccess: true, userName: userName, errorMessage: nil)
                authProtocol.onLoginFinished(authenticationResult: authenticationResult)
            } else {
                let authenticationResult = AuthenticationResult(isSuccess: false, userName: nil, errorMessage: "could not get any data")
                authProtocol.onLoginFinished(authenticationResult: authenticationResult)
            }
        }
    }
}

protocol AuthenticationProtocol {
    func onLoginFinished(authenticationResult: AuthenticationResult)
}
