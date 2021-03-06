//
//  animating + extension.swift
//  SunMovement
//
//  Created by Helga on 23.02.2021.
//

import UIKit

extension CustomViewController {
    
    func animating () {
        UIView.animate(withDuration: 10, delay: 0.4,
                       options: .repeat, animations: {
                        let width = self.view.bounds.width
                        self.sunImage.transform = CGAffineTransform(translationX: width - self.sunImage.bounds.width / 3 + 1, y: 0)
                        
                        
        }, completion: nil)
    }
}
