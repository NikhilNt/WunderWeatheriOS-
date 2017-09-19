//
//  DonwloadingImage.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import UIKit

extension UIImageView {
    func gettingImageFormUrl(_ URL:String, contentMode mode: UIViewContentMode) {
        
        //Validate URL String
        guard
            let url = Foundation.URL(string: URL)
            else {return}
        
        //Set contentMode
        contentMode = mode
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let dataTask = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            guard
                //Check the data task returned valid image data
                let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                let data = data, error == nil,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async {
                //Set the image
                self.image = image.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
            }
            
        })
        
        //Start the data task
        dataTask.resume()
        
    }
}

