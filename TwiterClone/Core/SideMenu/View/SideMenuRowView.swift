//
//  SideMenuRowView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI

struct SideMenuRowView: View {
    var item : SideMenuViewModel
    var body: some View {
        HStack(spacing:16){
            Image(systemName: item.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(item.title)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(item: .profile)
    }
}
