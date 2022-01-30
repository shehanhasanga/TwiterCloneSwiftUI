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
                HStack(spacing:16){
                    Image(systemName: item.imageName)
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(item.title)
                        .font(.subheadline)
                    
                    Spacer()
                }
                .frame(height: 40)
             
            }
            .padding(.horizontal)
            
            Spacer()
        }
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
