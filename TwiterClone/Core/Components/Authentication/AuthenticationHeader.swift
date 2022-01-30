//
//  AuthenticationHeader.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI

struct AuthenticationHeader: View {
    var title1:String
    var title2 : String
    var body: some View {
        VStack(alignment:.leading){
            HStack{Spacer()}
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame( height: 260)
        .padding(.leading)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: .bottomRight))
    }
}

struct AuthenticationHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationHeader(title1: "Hello", title2: "Welcome back")
    }
}
