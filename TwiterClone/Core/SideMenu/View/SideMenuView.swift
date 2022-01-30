//
//  SideMenuView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 32){
            VStack(alignment:.leading){
                Circle()
                    .frame(width: 48, height: 48)
                VStack(alignment:.leading){
                    Text("Shehan Karunarathna")
                        .font(.headline)
                    Text("@king")
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
                        ProfileView()
                    }label:{
                        SideMenuRowView(item: item)
                    }
                } else if item == .logout{
                    Button {
                        
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

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
