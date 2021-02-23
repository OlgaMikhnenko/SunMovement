//
//  background + extension.swift
//  SunMovement
//
//  Created by Helga on 23.02.2021.
//

import UIKit

extension CustomViewController {
    
    func createGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        let color1 = #colorLiteral(red: 0.599189935, green: 0.8753711748, blue: 1, alpha: 1).cgColor
        let color2 = #colorLiteral(red: 0.4690591542, green: 1, blue: 0.9695916633, alpha: 1).cgColor
        gradientLayer.colors = [color1,color2,color1]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        self.view.backgroundColor = UIColor(patternImage: image!)
    }
}
