//
//  ViewController.swift
//  Project1and2
//
//  Created by Colten Davis on 10/26/20.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var locationButton: UIButton!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.requestWhenInUseAuthorization()
               locationManager.desiredAccuracy = kCLLocationAccuracyBest
               locationManager.distanceFilter = kCLDistanceFilterNone
               locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
    }

    @IBAction func locationButtonPressed(_ sender: UIButton) {
        
        let user_lat = (locationManager.location?.coordinate.latitude)!
                let user_long = (locationManager.location?.coordinate.longitude)!

                let latitude = String(format: "%f", user_lat)

                let longitude = String(format: "%f", user_long)

                let coordinates = latitude + longitude


                let alertController = UIAlertController(title: "Here is your location!", message:coordinates, preferredStyle: .alert)

                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self.present(alertController, animated: true, completion: nil)
    }
    
}

