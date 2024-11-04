//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Christian Santiago Vera Rojas on 10/10/24.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

class WeatherListViewModel{
    
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewmodel(_ vm: WeatherViewModel) {
        
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    private func toCelcius(){
        
        weatherViewModels = weatherViewModels.map{ vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) *  5/9
            return weatherModel
            
        }
    }
    
    private func toFahrenheit(){
        
        weatherViewModels = weatherViewModels.map{ vm in
            
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9/5) + 32
            return weatherModel
        }
    }
    
    func updateUnit(to unit: Unit){
        
        switch unit {
            
        case .celsius:
            toCelcius()
        case .fahrenheit:
            toFahrenheit()
            
        }
    }
}

class WeatherViewModel{
    
    let weather: WeatherResponse
    var temperature: Double
    
    init(weather: WeatherResponse){
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var city: String {
        weather.name
    }
    
}
