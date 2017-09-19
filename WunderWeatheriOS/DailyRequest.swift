//
//  DailyRequest.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//

import Foundation




struct DailyRequest {
    
    fileprivate let hourly: [HourlyWeather]
    let headerOptions = ["Today", "Tomorrow", "Day After Tomorrow"]
    
    
    var Daily: [DeatilsForDailyWeather]? {
        get {
            
            var daily: [DeatilsForDailyWeather] = []
            
            //Initialize DailyWeather Struct with first values from returned hourly data array
            
            var dayObj = DeatilsForDailyWeather(
                headerTitle: headerOptions.first,
                dailyHigh: hourly.first?.temp_english,
                dailyLow: hourly.first?.temp_english,
                lowIndex: 0,
                highIndex: 0,
                HourlyWeather: [])
            
            
            for item in hourly {
                
                //If it's not a new day (i.e. 12:00 AM), compare high/low temps to present values in DailyWeather instance
                
                if item.timeStamp != "12:00 AM" {
                    if(item.temp_english > dayObj.dailyHigh) {
                        dayObj.dailyHigh = item.temp_english
                        dayObj.highIndex = dayObj.HourlyWeather.count
                    }
                    
                    if(item.temp_english < dayObj.dailyLow) {
                        dayObj.dailyLow = item.temp_english
                        dayObj.lowIndex = dayObj.HourlyWeather.count
                    }
                } else {
                    
                    //If it is a new day, add the DailyWeather instance to the daily array
                    
                    daily.append(dayObj)
                    
                    
                    //Reset dayObj with the values from 12:00 AM hourlyWeather instance, advance header title appropriately
                    
                    dayObj = DeatilsForDailyWeather(
                        headerTitle: headerOptions[daily.count],
                        dailyHigh: item.temp_english,
                        dailyLow: item.temp_english,
                        lowIndex: 0,
                        highIndex: 0,
                        HourlyWeather: [])
                }
                
                //Add the current HourlyWeather item to the DailyWeather object's hourlyWeather array
                dayObj.HourlyWeather.append(item)
            }
            
            //Add the remaing hours that made up the last day to the Dailyweather array
            daily.append(dayObj)
            
            //If there are no more hours left in the day (i.e, it's past 11:00pm, and Today has no hours in it), remove empty item
            if(daily.first?.HourlyWeather.count == 0) {
                daily.remove(at: 0)
            }
            
            return daily
            
            
        }
    }
    
    init(_ hourlyWeather: [HourlyWeather]) {
        self.hourly = hourlyWeather
    }
    
    
}

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}
