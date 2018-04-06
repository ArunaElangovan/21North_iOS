//
//  MapView.swift
//  21North
//
//  Created by Sachin Tomar on 11/07/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@objc protocol MapViewDelegate{
    func mapLocationSet(location: String, check: String, latitude: String, longitude: String)
}

class MapView: BaseViewController, UISearchBarDelegate, LocateOnTheMap, UITextFieldDelegate{
    
    var delegate: MapViewDelegate?
    let shapes = Shapes()
    
    var mapView:GMSMapView!
    var mapCenterPinImage: UIImageView!
    var fancy: GMSCameraPosition!
    var searchResultController: SearchResultsController!
    let locationManager = CLLocationManager()
    var searchController = UISearchController()
    var resultsArray = [String]()
    var pinLocation: String!
    var subView = UIView()
    var width: CGFloat!
    var addressFromEnroute:String!
    var from: Int!
    var address: String!
    var dataFromMap:Int!
    var lat:String!
    var long :String!
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!
    
    let style = Style()
    var backButtonImage = UIImageView()
    var backButton = UIButton()
    let textF = UITextField()
    
    var isCustom:Int = 0;
    var customlat: CLLocationDegrees! = nil
    var customlong: CLLocationDegrees! = nil
    
    func searchWithAddress() {
        
        
        searchController = UISearchController(searchResultsController: searchResultController)
        searchController.searchBar.showsCancelButton = false
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = UIColor.orange
        searchController.searchBar.barTintColor = UIColor(white: 1, alpha: 0)
        searchController.searchBar.isUserInteractionEnabled = true
        searchController.searchBar.text = ""
        searchController.searchBar.placeholder = "Enter your Address"
        searchController.searchBar.frame = CGRect(x: 0, y: 0, width: self.width-20, height: 35)
        searchController.searchBar.layer.cornerRadius = 10
        
        subView.frame = CGRect(x: 10, y: 120, width: self.width-20, height: 35)
        subView.layer.cornerRadius = 10
        subView.clipsToBounds = true
        subView.backgroundColor = UIColor(white: 1, alpha: 0)
        subView.addSubview(searchController.searchBar)
        //        let cancelButtonAttributes: NSDictionary = [NSForegroundColorAttributeName: style.systemFontColor]
        //        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes as? [String : AnyObject], for: UIControlState.normal)
        view.addSubview(subView)
    }
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        subView.frame = CGRect(x: 10, y: 80, width: self.width-20, height: 35)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        subView.frame = CGRect(x: 10, y: 120, width: self.width-20, height: 35)
        
        let placeClient = GMSPlacesClient()
        
        placeClient.autocompleteQuery(searchText, bounds: nil, filter: nil) { (results, error: Error?) -> Void in
            
            self.resultsArray.removeAll()
            if results == nil {
                return
            }
            for result in results! {
                self.resultsArray.append(result.attributedFullText.string)
            }
            print(results!)
            self.searchResultController.reloadDataWithArray(self.resultsArray)
            
        }
    }
    let topView = UIView()
    var confirmButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        mapView = GMSMapView(frame: CGRect(x: 0, y: 40, width: width, height: height-40))
        view.addSubview(mapView)
        
        self.mapView.padding = UIEdgeInsets(top: self.topLayoutGuide.length, left: 0,
                                            bottom: 0, right: 0)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        
        mapView.settings.allowScrollGesturesDuringRotateOrZoom = false;
        let imageForPin = resizeImage(image: UIImage(named: "pin")!, targetSize: CGSize(width: 60*3, height: 50*3))
        mapCenterPinImage = UIImageView(image: imageForPin)
        mapCenterPinImage.frame = CGRect(x: (width-newWt/3)/2+10, y: (height-(newHt/3))/2-40, width: newWt/3 , height: newHt/3)
        mapView.addSubview(mapCenterPinImage)
        
        
        //        let geocoder = CLGeocoder()
        address = DataCreator.sharedInstance.currentLocation
        //        geocoder.geocodeAddressString(address) {(placemarks , error) -> Void in
        //            if let placemark = placemarks?[0] {
        //                self.fancy = GMSCameraPosition(target: placemark.location!.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)//.camera(withLatitude: self.lati, longitude: self.longi, zoom: 15, bearing: 0, viewingAngle: 0)//(target: placemark.location!.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        //                self.mapView.camera = self.fancy
        //                print(placemark.location?.coordinate)
        //            }
        //
        //        }
        
        searchResultController = SearchResultsController()
        searchResultController.delegate = self
        
        searchWithAddress()
        
        topView.frame = CGRect(x: 0, y: 0, width: width, height: 40)
        topView.backgroundColor = style.serviceViewColor
        view.addSubview(topView)
        
        backButtonImage = shapes.drawShapes(subView, type: "mapBack")
        backButtonImage.translatesAutoresizingMaskIntoConstraints = true
        backButtonImage.frame = CGRect(x: 6, y: 11, width: 25, height: 25)
        topView.addSubview(backButtonImage)
        
        backButton = UIButton(frame: CGRect(x: 10, y: 3.5, width: 60, height: 33))
        backButton.setTitle("Back", for: UIControlState())
        backButton.setTitleColor(style.systemFontColor, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        topView.addSubview(backButton)
        
        confirmButton = UIButton(frame: CGRect(x: width-120, y: 3.5, width: 120, height: 33))
        //        confirmButton.backgroundColor = style.serviceViewColor
        confirmButton.setTitleColor(style.systemFontColor, for: .normal)
        confirmButton.setTitle("Confirm", for: UIControlState())
        confirmButton.addTarget(self, action: #selector(confirmButtonClicked), for: .touchUpInside)
        confirmButton.isEnabled = false
        topView.addSubview(confirmButton)
        
        if(latitude == nil){
            latitude = locationManager.location?.coordinate.latitude
            longitude = locationManager.location?.coordinate.longitude
        }
    }
    var newHt: CGFloat!
    var newWt: CGFloat!
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        newHt = newSize.height
        newWt = newSize.width
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func locateWithLongitude(_ lon: Double, andLatitude lat: Double, andTitle title: String) {
        DispatchQueue.main.async { () -> Void in
            self.mapView.clear()
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 15)
            self.mapView.camera = camera
            self.reverseGeocodeCoordinate(CLLocationCoordinate2DMake(lat, lon))
            self.subView.frame = CGRect(x: 10, y: 80, width: self.width-20, height: 35)
        }
    }
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D){
        let geocoder = GMSGeocoder()
        lat = coordinate.latitude.description
        long = (coordinate.longitude.description)
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
            if let address = response?.firstResult() {
                let lines = address.lines as [String]!
                let city = address.locality?.split(separator: " ").map(String.init)
                DataCreator.sharedInstance.city = city![0]
                self.pinLocation = lines?.joined(separator: "")
                self.searchController.searchBar.text = self.pinLocation
                self.confirmButton.isEnabled = true
            }
        }
    }
    @objc func confirmButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        
        var check: String!
        
        //        var MapDictionary = Dictionary<String, String>()
        
        if(from == 0){
            check = "0"
        }
        else if(from == 1){
            check = "1"
        }
        else if(from == 2){
            check = "2"
        }
        else if(from == 3){
            check = "3"
        }
        //        MapDictionary = ["Location": pinLocation, "check": check, "lat": lat, "long": long]
        
        self.dismiss(animated: true, completion: {
            self.delegate?.mapLocationSet(location: self.pinLocation, check: check, latitude: self.lat, longitude: self.long)
            //            NotificationCenter.default.post(name: Notification.Name(rawValue: "Location"), object: nil, userInfo: MapDictionary)
        })
    }
}
extension MapView: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
            locateWithLongitude(longitude, andLatitude: latitude, andTitle: "Done")
            locationManager.stopUpdatingLocation()
        }
        
    }
}
extension MapView: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        reverseGeocodeCoordinate(position.target)
    }
}

