//
//  AuthenticationViewModel.swift
//  WeAsk
//
//  Created by Bohirjon Akhmedov on 04/07/21.
//

import Foundation

class AuthenticationViewModel: ObservableObject {

    var authenticationService : AuthenticationServiceProtocol
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading = false;
    
    func login() {
        isLoading = true
        authenticationService.login(email: email, password: password)
    }
    
    func signUp() {
        isLoading = true
        authenticationService.signUp(email: email, password: password)
    }
    
    init(authenticationService: AuthenticationServiceProtocol = AuthenticationService()) {
        self.authenticationService = authenticationService;
        self.authenticationService.authenticationDelegate = self
    }
}

extension AuthenticationViewModel : AuthenticationDelegate {
    func onLoginFinished(authenticationResult: AuthenticationResult) {
        DispatchQueue.main.async {
            self.isLoading = false
            print(authenticationResult)
        }
    }
}
