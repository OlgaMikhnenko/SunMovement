//
//  NetworkManager.swift
//  SunMovement
//
//  Created by Helga on 22.02.2021.
//

import Foundation
import SwiftyJSON

class NetworkManager : NSObject {
    
    var currentModel = CustomScreen()
    
    func requestQuote (latitude : Double, longitude : Double) {
        let token = "8d333e486b3416ba3616eed51b3736fd"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(token)") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let data = data,
               (response as? HTTPURLResponse)?.statusCode == 200,
                error == nil{
                self?.parseQuote(from: data)
               } else {
                    print("Network error!")
               }
        }
        dataTask.resume()
        
    }
    private func parseQuote (from data: Data) {
        
        let json = JSON(data)
        let city = json["name"].string
        let temperature = json["main"]["temp"].float
        let sunriseJSON = json["sys"]["sunrise"].double
        let sunsetJSON = json["sys"]["sunset"].double
        
        self.currentModel.city = city
        self.currentModel.temperature = temperature
        self.currentModel.sunrise = sunriseJSON
        self.currentModel.sunset = sunsetJSON
        
    }
    
}
