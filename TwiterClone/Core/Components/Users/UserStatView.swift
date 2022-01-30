//
//  UserStatView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI

struct UserStatView: View {
    var body: some View {
        HStack(spacing:24){
            HStack(spacing:4){
                Text("807")
                    .font(.subheadline)
                    .bold()
                Text("following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
         
            HStack(spacing:4){
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                Text("followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
       
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView()
    }
}
