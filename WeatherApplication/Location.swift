//
//  Location.swift
//  WeatherApplication
//
//  Created by onur hüseyin çantay on 22/07/2017.
//  Copyright © 2017 onur hüseyin çantay. All rights reserved.
//

import Foundation
import CoreLocation
class Location {
    static var sharedInstance = Location()
    private init (){}
    var latitude : Double!
    var Longtitude : Double!
    
}
