//
//  constraints + extension.swift
//  SunMovement
//
//  Created by Helga on 23.02.2021.
//

import UIKit

extension CustomViewController {
    func setupConstraints() {
        
        let bottomStackView = UIStackView(arrangedSubviews: [
            sunriseLabel,
            sunsetLabel
        ],
                                          axis: .horizontal,
                                          spacing: 3)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        sunImage.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cityLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(sunImage)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.topAnchor, constant: 40),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            sunImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sunImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sunImage.heightAnchor.constraint(equalToConstant: 100),
            sunImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
         
    }
}
