//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Christian Santiago Vera Rojas on 8/10/24.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel){
        self.cityNameLabel.text = vm.city
        self.temperatureLabel.text = "\(vm.temperature.formatAsDegree())"
    }
}
