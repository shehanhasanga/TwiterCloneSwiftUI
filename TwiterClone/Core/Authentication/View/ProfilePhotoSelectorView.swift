//
//  ProfilePhotoSelectorView.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-01-30.
//

import SwiftUI
import Firebase

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker:Bool = false
    @State private var selectedImage : UIImage?
    @State private var profileImage : Image?
    @EnvironmentObject var viewmodel : AuthViewModel
   
    func loadImage(){
        if let image = selectedImage{
            profileImage = Image(uiImage:image)
        }
    }
    
    var body: some View {
        VStack{
            AuthenticationHeader(title1: "Create your account", title2: "Add a profile picture")
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .padding(.top,44)
                } else{
                    Image(systemName: "photo")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 180, height: 180)
                        .padding(.top,44)
                        .scaledToFill()
                }
                
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
                    
            }
            
            if let selectedImage = selectedImage{
                Button {
                    viewmodel.uploadProfileImage(image: selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .frame(width: 340, height: 50)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(1), radius: 10, x: 0, y: 5)
            }
            
            

            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct profileImageMOdifier : ViewModifier{
    func body(content: Content) -> some View {
        var contentnew = content as? Image
        if  let imageView = contentnew {
            imageView
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.blue)
                .frame(width: 180, height: 180)
                .padding(.top,44)
                .scaledToFill()
        }
       
        
    }
}

//struct ProfilePhotoSelectorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilePhotoSelectorView()
//    }
//}
