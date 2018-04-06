//
//  ViewController.swift
//  Parallax
//
//  Created on 24/06/2016.
//  Copyright (c) 2016. All rights reserved.

import UIKit
import AVFoundation
import CoreLocation

@objc protocol ViewControllerDelegate {
    @objc optional func toggleLeftPanel()
    @objc optional func toggleRightPanel()
    @objc optional func collapseSidePanels()
}

class ViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, CLLocationManagerDelegate, UIScrollViewDelegate, SocketManagerDelegate7, RefreshHomeFromModifyDelegate, BookingFormVCDelegate{
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var locationManager = CLLocationManager()
    var coordavail = 1
    var locationObj:CLLocation!
    var collectionView: UICollectionView!
    var collectionViewLayout: UICollectionViewFlowLayout!
    var curLat = ""
    var curLong = ""
    var serviceStatus: Character!
    var chauffStatus: Character!
    var rsaStatus: Character!
    var bookingIndex = 0
    var delegate: ViewControllerDelegate?
    var arrImageName = ["Home-Expenses","Home-Servicing","Home-Chauffeur","Home-Insurance","Home-RSA", "Home-ESTIMATOR"]
    var screenHeight: CGFloat = 0.0
    var screenWidth: CGFloat = 0.0
    var screenSize: CGRect!
    var sideView:UIView!
    var decideInt: Int = 0
    var loginStatus:Int?
    var latLong:String!
    var qstageArray = [String]()
    var databaseQuery = LocateAmbassador()
    let style = Style()
    let modifyCancelBookingVC = ModifyCancelBookingViewcontroller()
    let bookingFormVC = BookingFormViewController()
    var twoSecTimer = Timer()
    var timer = Timer()
    
    //MARK: Action handling
    @objc func addNewVehicle(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        
        guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
            Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
            return
        }
        self.view.window!.layer.add(Helper.presentDismissTransition(), forKey: nil)
        Helper.topMostController().present(AddVehicleNoViewController(), animated: false, completion: nil)
    }
    
    @objc func showBooking(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        if(DataCreator.sharedInstance.networkCheck == "0"){//server down
            ToastManager.internetError()
            return
        }
        guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
            Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
            return
        }
        if DataCreator.sharedInstance.vehicleArray.count > 0 {
            if serviceStatus == "0" {
                if DataCreator.sharedInstance.currentScreenId == 0 || DataCreator.sharedInstance.currentScreenId == 1 {
                    appdelegate.conn.send("\(Constants.RequestStates.BookingDetails)|\(DataCreator.sharedInstance.currentBookingId)|\(DataCreator.sharedInstance.latitude)|\(DataCreator.sharedInstance.longitude)|")
                }
                else if DataCreator.sharedInstance.currentScreenId == 8{
                    presentRatingScreen()
                }
                else if DataCreator.sharedInstance.currentScreenId > 1 && DataCreator.sharedInstance.currentScreenId < 8{
                    presentModifyScreen()
                }
                else{
                    ToastManager.bookingError()
                }
                
            }
            else if serviceStatus == "1"{
                DataCreator.sharedInstance.serviceType = "1"
                appdelegate.conn.send("\(Constants.RequestStates.BookingData)|\(DataCreator.sharedInstance.serviceType)|\(DataCreator.sharedInstance.latitude)|\(DataCreator.sharedInstance.longitude)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemake_id)|")
            }
        }
        else{
            Helper.topMostController().present(AddVehicleNoViewController(), animated: true, completion: nil)
        }
    }
    
    @objc func showChauffer(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        if(DataCreator.sharedInstance.networkCheck == "0"){//server down
            ToastManager.internetError()
            return
        }
        guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
            Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
            return
        }
        if DataCreator.sharedInstance.vehicleArray.count > 0 {
            if chauffStatus == "0" {
                if DataCreator.sharedInstance.currentScreenId == 25{
                    presentRatingScreen()
                }
                else if DataCreator.sharedInstance.currentScreenId > 19 && DataCreator.sharedInstance.currentScreenId < 25{
                    presentModifyScreen()
                }
                else{
                    ToastManager.bookingError()
                }
            }
            else if chauffStatus == "1"{
                DataCreator.sharedInstance.serviceType = "2"
                appdelegate.conn.send("\(Constants.RequestStates.BookingData)|\(DataCreator.sharedInstance.serviceType)|\(DataCreator.sharedInstance.latitude)|\(DataCreator.sharedInstance.longitude)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemake_id)|")
            }
        }
        else{
            Helper.topMostController().present(AddVehicleNoViewController(), animated: true, completion: nil)
        }
    }
    @objc func showExpenses(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        let alert = UIAlertController(title: "Track Vehicle Expenses", message: "Coming Soon", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        Helper.topMostController().present(alert, animated: true, completion: nil)
    }
    @objc func showRSA(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
            Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
            return
        }
        if DataCreator.sharedInstance.vehicleArray.count > 0 {
            if rsaStatus == "0"{
                
                if DataCreator.sharedInstance.currentScreenId == 34{
                    presentRatingScreen()
                }
                else if DataCreator.sharedInstance.currentScreenId < 30{
                    ToastManager.bookingError() //toast to show can't book RSA
                }
                    //            else if DataCreator.sharedInstance.currentScreenId == 31{
                    //                appdelegate.conn.send("\(Constants.RequestStates.BookingDetails)|\(DataCreator.sharedInstance.currentBookingId)|\(DataCreator.sharedInstance.latitude)|\(DataCreator.sharedInstance.longitude)|")
                    //            }
                else{
                    presentModifyScreen()
                }
            }
            else if rsaStatus == "1"{
                DataCreator.sharedInstance.serviceType = "3"
                if DataCreator.sharedInstance.networkCheck == "1"{
                    appdelegate.conn.send("\(Constants.RequestStates.BookingData)|\(DataCreator.sharedInstance.serviceType)|\(DataCreator.sharedInstance.latitude)|\(DataCreator.sharedInstance.longitude)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemake_id)|")
                }
                else{
                    ToastManager.internetError()
                }
            }
            
        }
        else{
            Helper.topMostController().present(AddVehicleNoViewController(), animated: true, completion: nil)
        }
    }
    @objc func showInsurance(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        let alert = UIAlertController(title: "Renew Vehicle Insurance", message: "Coming Soon", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        Helper.topMostController().present(alert, animated: true, completion: nil)
    }
    @objc func showEstimate(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
            Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
            return
        }
        if DataCreator.sharedInstance.networkCheck == "1"{
            appdelegate.conn.send("\(Constants.RequestStates.ComplaintList)|b|")
        }
        else{
            ToastManager.internetError()
        }
    }
    @objc func tapOnSpon(){
        let webVC = WebViewController()
        webVC.hidesBottomBarWhenPushed = true
        webVC.urlString = DataCreator.sharedInstance.sponserLink
        webVC.pagetitle = NSLocalizedString("SponsorText", comment: "")
        Helper.topMostController().present(webVC, animated: true, completion: nil)
        
        //        passData.clickTrack(dataString: "62")
    }
    @objc func viewHistory(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
            Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
            return
        }
        if DataCreator.sharedInstance.vehicleArray.count > 0{
            if DataCreator.sharedInstance.networkCheck == "1"{
                appdelegate.conn.send("\(Constants.RequestStates.VehicleHistory)|\(DataCreator.sharedInstance.selectedVehicleID)|")
            }
            else{
                ToastManager.internetError()
            }
        }
        else{
            Helper.topMostController().present(AddVehicleNoViewController(), animated: true, completion: nil)
        }
    }
    
    @objc func editVehicle(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
            Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
            return
        }
        if DataCreator.sharedInstance.vehicleArray.count > 0{
            if DataCreator.sharedInstance.networkCheck == "1"{
                appdelegate.conn.send("\(Constants.RequestStates.VehicleDetails)|\(DataCreator.sharedInstance.selectedVehicleID)|")
            }
            else{
                ToastManager.internetError()
            }
        }
        else{
            Helper.topMostController().present(AddVehicleNoViewController(), animated: true, completion: nil)
        }
    }
    
    //MARK: Location handling
    func getLatLong()->String{
        let lat = locationManager.location?.coordinate.latitude.description
        let long = locationManager.location?.coordinate.longitude.description
        latLong = lat! + "|" + long! + "|"
        return latLong
    }
    
    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D){
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
            if let address = response?.firstResult() {
                let lines = address.lines as [String]!
                let city = address.locality?.split(separator: " ").map(String.init)
                DataCreator.sharedInstance.city = city![0]
                DataCreator.sharedInstance.latitude = coordinate.latitude
                DataCreator.sharedInstance.longitude = coordinate.longitude
                DataCreator.sharedInstance.currentLocation = (lines?.joined(separator: ""))!
            }
        }
    }
    
    var countCheck = 0
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.authorizedWhenInUse){
            locationManager.requestWhenInUseAuthorization()
        }
        else if (status == CLAuthorizationStatus.denied){
            Helper.topMostController().present(LocationService(), animated: true, completion: nil)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        locationObj = locationArray.lastObject as! CLLocation
        let coord = locationObj.coordinate
        coordavail = 1
        curLat = coord.latitude.description
        curLong = coord.longitude.description
        latLong = curLat + "|" + curLong + "|"
        if(countCheck == 0){
            reverseGeocodeCoordinate(CLLocationCoordinate2DMake((locationManager.location?.coordinate.latitude)!, (locationManager.location?.coordinate.longitude)!))
            countCheck = 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate.conn.delegate7 = self
        
        if(DataCreator.sharedInstance.check == 0){
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.viewCtrl()
            DataCreator.sharedInstance.check = 1
        }
        
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
        DataCreator.sharedInstance.currentScreenNo = 0
        
        if(CLLocationManager.authorizationStatus() != .authorizedWhenInUse){
            print("done")
        }
        if (CLLocationManager.locationServicesEnabled() && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.denied) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.distanceFilter = 0
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
        }
        else{
            Helper.topMostController().present(LocationService(), animated: true, completion: nil)
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        collectionViewLayout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: collectionViewLayout)
        collectionViewLayout.itemSize = self.collectionView.frame.size;
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        if(DataCreator.sharedInstance.homePageCheck == 0){
            collectionView.backgroundColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
        }
        else{
            collectionView.backgroundColor = UIColor.black
        }
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.minimumInteritemSpacing = 0
        collectionViewLayout.minimumLineSpacing = 0
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        self.view.addSubview(collectionView)
        self.view.backgroundColor = UIColor.black
        
        NotificationCenter.default.addObserver(self, selector: #selector(showExpenses), name: NSNotification.Name(rawValue: "SHOWEXP"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(openLeftMenu), name: NSNotification.Name(rawValue: "openLeft"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showBooking), name: NSNotification.Name(rawValue: "SHOWSER"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showChauffer), name: NSNotification.Name(rawValue: "SHOWCHAUFFEUR"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showRSA), name: NSNotification.Name(rawValue: "SHOWRSA"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showEstimate), name: NSNotification.Name(rawValue: "SHOWESTI"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(viewHistory), name: NSNotification.Name(rawValue: "VIEWHIS"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(editVehicle), name: NSNotification.Name(rawValue: "EDITCAR"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(scrollToPosition), name: NSNotification.Name(rawValue: "SCROLL"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addNewVehicle), name: NSNotification.Name(rawValue: "openCar"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showDoc), name: NSNotification.Name(rawValue: "ShowDoc"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(tapOnSpon), name: NSNotification.Name(rawValue: "OpenAd"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showInsurance), name: NSNotification.Name(rawValue: "SHOWINSU"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DataCreator.sharedInstance.currentScreen = "HomeScreen"
        
        
        collectionView.reloadData()
        //        if DataCreator.sharedInstance.isBookingCreated{
        //            DataCreator.sharedInstance.isBookingCreated = false
        //            let bookingConfirmedVC = BookingConfirmedViewController()
        //            bookingConfirmedVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        //            self.present(bookingConfirmedVC, animated: true, completion: nil)
        //        }
    }
    
    func getServiceStatus(){
        if !DataCreator.sharedInstance.vehicleArray.isEmpty{
            let status = DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus
            serviceStatus = status.first
            chauffStatus = status.dropFirst().first
            rsaStatus = status.last
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DataCreator.sharedInstance.currentScreenNo = 0
    }
    func showLocationService(){
        Helper.topMostController().present(LocationService(), animated: true, completion: nil)
    }
    
    func refreshColl(_ notification:Notification){
        collectionView.reloadData()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "REFCOL"), object: nil)
    }
    
    @objc func showDoc(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
            Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
            return
        }
        if DataCreator.sharedInstance.vehicleArray.count > 0{
            let documents = Documents()
            documents.triggeredFrom = "Documents"
            Helper.topMostController().present(documents, animated: true, completion: nil)
        }
        else{
            Helper.topMostController().present(AddVehicleNoViewController(), animated: true, completion: nil)
        }
    }
    
    @objc func openLeftMenu(){
        slideMenuController()?.openLeft()
    }
    
    var carArray = [[String]]()
    var horScrollCount = 0
    var data = [String]()
    
    @objc func scrollToPosition(_ notification: Notification){
        let pin = (notification as NSNotification).userInfo!["SCROLL"] as! String
        collectionView.reloadData()
        collectionView.scrollToItem(at: IndexPath(item: Int(pin)!, section: 0), at: .right, animated: true)
    }
    override func viewWillLayoutSubviews() {
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(DataCreator.sharedInstance.vehicleArray.count != 0){
            return DataCreator.sharedInstance.vehicleArray.count//number of cars
        }
        else{
            return 1
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if(collectionViewLayout.scrollDirection == .horizontal){
            let str = collectionView.indexPathsForVisibleItems
            setStatus(str[0][1])
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "REFCOL"), object: nil)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        let row = indexPath.row
        setStatus(row)
        cell.parallaxTheImageViewScrollOffset(self.collectionView.contentOffset, scrollDirection: self.collectionViewLayout.scrollDirection)
        return cell
    }
    
    func setStatus(_ index: Int){
        if DataCreator.sharedInstance.vehicleArray.count > 0{
            DataCreator.sharedInstance.selectedVehicleID = DataCreator.sharedInstance.vehicleArray[index].id
            DataCreator.sharedInstance.selectedVehicleNumber = DataCreator.sharedInstance.vehicleArray[index].number
            DataCreator.sharedInstance.fullVehicleData.vehiclemake_id = DataCreator.sharedInstance.vehicleArray[index].brandid
            DataCreator.sharedInstance.fullVehicleData.vehiclemodelid = DataCreator.sharedInstance.vehicleArray[index].modelid
            DataCreator.sharedInstance.currentVehicleId = index
            DataCreator.sharedInstance.servicingLabel = NSLocalizedString("Book Now", comment: "")
            DataCreator.sharedInstance.chauffeurLabel = NSLocalizedString("Book Now", comment: "")
            DataCreator.sharedInstance.rsaLabel = NSLocalizedString("Book Now", comment: "")
            //            DataCreator.sharedInstance.servicingLabelCheck = Int(String(serviceStatus))!
            //            DataCreator.sharedInstance.chaufferLabelCheck = Int(String(chauffStatus))!
            //            DataCreator.sharedInstance.rsaLabelCheck = Int(String(rsaStatus))!
            DataCreator.sharedInstance.servicingLabelCheck = 0
            DataCreator.sharedInstance.chaufferLabelCheck = 0
            DataCreator.sharedInstance.rsaLabelCheck = 0
            
            if DataCreator.sharedInstance.vehicleArray[index].vehstatus != "111" && DataCreator.sharedInstance.postBookingData.count > 0{
                
                if Int(DataCreator.sharedInstance.postBookingData[bookingIndex].screenid)! > 0 && Int(DataCreator.sharedInstance.postBookingData[bookingIndex].screenid)! < 9{
                    DataCreator.sharedInstance.servicingLabel = DataCreator.sharedInstance.postBookingData[bookingIndex].stage
                    DataCreator.sharedInstance.servicingLabelCheck = 1
                }
                else if Int(DataCreator.sharedInstance.postBookingData[bookingIndex].screenid)! > 19 && Int(DataCreator.sharedInstance.postBookingData[bookingIndex].screenid)! < 26{
                    DataCreator.sharedInstance.chauffeurLabel = DataCreator.sharedInstance.postBookingData[bookingIndex].stage
                    DataCreator.sharedInstance.chaufferLabelCheck = 1
                }
                else if Int(DataCreator.sharedInstance.postBookingData[bookingIndex].screenid)! > 29 && Int(DataCreator.sharedInstance.postBookingData[bookingIndex].screenid)! < 35{
                    DataCreator.sharedInstance.rsaLabel = DataCreator.sharedInstance.postBookingData[bookingIndex].stage
                    DataCreator.sharedInstance.rsaLabelCheck = 1
                }
            }
            if !DataCreator.sharedInstance.loginResponse.bookingData.isEmpty{
                DataCreator.sharedInstance.currentBookingId = DataCreator.sharedInstance.loginResponse.bookingData[bookingIndex].queueid
                getServiceStatus()
            }
        }
        else{
            DataCreator.sharedInstance.selectedVehicleNumber = ""
        }
        
        let dix = ["CarNo": DataCreator.sharedInstance.selectedVehicleNumber]
        NotificationCenter.default.post(name: Notification.Name(rawValue: "CarNo"), object: nil, userInfo: dix)
    }
    
    // MARK: vertical Scrolling
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Parallax visible cells
        for cell: ImageCollectionViewCell in collectionView.visibleCells as! [ImageCollectionViewCell] {
            cell.parallaxTheImageViewScrollOffset(self.collectionView.contentOffset, scrollDirection: self.collectionViewLayout.scrollDirection)
            
        }
    }
    
    func timeLeft(date:String)->Int{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let originalDate = dateFormatter.date(from: date)// "Jun 13, 2016, 1:23 PM"
        let day1 = Date().timeIntervalSince(originalDate!)/60
        return Int(round(day1))
    }
    
    func populateModifyVCData(){
        Helper.getPostBookingFormData(bookingData: DataCreator.sharedInstance.postBookingData[bookingIndex])
    }
    
    //MARK: Socket manager delegate
    func presentCostEstimator(){
        DataCreator.sharedInstance.currentScreenNo = 1
        Helper.topMostController().present(CostEstimatorViewController(), animated: true, completion: nil)
    }
    
    func presentBookingForm(){
        DataCreator.sharedInstance.currentScreenNo = 1
        bookingFormVC.bookingFormVCDelegate = self
        bookingFormVC.qTime = ""
        self.view.window!.layer.add(Helper.presentDismissTransition(), forKey: nil)
        Helper.topMostController().present(bookingFormVC, animated: false, completion: nil)
    }
    func presentEditVehicle() {
        DataCreator.sharedInstance.currentScreenNo = 1
        Helper.topMostController().present(EditVehicle(), animated: true, completion: nil)
    }
    func presentHistory() {
        DataCreator.sharedInstance.currentScreenNo = 1
        Helper.topMostController().present(VehicleHistory(), animated: true, completion: nil)
    }
    func presentModifyScreen() {
        populateModifyVCData()
        DataCreator.sharedInstance.currentScreenNo = 1
        modifyCancelBookingVC.triggeredFrom = "Home"
        modifyCancelBookingVC.refreshDelegate = self
        Helper.topMostController().present(modifyCancelBookingVC, animated: true, completion: nil)
    }
    
    func presentRatingScreen() {
        DataCreator.sharedInstance.currentScreenNo = 1
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromBottom
        self.view.window!.layer.add(transition, forKey: nil)
        Helper.topMostController().present(RateServicing(), animated: false, completion: nil)
    }
    
    func reloadHomePage(){
        getServiceStatus()
        collectionView.reloadData()
    }
    func reloadHome(){
        getServiceStatus()
        collectionView.reloadData()
    }
    func reloadHomeForRSAChauffeur(){
        getServiceStatus()
        collectionView.reloadData()
    }
    func reloadHomeFromEdit(){
        getServiceStatus()
        collectionView.reloadData()
    }
}

//MARK: Collection view
extension ViewController : imageCollectionViewLayoutDelegate {
    
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        let image = UIImage(named: arrImageName[(indexPath as NSIndexPath).item])?.decompressedImage
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect  = AVMakeRect(aspectRatio: image!.size, insideRect: boundingRect)
        return rect.size.height
    }
    func collectionView(_ collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        return 0
    }
}
extension ViewController : SlideMenuControllerDelegate {
    func leftWillOpen() {}
    func leftDidOpen() {}
    func leftWillClose() {}
    func leftDidClose() {}
    func rightWillOpen() {}
    func rightDidOpen() {}
    func rightWillClose() {}
    func rightDidClose() {}
}

extension Collection where Indices.Iterator.Element == Index {
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

