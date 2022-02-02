//
//  SideMenuView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        
        if let user = viewModel.currentUser{
            VStack(alignment:.leading, spacing: 32){
                VStack(alignment:.leading){
                    KFImage(URL(string:user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    VStack(alignment:.leading){
                        Text(user.fullname)
                            .font(.headline)
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    UserStatView()
                        .padding(.vertical)
                }
                .padding(.leading)
                ForEach(SideMenuViewModel.allCases, id:\.self){
                    item in
                    if item == .profile{
                        NavigationLink{
                            ProfileView(user: user)
                        }label:{
                            SideMenuRowView(item: item)
                        }
                    } else if item == .logout{
                        Button {
                            viewModel.signOut()
                        } label: {
                            SideMenuRowView(item: item)

                        }

                    } else{
                        SideMenuRowView(item: item)

                    }
                   
                 
                }
              
                
                Spacer()
            }
        }
        
       
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
