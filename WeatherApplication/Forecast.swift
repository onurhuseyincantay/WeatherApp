//
//  Forecast.swift
//  WeatherApplication
//
//  Created by onur hüseyin çantay on 19/07/2017.
//  Copyright © 2017 onur hüseyin çantay. All rights reserved.
//

import UIKit
class Forecast{

var _date : String!
var _weatherType:String!
var _highTemp : String!
var _lowTemp : String!

    var lowTemp :String{
    if _lowTemp == nil {
        _lowTemp = ""
    }
    return _lowTemp
    
}
var date :String{
    if _date == nil {
        _date = ""
    }
    return _date
    
}
var weatherType :String{
    if _weatherType == nil {
        _weatherType = ""
    }
    return _weatherType
    
}
var highTemp :String{
    if _highTemp == nil {
        _highTemp = ""
    }
    return _highTemp
    
}
    init(weatherDict : Dictionary <String,AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject>{
            if let min = temp["min"] as? Double {
                self._lowTemp = "\(Double(round(10*(min - 275.15)/10)))"
                print("\(self._lowTemp!)")
            }
            if let max = temp ["max"] as? Double{
                self._highTemp = "\(Double(round(10*(max - 275.15)/10)))"
                print("\(self._highTemp!)")

            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary<String,AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        if let date = weatherDict ["dt"] as? Double {
            let unixCodeConverter = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixCodeConverter.dayOfTheWeek()
        }
        }
    
 
}
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
