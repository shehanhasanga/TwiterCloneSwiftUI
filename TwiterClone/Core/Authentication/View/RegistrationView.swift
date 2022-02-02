//
//  RegistrationView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI

struct RegistrationView: View {
    @State var userName :String = ""
    @State var email:String = ""
    @State var password:String = ""
    @State var fullName :String = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        VStack{
            NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.authenticateuser, label: {})
            AuthenticationHeader(title1: "Get Started.", title2: "Create Your Account.")
            VStack(spacing:40){
                CustomInputView(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputView(imageName: "person", placeholderText: "User Name", text: $userName)
                CustomInputView(imageName: "person", placeholderText: "Full Name", text: $fullName)
                CustomInputView(imageName: "lock", placeholderText: "Password", text: $password, isSecureField: true)
            }
           
            .padding(.horizontal, 32)
            .padding(.top, 44)
            .padding(.bottom, 32)
          
            
            Button {
                viewModel.register(email: email, password: password, fullName: fullName, userName: userName)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .frame(width: 340, height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(1), radius: 10, x: 0, y: 5)
            
            Spacer()
            
            Button {
                mode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
