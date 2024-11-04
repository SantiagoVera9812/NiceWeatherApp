//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Christian Santiago Vera Rojas on 17/10/24.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    
    var displayName: String {
        get {
            switch(self) {
            case .celsius:
                return "Celsius"
            
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel {
    
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        
        get {
            
            let userDefaults = UserDefaults.standard
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String{
                
                unitValue = value
                
            }
            
            return Unit(rawValue: unitValue)!

        }
        
        set {
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
    
    
}
