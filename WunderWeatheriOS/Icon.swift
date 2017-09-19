//
//  Icon.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import UIKit

extension String {
    
    func changeWeatherIcon(highlighted: Bool = false) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "nerdery-umbrella.s3.amazonaws.com"
        
        if highlighted {
            urlComponents.path = "/\(self)-selected.png"
        } else {
            urlComponents.path = "/\(self).png"
        }
        
        return urlComponents.url
    }
    
}

