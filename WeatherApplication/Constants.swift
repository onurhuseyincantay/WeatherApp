//
//  Constants.swift
//  WeatherApp
//
//  Created by onur hüseyin çantay on 19/07/2017.
//  Copyright © 2017 onur hüseyin çantay. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGTITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "d48b1d332e3a447a490dd1e620f38a4b"
typealias downloadComplete = () -> ()
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGTITUDE)\(Location.sharedInstance.Longtitude!)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.Longtitude!)&cnt=10&appid=d48b1d332e3a447a490dd1e620f38a4b"
