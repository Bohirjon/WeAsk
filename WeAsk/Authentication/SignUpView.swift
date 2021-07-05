//
//  SignUpView.swift
//  WeAsk
//
//  Created by Bohirjon Akhmedov on 05/07/21.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    var body: some View {
        HStack {
            Group {
                VStack {
                    Text("Email")
                        .foregroundColor(.blue.opacity(0.6))
                    Spacer()
                }
                TextField("youname@example.com", text: $viewModel.email)
                
                Divider()
                
                HStack {
                    Text("Password")
                        .foregroundColor(.blue.opacity(0.6))
                    Spacer()
                }
                TextField("your_password", text: $viewModel.password)
                    
                    .textFieldStyle(PlainTextFieldStyle())
                Divider()
            }
            .padding(.horizontal)
            
            Button (action: {
                viewModel.signUp()
            }, label: {
                Text("Sign up")
            })
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
