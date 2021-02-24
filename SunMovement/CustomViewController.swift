//
//  CustomViewController.swift
//  SunMovement
//
//  Created by Helga on 22.02.2021.
//

import UIKit
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
    let sunImage = UIImageView(image: #imageLiteral(resourceName: "sunPicture"))
    
    
    var latitude: Double = 0
    var longitude: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientBackground()
        setupConstraints()
        animating()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

