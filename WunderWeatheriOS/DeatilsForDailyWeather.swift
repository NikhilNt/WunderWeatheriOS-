//
//  DeatilsForDailyWeather.swift
//  WunderWeatheriOS
//
//  Created by Nikhil Patil on 9/18/17.
//  Copyright © 2017 Nikhil Patil. All rights reserved.
//


import Foundation

struct DeatilsForDailyWeather {
    var headerTitle: String?
    var dailyHigh: String?
    var dailyLow: String?
    var lowIndex: Int?
    var highIndex: Int?
    var HourlyWeather: [HourlyWeather] = []
}
