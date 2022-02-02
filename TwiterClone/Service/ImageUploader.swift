//
//  ImageUploader.swift
//  TwiterClone
//
//  Created by shehan karunarathna on 2022-02-01.
//

import Firebase
import UIKit

struct ImageUploader{
    static func uploadImage(image:UIImage, completion : @escaping(String) ->Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        ref.putData(imageData, metadata:nil){_,error in
            if let error = error {
                print("error occured \(error.localizedDescription)")
                return
            }
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
