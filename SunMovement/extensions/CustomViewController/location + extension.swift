//
//  CustomViewController + extension.swift
//  SunMovement
//
//  Created by Helga on 23.02.2021.
//


import CoreLocation

extension CustomViewController {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation] ) {
        if let location = locations.first {
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
            
            self.networkManager.requestQuote(latitude: latitude, longitude: longitude)
            self.currentModel = networkManager.currentModel
            DispatchQueue.main.async {
                print(self.currentModel)
                self.updateData(currentModelForShow: self.viewModel.displayStockInfo(currentModel: self.currentModel))
            }
            
        }
    }

}
