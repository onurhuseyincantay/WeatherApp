//
//  ViewController.swift
//  WeatherApp
//
//  Created by onur hüseyin çantay on 19/07/2017.
//  Copyright © 2017 onur hüseyin çantay. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var currentWeather = CurrentWeather()
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCurrentTemp: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var lblWeatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        currentWeather.DownloadWeatherDetails {
            
        }
    
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for : indexPath)
        return cell
    }


}

