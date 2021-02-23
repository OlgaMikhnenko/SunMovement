//
//  UIView + extension.swift
//  SunMovement
//
//  Created by Helga on 23.02.2021.
//

import UIKit

extension UIImageView {
        func withGradienBackground(color1: UIColor, color2: UIColor, color3: UIColor, color4: UIColor) {
            let layerGradient = CAGradientLayer()

            layerGradient.colors = [color1.cgColor, color2.cgColor, color3.cgColor, color4.cgColor]
            layerGradient.frame = bounds
            layerGradient.startPoint = CGPoint(x: 1.5, y: 1.5)
            layerGradient.endPoint = CGPoint(x: 0.0, y: 0.0)
            layerGradient.locations = [0.0, 0.3, 0.4, 1.0]

            layer.insertSublayer(layerGradient, at: 0)
        }
    
}
