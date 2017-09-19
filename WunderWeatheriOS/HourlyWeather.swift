//
//  HourlyWeather.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import Foundation

struct HourlyWeather {
    let timeStamp: String?
    let icon: String?
    let icon_url: String?
    let temp_english: String?
    let temp_metric: String?
    
    
    init(hourlyWeatherDict: [String: AnyObject]) {
        
        timeStamp = hourlyWeatherDict["FCTTIME"]?["civil"] as? String
        icon = hourlyWeatherDict["icon"] as? String
        icon_url = hourlyWeatherDict["icon_url"] as? String
        temp_english = hourlyWeatherDict["temp"]?["english"] as? String
        temp_metric = hourlyWeatherDict["temp"]?["metric"] as? String
    }
}
