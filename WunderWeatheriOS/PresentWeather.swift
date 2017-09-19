//
//  PresentWeather.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import Foundation


struct PresentWeather {
    
    let temp_c: Double?
    let temp_f: Double?
    let cityState: String?
    let currentConditions: String?
    
    
    // Retrieve current weather data to display in UI
    init(weatherDictionary: [String: AnyObject]) {
        temp_f = weatherDictionary["temp_f"] as? Double
        temp_c = weatherDictionary["temp_c"] as? Double
        cityState = weatherDictionary["display_location"]?["full"] as? String
        currentConditions = weatherDictionary["weather"] as? String
    }
}
