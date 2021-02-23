//
//  updating + extension.swift
//  SunMovement
//
//  Created by Helga on 23.02.2021.
//

import UIKit

extension CustomViewController {
    
     func updateData(currentModelForShow : CustomScreenForShow) {
        self.cityLabel.text = currentModelForShow.city
        self.temperatureLabel.text = currentModelForShow.temperature
        self.sunriseLabel.text = currentModelForShow.sunrise
        self.sunsetLabel.text = currentModelForShow.sunset
    }
}
