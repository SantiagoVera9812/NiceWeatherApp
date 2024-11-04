//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by Christian Santiago Vera Rojas on 10/10/24.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    
    let name: String
    
    let main: Weather
}
struct Weather: Decodable {
    
    let temp: Double
    let humidity: Double
    
    
    
}
