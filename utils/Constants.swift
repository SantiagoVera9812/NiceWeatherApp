//
//  Constants.swift
//  GoodWeather
//
//  Created by Christian Santiago Vera Rojas on 10/10/24.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            let userDefaults = UserDefaults.standard
            
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string:
                        
                        "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=82271dc3b612b1b463b6e4f773306440&units=\(unit)")!
        }
    }
}
