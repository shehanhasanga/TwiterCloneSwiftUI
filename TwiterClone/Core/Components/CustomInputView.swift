//
//  CustomInputView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI

struct CustomInputView: View {
    let imageName:String
    let placeholderText : String
    @Binding var text : String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaleEffect()
                    .frame(width: 24, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholderText, text: $text)
            }
            Divider()
                .background(Color(.darkGray))
            
            
        }
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputView(imageName: "envelope", placeholderText: "Email", text: .constant(""))
    }
}
