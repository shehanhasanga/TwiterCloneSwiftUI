//
//  LoginView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI

struct LoginView: View {
    @State var email : String = ""
    @State var password : String = ""
    var body: some View {
        VStack{
            AuthenticationHeader(title1: "Hello.", title2: "Welcome Back.")
            
            
            
            VStack(spacing:40){
                CustomInputView(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputView(imageName: "lock", placeholderText: "Password", text: $password)
//                TextField("Email", text: $email)
//                TextField("Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            HStack{
                Spacer()
                NavigationLink {
                    
                } label: {
                    Text("Forgot Password")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 24)
                        .padding(.top)
                }

            }
            
            Button {
                
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .frame(width: 340, height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(1), radius: 10, x: 0, y: 5)

            
            Spacer()
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack{
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(.blue)

        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
