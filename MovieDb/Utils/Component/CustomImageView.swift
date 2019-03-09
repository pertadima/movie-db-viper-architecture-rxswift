//
//  CustomImageView.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/9/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

public class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    public func loadImageUsingUrlString(_ urlString: String, defaultImg: UIImage, completion: @escaping (Bool) -> (), contentMode: ContentMode = .scaleAspectFill) {
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        image = defaultImg
        self.contentMode = contentMode
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            self.contentMode = contentMode
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, respones, error) in
            
            if let _ = error {
                return
            }
            
            if urlString.contains("http") {
                DispatchQueue.main.async(execute: {
                    if let data = data, let imageToCache = UIImage(data: data) {
                        
                        if self.imageUrlString == urlString {
                            self.image = imageToCache
                        }
                        
                        self.contentMode = contentMode
                        self.clipsToBounds = true
                        imageCache.setObject(imageToCache, forKey: urlString as NSString)
                        completion(true)
                    }else{
                        completion(false)
                    }
                })
                
            }
        }).resume()
    }
}
