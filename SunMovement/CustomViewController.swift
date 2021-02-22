//
//  CustomViewController.swift
//  SunMovement
//
//  Created by Helga on 22.02.2021.
//

import UIKit
import SwiftyJSON
import CoreLocation

class CustomViewController: UIViewController, CLLocationManagerDelegate{
    
    let viewModel = ViewModel()
    var currentModel = CustomScreen()
    let networkManager = NetworkManager()
    let locationManager = CLLocationManager()
    
    let cityLabel = UILabel(text: "City", font: .avenir26())
    let temperatureLabel = UILabel(text: "t", font: .avenir26())
    let sunriseLabel = UILabel(text: "time1", font: .avenir26())
    let sunsetLabel = UILabel(text: "time2", font: .avenir26())
    
    var latitude: Double = 0
    var longitude: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation] ) {
        if let location = locations.first {
            latitude = location.coordinate.latitude
            longitude = location.coordinate.longitude
            
            self.networkManager.requestQuote(latitude: latitude, longitude: longitude)
            self.currentModel = networkManager.currentModel
            DispatchQueue.main.async {
                self.updateData(currentModelForShow: self.viewModel.displayStockInfo(currentModel: self.currentModel))
            }
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func updateData(currentModelForShow : CustomScreenForShow) {
        self.cityLabel.text = currentModelForShow.city
        self.temperatureLabel.text = currentModelForShow.temperature
        self.sunriseLabel.text = currentModelForShow.sunrise
        self.sunsetLabel.text = currentModelForShow.sunset
    }

}


// MARK: - Setup constraints
extension CustomViewController {
    private func setupConstraints() {
        
        
        let bottomStackView = UIStackView(arrangedSubviews: [
            sunriseLabel,
            sunsetLabel
        ],
                                          axis: .horizontal,
                                          spacing: 3)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
       
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cityLabel)
        view.addSubview(temperatureLabel)
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
            bottomStackView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
         
    }
}
// MARK: - SwiftUI
import SwiftUI

struct CustomVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let CustomVC = CustomViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<CustomVCProvider.ContainerView>) -> CustomViewController {
            return CustomVC
        }
        
        func updateUIViewController(_ uiViewController: CustomVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<CustomVCProvider.ContainerView>) {
            
        }
    }
}

