//
//  SwiftUIView.swift
//  WeAsk
//
//  Created by Bohirjon Akhmedov on 04/07/21.
//

import SwiftUI

struct SignInView: View {
    @Namespace private var animation
    @ObservedObject private var viewModel: AuthenticationViewModel
    var body: some View {
        NavigationView {
            VStack {
                
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .font(.title)
                    .padding()
                Text("Login")
                    .bold()
                    .font(.title)
                
                Spacer()
                
                Group {
                    HStack {
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
                
                
                Button(action: {
                    withAnimation(.easeIn) {
                        viewModel.login()
                    }
                }, label: {
                    if viewModel.isLoading {
                        HStack {
                            ProgressView()
                                .padding(.horizontal)
                            Text("Login")
                                .matchedGeometryEffect(id: "Login", in: animation)
                        }
                    } else {
                        Text("Login")
                            .matchedGeometryEffect(id: "Login", in: animation)
                    }
                })
                .foregroundColor(.white)
                .frame(width: 250, height: 45)
                .background(viewModel.isLoading ? Color.blue.opacity(0.5) : Color.blue)
                .cornerRadius(13.0)
                .padding(.vertical, 40)
                
                Text("Don't have an account yet?")
                    .foregroundColor(.gray)
                NavigationLink("Sign up", destination: SignUpView()
                                .environmentObject(viewModel))
                
                Spacer()
            }
        }
    }
    init(viewModel: AuthenticationViewModel = AuthenticationViewModel()) {
        self.viewModel = viewModel
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
