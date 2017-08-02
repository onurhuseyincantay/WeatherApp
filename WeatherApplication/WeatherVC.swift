//
//  ViewController.swift
//  WeatherApp
//
//  Created by onur hüseyin çantay on 19/07/2017.
//  Copyright © 2017 onur hüseyin çantay. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
class WeatherVC: UIViewController,UITableViewDataSource,UITableViewDelegate,CLLocationManagerDelegate{
    
    var currentWeather : CurrentWeather!
    var foreCast : Forecast!
    var forecasts = [Forecast]()
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCurrentTemp: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var lblWeatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let locationManager = CLLocationManager()
    var currentLocation  : CLLocation!
    
    override func viewDidLoad() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        currentWeather = CurrentWeather()
         //burada initializer ı ayarlaman lazım
        }
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        locationAuthStatus()
    }
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.Longtitude = currentLocation.coordinate.longitude
            currentWeather.DownloadWeatherDetails {
                self.downloadForecastData {
                    self.updateUI()
                }
                
            }
        }else{
            locationManager.requestWhenInUseAuthorization()
           self.locationAuthStatus()
        }
    }
    func downloadForecastData(completed : @escaping downloadComplete){
        
        let forecastUrl = URL(string: FORECAST_URL)!
        Alamofire.request(forecastUrl).responseJSON{ response in
        let result = response.result
            if let dict = result.value as? Dictionary <String,AnyObject> {
                if let list = dict["list"] as? [Dictionary<String,AnyObject>]{
                    for obj in list{
                        let forcast = Forecast(weatherDict : obj)
                        self.forecasts.append(forcast)
                        print(obj)
                    }
                    self.tableView.reloadData()
                }
         }
        completed()
         }
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for : indexPath) as? WeatherCell {
         let forecast = forecasts [indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        }
        else {
            return WeatherCell()
            
        }
    }
    func updateUI()  {
        lblDate.text = currentWeather.date
        lblCurrentTemp.text = "\(currentWeather.currentTemp)"
        lblWeatherType.text = currentWeather.weatherType
        lblLocation.text = currentWeather.cityName
        imgWeather.image = UIImage(named: currentWeather.weatherType)
    }


}

