//
//  LocateAmbassador.swift
//  21North
//
//  Created by Sachin Tomar on 25/08/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit
import MapKit
import Foundation

class LocateAmbassador: UIViewController, MKMapViewDelegate, SocketManagerDelegate14 {
    
    let iosMapView = MKMapView()
    var width:CGFloat!
    var height: CGFloat!
    let drawservicing = DrawServicing()
    let shapes = Shapes()
    let style = Style()
    var bookingIndex = 0
    
    var profileImageView = UIImageView()
    var chauffeurNameLabel: UILabel!
    //    var chauffeurRating = UIImageView()
    var newVC: UIViewController!
    var databasePath = NSString()
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var lat: Double = 0
    var long: Double = 0
    
    let mapLocationArray = [[Double]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookingIndex = Helper.getBookingIndex()
        
        appdelegate.conn.delegate14 = self
        
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        
        iosMapView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        iosMapView.delegate = self
        view.addSubview(iosMapView)
        
        let backButton1 = shapes.drawShapes(view, type: "backButtonMap")
        backButton1.isUserInteractionEnabled = true
        backButton1.translatesAutoresizingMaskIntoConstraints = false
        let tapOnBack = UITapGestureRecognizer(target: self, action: #selector(back_button_pressed))
        backButton1.addGestureRecognizer(tapOnBack)
        view.addSubview(backButton1)
        
        view.addConstraintsWithFormat("H:|[v0]", views: backButton1)
        view.addConstraintsWithFormat("V:|-15-[v0]", views: backButton1)
        
        let ambCurrentLocationButton = UIButtonWithPadding()
        ambCurrentLocationButton.translatesAutoresizingMaskIntoConstraints = false
        ambCurrentLocationButton.setImage(UIImage(named: "ambIcon"), for: .normal)
        ambCurrentLocationButton.addTarget(self, action: #selector(ambCurrentLocation), for: .touchUpInside)
        ambCurrentLocationButton.layer.cornerRadius = 20
        iosMapView.addSubview(ambCurrentLocationButton)
        iosMapView.addConstraintsWithFormat("H:[v0(40)]-5-|", views: ambCurrentLocationButton)
        iosMapView.addConstraintsWithFormat("V:[v0(40)]-80-|", views: ambCurrentLocationButton)
        
        let view1 = drawservicing.addView(1)
        view1.backgroundColor = style.cellBackColor1
        iosMapView.addSubview(view1)
        let str = "http://m.21north.in/ambassadors/ambassadors-" + DataCreator.sharedInstance.postBookingData[bookingIndex].ambid + ".png"
        let url = URL(string: str)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
        if(data != nil){
            profileImageView.image = UIImage(data: data!)
        }
        else{
            profileImageView = UIImageView(image: UIImage(named: "Home-Insurance"))
        }
        profileImageView.layer.cornerRadius = 30
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = UIColor.gray
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view1.addSubview(profileImageView)
        
        chauffeurNameLabel = drawservicing.makeLabel(DataCreator.sharedInstance.postBookingData[bookingIndex].ambname, screenWidth: width, heading: "subHeading")
        chauffeurNameLabel.font = UIFont(name: "HelveticaNeue", size: 18)
        chauffeurNameLabel.textColor = UIColor(red: 74/255.0, green: 74/255.0, blue: 74/255.0, alpha: 1.0)
        view1.addSubview(chauffeurNameLabel)
        
        let callChauffeurIcon = shapes.drawShapes(view1, type: "call")
        callChauffeurIcon.isUserInteractionEnabled = true
        let tapOnCall = UITapGestureRecognizer(target: self, action: #selector(callChauffeur))
        callChauffeurIcon.addGestureRecognizer(tapOnCall)
        view1.addSubview(callChauffeurIcon)
        
        for index in 0 ..< mapLocationArray.count{
            mapLocation(mapLocationArray[index][safe: 0]!, long: mapLocationArray[index][safe: 1]!)
        }
        iosMapView.addConstraintsWithFormat("H:|[v0]|", views: view1)
        iosMapView.addConstraintsWithFormat("V:[v0(73)]|", views: view1)
        view1.addConstraintsWithFormat("H:|-20-[v0(60)]-20-[v1]", views: profileImageView, chauffeurNameLabel)
        view1.addConstraintsWithFormat("V:|-5-[v0(60)]", views: profileImageView)
        view1.addConstraintsWithFormat("V:|-27-[v0]", views: chauffeurNameLabel)
        view1.addConstraintsWithFormat("V:|-20-[v0]", views: callChauffeurIcon)
        view1.addConstraintsWithFormat("H:[v0]-15-|", views: callChauffeurIcon)
        
        //        setAmbLatLong()
        refreshAmbMap()
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(setAmbLatLong), name: NSNotification.Name(rawValue: "REFRESHLOC"), object: nil)
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
    
    override func viewWillAppear(_ animated: Bool) {
        //        DataCreator.sharedInstance.isAmbMapOpen = true
    }
    
    fileprivate func callNumber(_ phoneNumber:String) {
        if let phoneCallURL:URL = URL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.openURL(phoneCallURL);
            }
        }
    }
    //    @objc func setAmbLatLong(){
    //        let contactDB = FMDatabase(path: delegate.databasePath as String)
    //        var results = FMResultSet()
    //        if (contactDB?.open())! {
    //            let querySQL = "SELECT * FROM AMBASSADOR where BOOKINGID = '\(delegate.bookingID)';"
    //
    //            if((contactDB?.executeQuery(querySQL, withArgumentsIn: nil)) != nil){
    //                results = (contactDB?.executeQuery(querySQL, withArgumentsIn: nil))!
    //
    //            }
    //
    //            if((results.next()) == true){
    //                lat = Double(results.string(forColumn: "LAT"))!
    //                long = (results.double(forColumn: "LONG"))
    //                iosMapView.removeAnnotation(mapAnnotation)
    //                mapLocation(lat, long: long)
    //
    //            }
    //            contactDB?.close()
    //        } else {
    //            print("Error: \(String(describing: contactDB?.lastErrorMessage()))")
    //        }
    //    }
    
    //    func saveData(_ data: String, tableName: String){
    //        let contactDB = FMDatabase(path: appdelegate.databasePath as String)
    //        let insertSQL:String!
    //        if (contactDB?.open())! {
    //            insertSQL = "INSERT INTO " + tableName + " VALUES('\(data)')"
    //            let result = contactDB?.executeUpdate(insertSQL,
    //                                                 withArgumentsIn: nil)
    //            if !result! {
    //                print("Error: \(String(describing: contactDB?.lastErrorMessage()))")
    //            } else {
    //                print("Contact Added")
    //            }
    //        } else {
    //            print("Error: \(String(describing: contactDB?.lastErrorMessage()))")
    //        }
    //    }
    //    func query(_ tableName: String)-> FMResultSet {
    //
    //        let contactDB = FMDatabase(path: appdelegate.databasePath as String)
    //        print(appdelegate.databasePath)
    //        var results = FMResultSet()
    //        if (contactDB?.open())! {
    //            let querySQL = "SELECT * FROM " + tableName + ";"
    //            //            let querySQL = "DROP TABLE FUEL"
    //            results = (contactDB?.executeQuery(querySQL, withArgumentsIn: nil))!
    //        } else {
    //            print("Error: \(String(describing: contactDB?.lastErrorMessage()))")
    //        }
    //        return results
    //    }
    //    func createDefaultTable(){
    //        let filemgr = FileManager.default
    //        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
    //
    //        appdelegate.databasePath = (dirPaths as NSString).appendingPathComponent("contacts.db") as NSString
    //
    //        if filemgr.fileExists(atPath: appdelegate.databasePath as String) {
    //
    //            let contactDB = FMDatabase(path: appdelegate.databasePath as String)
    //
    //            if contactDB == nil {
    //                print("Error: \(String(describing: contactDB?.lastErrorMessage()))")
    //            }
    //
    //            if (contactDB?.open())! {
    //                let sql_stmt = "CREATE TABLE IF NOT EXISTS FUEL (CarID TEXT, Date TEXT, Station TEXT, Litres TEXT, Amount TEXT); CREATE TABLE IF NOT EXISTS Expenses (CarID TEXT, Date TEXT, Type TEXT, Amount TEXT); CREATE TABLE IF NOT EXISTS Mileage (CarID TEXT, Name TEXT, Mileage TEXT); CREATE TABLE IF NOT EXISTS CARS (CarID TEXT, CarNo TEXT, BrandID TEXT, ModelID TEXT, SubModelID TEXT, Category TEXT, Services TEXT); CREATE TABLE IF NOT EXISTS AMBASSADOR (BOOKINGID TEXT NOT NULL UNIQUE, LAT TEXT, LONG TEXT); CREATE TABLE IF NOT EXISTS DRIVINGLIC (DLID TEXT NOT NULL UNIQUE, NAME TEXT)"
    //                if !(contactDB?.executeStatements(sql_stmt))! {
    //                    print("Error: \(String(describing: contactDB?.lastErrorMessage()))")
    //                }
    //                contactDB?.close()
    //                userCar()
    //            } else {
    //                print("Error: \(String(describing: contactDB?.lastErrorMessage()))")
    //            }
    //        }
    //
    //    }
    //    func userCar(){
    //        let contactDB = FMDatabase(path: appdelegate.databasePath as String)
    //        var results = FMResultSet()
    //        appdelegate.carArray.removeAll()
    //        if (contactDB?.open())! {
    //            let querySQL = "SELECT * FROM CARS;"
    //            results = (contactDB?.executeQuery(querySQL, withArgumentsIn: nil))!
    //
    //            if((results.next()) == true){
    //                appdelegate.carArray.append([results.string(forColumn: "CarID"), results.string(forColumn: "CarNo"), results.string(forColumn: "BrandID"), results.string(forColumn: "ModelID"), results.string(forColumn: "SubModelID"), results.string(forColumn: "Category"), results.string(forColumn: "Services")])
    //                while results.next(){
    //                    appdelegate.carArray.append([results.string(forColumn: "CarID"), results.string(forColumn: "CarNo"), results.string(forColumn: "BrandID"), results.string(forColumn: "ModelID"), results.string(forColumn: "SubModelID"), results.string(forColumn: "Category"), results.string(forColumn: "Services")])
    //                }
    //            }
    //            contactDB?.close()
    //        } else {
    //            print("Error: \(String(describing: contactDB?.lastErrorMessage()))")
    //        }
    //    }
    var imageForPin = UIImage()
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationReuseId = "Place"
        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationReuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationReuseId)
        } else {
            anView!.annotation = annotation
        }
        var imgWidth: CGFloat = 40
        var imgHeight: CGFloat = 40
        if(DataCreator.sharedInstance.currentScreenId > 22 && DataCreator.sharedInstance.currentScreenId < 30){
            imageForPin = resizeImage(image: UIImage(named: "car-icon")!, targetSize: CGSize(width: 40*3, height: 40*3))
        }
        else if(DataCreator.sharedInstance.currentScreenId > 30 && DataCreator.sharedInstance.currentScreenId < 40){
            imageForPin = resizeImage(image: UIImage(named: "Pin-RSA")!, targetSize: CGSize(width: 90*3, height: 30*3))
            imgWidth = 90
            imgHeight = 30
        }
        else if(DataCreator.sharedInstance.currentScreenId > 2 && DataCreator.sharedInstance.currentScreenId < 10){
            imageForPin = resizeImage(image: UIImage(named: "car-icon")!, targetSize: CGSize(width: 40*3, height: 40*3))
        }
        else{
            imageForPin = resizeImage(image: UIImage(named: "ambassadors")!, targetSize: CGSize(width: 40*3, height: 40*3))
        }
        anView!.image = imageForPin
        anView?.frame = CGRect(x: (width-40)/2, y: (height-40)/2, width: imgWidth, height: imgHeight)
        anView!.backgroundColor = UIColor.clear
        anView!.canShowCallout = false
        return anView
    }
    func alertView(_ textToShow: String, viewTo: UIView, width: CGFloat)-> UIView{
        let alertView = UIView()
        alertView.frame = CGRect(x: 0, y: -40, width: width, height: 40)
        alertView.backgroundColor = UIColor.lightGray
        viewTo.addSubview(alertView)
        
        let alertLabel = drawservicing.makeLabel(textToShow, screenWidth: width, heading: "mainHeading")
        
        alertView.addSubview(alertLabel)
        alertView.addConstraintsWithFormat("H:|-40-[v0]|", views: alertLabel)
        alertView.addConstraintsWithFormat("V:|[v0]|", views: alertLabel)
        return alertView
    }
    @objc func ambCurrentLocation(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        let initialLocation = CLLocation(latitude: lat, longitude: long)
        centerMapOnLocation(initialLocation)
    }
    var mapCheck = 0
    let mapAnnotation = MKPointAnnotation()
    func mapLocation(_ lat: Double, long: Double){
        print(lat, long)
        let initialLocation = CLLocation(latitude: lat, longitude: long)
        if(mapCheck == 0){
            centerMapOnLocation(initialLocation)
            mapCheck = 1
        }
        let coordinate11 = CLLocationCoordinate2D(latitude: lat, longitude: long)
        mapAnnotation.coordinate = coordinate11
        iosMapView.addAnnotation(mapAnnotation)
    }
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 0.75, regionRadius * 0.75)
        
        iosMapView.setRegion(coordinateRegion, animated: true)
    }
    
    @objc func callChauffeur(){
        callNumber(DataCreator.sharedInstance.postBookingData[bookingIndex].ambmob)
    }
    @objc func back_button_pressed(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        //        DataCreator.sharedInstance.isAmbMapOpen = false
        self.dismiss(animated: true, completion: nil)
    }
    
    func refreshAmbMap(){
        if let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.AmbLat){
            lat = Double(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.AmbLat) as! String)!
            long = Double(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.AmbLong) as! String)!
            iosMapView.removeAnnotation(mapAnnotation)
            mapLocation(lat, long: long)
        }
    }
}

