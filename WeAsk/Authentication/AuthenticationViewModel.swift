//
//  AuthenticationViewModel.swift
//  WeAsk
//
//  Created by Bohirjon Akhmedov on 04/07/21.
//

import Foundation

class AuthenticationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLogging = false;
    
    func login() {
        isLogging = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
            self.isLogging = false
        })
    }
    
    func signUp() {
        print("sign up")
    }
}
