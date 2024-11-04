//
//  WebService.swift
//  GoodWeather
//
//  Created by Christian Santiago Vera Rojas on 9/10/24.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

struct Resource<T> {
    
    let url: URL
    let parse: (Data) -> T?
}

final class WebService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url){
            data, response, error in
            
            if let data = data {
                DispatchQueue.main.async{
                    
                    completion(resource.parse(data))
                    
                }
                
            } else {
                completion(nil)
            }
        }.resume()
    }
}
