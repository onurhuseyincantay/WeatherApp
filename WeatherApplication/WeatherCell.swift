//
//  WeatherCell.swift
//  WeatherApplication
//
//  Created by onur hüseyin çantay on 22/07/2017.
//  Copyright © 2017 onur hüseyin çantay. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblHighTemp: UILabel!
    @IBOutlet weak var lblWeatherType: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var lblLowTemp: UILabel!
    func configureCell(forecast : Forecast){
        lblLowTemp.text = forecast.lowTemp
        lblHighTemp.text = forecast.highTemp
        lblDay.text = forecast.date
        lblWeatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
   

}
