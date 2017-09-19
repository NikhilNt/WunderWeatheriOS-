//
//  WeatherServices.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//


import Foundation

enum weatherResponse {
    case success(WeatherForecast)
    case faliure(NSError)
}

struct WeatherServices {
    
    func getForecast(_ URL: Foundation.URL, completion: @escaping (weatherResponse) -> Void) -> Void {
        let networkOperation = WebservicesOperation(url: URL)
        
        networkOperation.gettingDataFromJson { (result: WebserviceResults) -> Void in
            
            switch result {
            case .success(let f):
                let forecast = WeatherForecast(weatherDictionary: f)
                completion(weatherResponse.success(forecast))
            case .error(let e):
                completion(weatherResponse.faliure(e))
            }
        }
        
        
        
    }
    
}
