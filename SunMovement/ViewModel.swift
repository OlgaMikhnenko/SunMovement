//
//  ViewModel.swift
//  SunMovement
//
//  Created by Helga on 22.02.2021.
//

import Foundation

class ViewModel : NSObject {
    
    var currentModel = CustomScreenForShow()
    
    func displayStockInfo (currentModel : CustomScreen) -> CustomScreenForShow {
        
        let city = currentModel.city
        let temperature = currentModel.temperature
        let sunriseJSON = currentModel.sunrise
        let sunsetJSON = currentModel.sunset
        
        
        if let city = city {
            self.currentModel.city = city
        } else {
            self.currentModel.city = "Нет данных"
        }
        
        if let temperature = temperature {
            let degrees = round(temperature - 273.15)
            self.currentModel.temperature = "\(degrees) °С"
        } else {
            self.currentModel.temperature = "Нет данных"
        }
        
        if let sunriseJSON = sunriseJSON {
            let sunriseTime = Date(timeIntervalSince1970: sunriseJSON)
            let formatter = DateFormatter()
                formatter.dateStyle = .none
                formatter.timeStyle = .medium
            let formattedTime = formatter.string(from: sunriseTime)
            self.currentModel.sunrise = "\(formattedTime)"
        } else {
            self.currentModel.sunrise = "Нет данных"
        }
        
        if let sunsetJSON = sunsetJSON {
            let sunsetTime = Date(timeIntervalSince1970: sunsetJSON)
            let formatter = DateFormatter()
                formatter.dateStyle = .none
                formatter.timeStyle = .medium
            let formattedTime = formatter.string(from: sunsetTime)
            self.currentModel.sunset = "\(formattedTime)"
        } else {
            self.currentModel.sunset = "Нет данных"
        }
        return self.currentModel
    }
    
    
}

