//
//  UserRowView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user:User
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 48, height: 48)
            VStack(alignment:.leading){
                Text(user.username)
                    .font(.subheadline).bold()
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}


