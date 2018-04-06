//
//  SignUpViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 01/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import CoreLocation
import PureLayout
import libPhoneNumber_iOS

class SignUpViewController: BaseViewController , CLLocationManagerDelegate, UITextFieldDelegate, CountryPhoneCodePickerDelegate, SocketManagerDelegate, OTPVerificationVCDelegate1{
    let drawservicing = DrawServicing()
    let shapes = Shapes()
    let locationManager = CLLocationManager()
    let numberPromptLabel = UILabel()
    let dialCodeTextField = UITextField()
    let numberTextField = UITextField()
    let statusLabel = UILabel()
    let countryPromptLabel = UILabel()
    let countryTextField = UITextField()
    var submitButton = UIButtonWithPadding()
    let countryPhoneCodePicker = CountryPicker()
    var countriesArray = [Country]()
    let otpVerificationVC = OTPVerificationViewController()
    
    let countryNameLabel = UILabel()
    let countryCodeLabel = UILabel()
    var latitude = " "
    var longitude = " "
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        if !DataCreator.sharedInstance.mobileNumber.isEmpty {
            numberTextField.text = DataCreator.sharedInstance.mobileNumber
        }
        DataCreator.sharedInstance.currentScreen = "SignUp"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate.conn.delegate = self
        getLatLong()
        
        //        let locale = NSLocale.current
        let code = NSLocale.current.regionCode
        countryPhoneCodePicker.countryPhoneCodeDelegate = self
        countryTextField.text = Helper.getFlag(country: code!)
        dialCodeTextField.text = countryPhoneCodePicker.getCountryCode(code: code!)
        
        setupUI()
        
        //Access location of user
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
        
        addDoneButtonOnKeyboard()
        setupPickerView()
    }
    
    //MARK: UI setup
    func setupUI(){
        view.isUserInteractionEnabled = true
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapOnView)
        
        let backButton = shapes.drawShapes(type: "backButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        headerImage = UIImage(named: "servicing")
        view.backgroundColor = UIColor(red: 236/255.0, green: 236/255.0, blue: 236/255.0, alpha: 1.0)
        
        //Main view
        view.addSubview(numberPromptLabel)
        numberPromptLabel.text = NSLocalizedString("MobileNumberPrompt", comment: "")
        numberPromptLabel.textAlignment = NSTextAlignment.center
        numberPromptLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake((headerImage?.size.height)!+30.0, 20.0, 0.0, 20.0), excludingEdge: .bottom)
        numberPromptLabel.numberOfLines = 0
        numberPromptLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(numberTextField)
        numberTextField.placeholder = NSLocalizedString("NumberText", comment: "")
        numberTextField.autoAlignAxis(.vertical, toSameAxisOf: view, withOffset: 30)
        numberTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        numberTextField.autoSetDimension(.width, toSize: 100.0, relation: .greaterThanOrEqual)
        numberTextField.autoPinEdge(.top, to: .bottom, of: numberPromptLabel, withOffset: 10.0)
        let underLine = drawservicing.drawLine(0, y: 20, width: 100.0, color: "service")
        numberTextField.layer.addSublayer(underLine)
        numberTextField.delegate = self
        numberTextField.keyboardType = .numberPad
        numberTextField.textAlignment = .center
        numberTextField.font = UIFont(name: "HelveticaNeue" , size: 15)
        
        view.addSubview(dialCodeTextField)
        dialCodeTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        dialCodeTextField.autoSetDimension(.width, toSize: 40.0, relation: .greaterThanOrEqual)
        dialCodeTextField.autoPinEdge(.trailing, to: .leading, of: numberTextField, withOffset: -10.0)
        dialCodeTextField.autoPinEdge(.top, to: .bottom, of: numberPromptLabel, withOffset: 10.0)
        let underLine1 = drawservicing.drawLine(0, y: 20, width: 40.0, color: "service")
        dialCodeTextField.layer.addSublayer(underLine1)
        dialCodeTextField.delegate = self
        dialCodeTextField.keyboardType = .numberPad
        dialCodeTextField.textAlignment = .center
        dialCodeTextField.delegate = self
        dialCodeTextField.font = UIFont(name: "HelveticaNeue" , size: 15)
        
        view.addSubview(countryTextField)
        countryTextField.textAlignment = .center
        countryTextField.autoSetDimension(.height, toSize: 20.0)
        countryTextField.autoSetDimension(.width, toSize: 25.0)
        countryTextField.autoPinEdge(.trailing, to: .leading, of: dialCodeTextField, withOffset: -10.0)
        countryTextField.autoPinEdge(.top, to: .bottom, of: numberPromptLabel, withOffset: 10.0)
        countryTextField.delegate = self
        countryTextField.becomeFirstResponder()
        
        view.addSubview(statusLabel)
        statusLabel.numberOfLines = 0
        statusLabel.lineBreakMode = .byWordWrapping
        statusLabel.textAlignment = .center
        statusLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
        statusLabel.font = UIFont(name: "HelveticaNeue", size: 11)
        statusLabel.autoPinEdge(.top, to: .bottom, of: numberTextField, withOffset: 10.0)
        statusLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        statusLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        statusLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        view.addSubview(submitButton)
        submitButton.setTitle("SUBMIT", for: .normal)
        submitButton.backgroundColor = UIColor.orange
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        submitButton.autoSetDimension(.width, toSize: 100.0, relation: .greaterThanOrEqual)
        submitButton.autoAlignAxis(toSuperviewAxis: .vertical)
        submitButton.autoPinEdge(.top, to: .bottom, of: statusLabel, withOffset: 20.0)
        submitButton.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        submitButton.layer.cornerRadius = 5
        submitButton.clipsToBounds = true
    }
    
    //MARK: Get flag symbol from flag code
    func getFlag(country:String) -> String {
        let base : UInt32 = 127397
        var symbol = ""
        for ch in country.unicodeScalars {
            symbol.unicodeScalars.append(UnicodeScalar(base + ch.value)!)
        }
        return String(symbol)
    }
    
    //MARK: PickerView setup
    func setupPickerView(){
        //Picker for country
        //        countryPickerView.delegate = self
        //        countryPickerView.dataSource = self
        countryTextField.inputView = countryPhoneCodePicker
        //        dialCodeTextField.inputView = countryPhoneCodePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(donePressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        toolBar.setItems([flexSpace,doneButton], animated: true)
        
        countryTextField.inputAccessoryView = toolBar
        //        dialCodeTextField.inputAccessoryView = toolBar
        
        countriesArray.append(contentsOf: Helper.countryNamesByCode())
    }
    
    @objc func donePressed(sender: UIBarButtonItem) {
        countryTextField.resignFirstResponder()
        //        dialCodeTextField.resignFirstResponder()
        
    }
    
    //    @objc func tappedToolBarBtn(sender: UIBarButtonItem) {
    //        countryTextField.text = pickFlag[0]
    //        countryTextField.resignFirstResponder()
    //    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: PickerView delegate
    // MARK: - CountryPhoneCodePicker Delegate
    
    func countryPhoneCodePicker(picker: CountryPicker, didSelectCountryCountryWithName name: String, countryCode: String, phoneCode: String) {
        countryTextField.text = Helper.getFlag(country: countryCode)
        dialCodeTextField.text = phoneCode
        //        selectedCountryLabel.text = name + " " + countryCode + " " + phoneCode
    }
    
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return pickFlag.count
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        return pickFlag[row]
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        countryTextField.text = pickFlag[row]
    //    }
    
    //MARK: Action handling
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        hideKeyboard()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func submitClicked() {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        hideKeyboard()
        if !(numberTextField.text?.isEmpty)!{
            let oldNo = DataCreator.sharedInstance.mobileNumber
            DataCreator.sharedInstance.mobileNumber = numberTextField.text!
            UserDefaults.standard.set(UIDevice.current.identifierForVendor!.uuidString, forKey: Constants.UserDefaultKeys.deviceId)
            print("Device name: ", UIDevice.current.name)
            if oldNo != numberTextField.text!{
                otpVerificationVC.count = 60
                guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
                    appdelegate.conn.send("\(Constants.RequestStates.Signup)|\(DataCreator.sharedInstance.mobileNumber)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.deviceId)!)|\(UIDevice.current.systemName)|\(UIDevice.current.systemVersion)|\(UIDevice.current.model)|\(latitude)|\(longitude)|")
                    return
                }
                appdelegate.conn.send("\(Constants.RequestStates.Login)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber)!)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.deviceId)!)|")
            }
            else{
                presentOtpVerificationVC()
            }
        }
        else{
            ToastManager.mobileNumberEmpty()
        }
    }
    
    //MARK: Textfield delegate and keyboard
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == numberTextField){
            guard let text = textField.text else { return true }
            
            let newLength = text.count + string.count - range.length
            return newLength <= 10 // Bool
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == dialCodeTextField{
            for i in 0 ..< countriesArray.count{
                if textField.text == countriesArray[i].phoneCode{
                    countryTextField.text = Helper.getFlag(country: countriesArray[i].code)
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: NSLocalizedString("Done", comment: ""), style: UIBarButtonItemStyle.done, target: self, action: #selector(hideKeyboard))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    //MARK: Location handling
    func getLatLong(){
        latitude = (locationManager.location?.coordinate.latitude.description)!
        longitude = (locationManager.location?.coordinate.longitude.description)!
    }
    
    //    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D){
    //        let geocoder = GMSGeocoder()
    //
    //        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
    //            if let address = response?.firstResult() {
    //                let lines = address.lines as [String]!
    //                DataCreator.sharedInstance.latitude = coordinate.latitude
    //                DataCreator.sharedInstance.longitude = coordinate.longitude
    //                DataCreator.sharedInstance.currentLocation = (lines?.joined(separator: ""))!
    //            }
    //        }
    //    }
    
    //    func reverseGeocodeCoordinate(_ location: CLLocation, latLong: String){
    //        let geoCoder = CLGeocoder()
    //
    //        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
    //
    //            // Place details
    //            var placeMark: CLPlacemark!
    //            placeMark = placemarks?[0]
    //            let cityName = placeMark.locality?.split(separator: " ").map(String.init)
    //            let completeString1 = "PICKUPVIEW!" + latLong
    //            let completeString2 = cityName![0] + "|" + "2|"
    //            let completeString = completeString1 + completeString2
    //            //            self.passData.dataCheck(completeString)
    //            })
    //        }
    
    //MARK: Network error handling
    override func networkStatus(_ notification: Notification){
        let pin = (notification as NSNotification).userInfo!["NetworkStatus"] as! String
        let check = (notification as NSNotification).userInfo!["check"] as! String
        
        print(check)
        if(check == "0"){//server down
            statusLabel.text = "Unable to Reach Server."
        }
        else if(check == "1"){// server running
            statusLabel.text = ""
        }
        print(pin)
    }
    
    //MARK: Delegate methods
    //Socket delegate
    func validateNumber(){
        if !DataCreator.sharedInstance.signupResponse.otp.isEmpty{
            presentOtpVerificationVC()
        }
    }
    
    func presentOtpVerificationVC(){
        otpVerificationVC.delegate1 = self
        otpVerificationVC.triggeredFrom = "Signup"
        otpVerificationVC.latitude = latitude
        otpVerificationVC.longitude = longitude
        Helper.topMostController().present(otpVerificationVC, animated: true, completion: nil)
    }
    
    func presentAddVehicleNoVC(){}
    func dismissProfileVC(){}
    
    //OTPVerification delegate
    func dismissSignUpScreen(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func sendTimerCount(count: Int){
        otpVerificationVC.count = count
    }
    
    //CoreLocation delegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.authorizedWhenInUse){
            locationManager.requestWhenInUseAuthorization()
        }
        else if (status == CLAuthorizationStatus.denied){
            Helper.topMostController().present(LocationService(), animated: true, completion: nil)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //            reverseGeocodeCoordinate(CLLocationCoordinate2DMake((locationManager.location?.coordinate.latitude)!, (locationManager.location?.coordinate.longitude)!))
    }
}

