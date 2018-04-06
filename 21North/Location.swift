//
//  ViewController.swift
//  GoogleMapsProject
//
//  Created by Sachin Tomar on 13/06/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit
import GoogleMaps

class Location: UIViewController{
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    
    var add = String()
    
    func location(){
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
    }
        
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D){
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
            if let address = response?.firstResult() {
                let lines = address.lines as [String]!
//                print(lines.joinWithSeparator(""))
                self.add = lines.joinWithSeparator("\n")
//                print(self.add)
                
            }
        }
       
    }
}

extension Location: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            reverseGeocodeCoordinate(location.coordinate)
            
            locationManager.stopUpdatingLocation()
            
        }
        
    }
}


