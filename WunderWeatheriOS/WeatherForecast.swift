//
//  WeatherForecast.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import Foundation


struct WeatherForecast {
    var errors: ErrorStatus?
    var currentWeather: PresentWeather?
    var hourly: [HourlyWeather] = []
    
    // Create appropriate weather Dictionaries based on keys
    init(weatherDictionary: [String: AnyObject]?) {
        if let responseDictionary = weatherDictionary?["response"] as? [String: AnyObject] {
            errors = ErrorStatus(errorDictionary: responseDictionary)
        }
        
        if let weatherStatus = weatherDictionary?["current_observation"] as? [String: AnyObject] {
            currentWeather = PresentWeather(weatherDictionary: weatherStatus)
        }
        
        if let hourlyWeatherArray = weatherDictionary?["hourly_forecast"] as? [[String: AnyObject]] {
            for hourlyWeather in hourlyWeatherArray {
                let hour = HourlyWeather(hourlyWeatherDict: hourlyWeather)
                hourly.append(hour)
            }
        }
    }
    
}
