//
//  DoubleExtension.swift
//  GoodWeather
//
//  Created by Christian Santiago Vera Rojas on 10/10/24.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

extension Double {
    
    func formatAsDegree() -> String {
        
        return String(format: "%.0f°", self)
    }
    
}
