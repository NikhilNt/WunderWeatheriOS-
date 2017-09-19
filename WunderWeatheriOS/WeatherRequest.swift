//
//  WeatherRequest.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import Foundation


struct WeatherRequest {
    
    fileprivate let APIKey: String
    var zipCode: String?
    
    var URL: Foundation.URL? {
        get {
            guard let zip = zipCode else {
                return nil
            }
            
            var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "api.wunderground.com"
            urlComponents.path = "/api/\(APIKey)/conditions/hourly/q/\(zip).json"
            
            return urlComponents.url
            
        }
    }
    init(APIKey: String) {
        self.APIKey = APIKey
    }
}
