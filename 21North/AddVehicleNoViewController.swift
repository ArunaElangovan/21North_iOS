//
//  AddCarNumberViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 09/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

//Based on data from fastlane show/hide vehicle type field
import UIKit
import CoreLocation
import PureLayout

@objc protocol AddVehicleNoVCDelegate{
    func dismissProfileFromAddVehicle()
}

class AddVehicleNoViewController: BaseViewController, CLLocationManagerDelegate, UITextFieldDelegate, SocketManagerDelegate2, ChooseBrandVCDelegate, RadioButtonControllerDelegate{
    func didSelectButton(selectedButton: UIButton?)
    {
        NSLog(" \(selectedButton)" )
        if selectedButton == carRadioButton{
            vehicleType = 1
        }
        else{
            vehicleType = 0
        }
        
        submitButtonClicked()
    }
    
    var vehicleType = 1
    var drawservicing = DrawServicing()
    var shapes = Shapes()
    let locationManager = CLLocationManager()
    var vehicleNumber: String!
    var vehicleNoPromptLabel = UILabel()
    var vehicleNoTextField = UITextFieldWithPadding()
    var vehicleTypePromptLabel = UILabel()
    var vehicleTypeTextField = UITextFieldWithPadding()
    var carRadioButton = RadioButton()
    var bikeRadioButton = RadioButton()
    var submitButton = UIButtonWithPadding()
    var lat = " "
    var long = " "
    var addVehicleNoVCDelegate: AddVehicleNoVCDelegate?
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var radioButtonController: RadioButtonsController?
    
    override func viewWillAppear(_ animated: Bool) {
        if vehicleNumber != nil {
            vehicleNoTextField.text = vehicleNumber!
            pageTitle = vehicleNumber!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate.conn.delegate2 = self
        //Access Location of user
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        setupUI()
        addDoneButtonOnKeyboard()
        
        radioButtonController = RadioButtonsController(buttons: carRadioButton, bikeRadioButton)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
    }
    
    //MARK: UI setup
    func setupUI(){
        view.isUserInteractionEnabled = true
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapOnView)
        
        let backButton = shapes.drawShapes(type: "backButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        headerImage = UIImage(named: "servicing")
        
        let style = Style()
        subTitle = NSLocalizedString("AddVehicleText", comment: "")
        subTitleFont = style.firstLineFont!
        subTitleColor = UIColor.white
        titleFont = style.titleFont!
        titleColor = UIColor.white
        
        view.backgroundColor = UIColor(red: 236/255.0, green: 236/255.0, blue: 236/255.0, alpha: 1.0)
        
        //Main view
        view.addSubview(vehicleNoPromptLabel)
        vehicleNoPromptLabel.text = NSLocalizedString("VehicleNoPromptText", comment: "")
        vehicleNoPromptLabel.textAlignment = NSTextAlignment.center
        vehicleNoPromptLabel.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        vehicleNoPromptLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake((headerImage?.size.height)!+30.0, 20.0, 0.0, 20.0), excludingEdge: .bottom)
        vehicleNoPromptLabel.numberOfLines = 0
        vehicleNoPromptLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(vehicleNoTextField)
        vehicleNoTextField.placeholder = NSLocalizedString("KA02AB1798", comment: "")
        vehicleNoTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        vehicleNoTextField.autoSetDimension(.height, toSize: 25.0, relation: .greaterThanOrEqual)
        vehicleNoTextField.autoSetDimension(.width, toSize: 200)
        vehicleNoTextField.autoPinEdge(.top, to: .bottom, of: vehicleNoPromptLabel, withOffset: 10.0)
        let underLine1 = drawservicing.drawLine(0, y: 30, width: 200.0, color: "service")
        vehicleNoTextField.layer.addSublayer(underLine1)
        vehicleNoTextField.delegate = self
        vehicleNoTextField.autocapitalizationType = .allCharacters
        vehicleNoTextField.textAlignment = .center
        vehicleNoTextField.font = UIFont(name: "HelveticaNeue" , size: 15)
        vehicleNoTextField.addTarget(self, action: #selector(setPageTitle), for: .editingChanged)
        
        //Main view
        view.addSubview(vehicleTypePromptLabel)
        vehicleTypePromptLabel.text = NSLocalizedString("VehicleTypePromptText", comment: "")
        vehicleTypePromptLabel.textAlignment = NSTextAlignment.center
        vehicleTypePromptLabel.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        vehicleTypePromptLabel.autoPinEdge(.top, to: .bottom, of: vehicleNoTextField, withOffset: 20.0)
        vehicleTypePromptLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        vehicleTypePromptLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        vehicleTypePromptLabel.numberOfLines = 0
        vehicleTypePromptLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(carRadioButton)
        carRadioButton.autoSetDimension(.height, toSize: 25.0, relation: .greaterThanOrEqual)
        carRadioButton.autoSetDimension(.width, toSize: 70.0, relation: .greaterThanOrEqual)
        carRadioButton.autoAlignAxis(.vertical, toSameAxisOf: vehicleTypePromptLabel)
        carRadioButton.autoPinEdge(.top, to: .bottom, of: vehicleTypePromptLabel, withOffset: 10.0)
        carRadioButton.image = resizeImage(image: UIImage(named: "car.png")!, targetSize: CGSize(width: 40*3, height: 40*3))
        //        carRadioButton.circleColor = UIColor.orange
        //        carRadioButton.circleRadius = 10
        //        carRadioButton.setTitle("CAR", for: .normal)
        //        carRadioButton.setTitleColor(UIColor.black, for: .normal)
        
        view.addSubview(bikeRadioButton)
        bikeRadioButton.autoSetDimension(.height, toSize: 25.0, relation: .greaterThanOrEqual)
        bikeRadioButton.autoSetDimension(.width, toSize: 70.0, relation: .greaterThanOrEqual)
        bikeRadioButton.autoAlignAxis(.vertical, toSameAxisOf: carRadioButton)
        bikeRadioButton.autoPinEdge(.top, to: .bottom, of: carRadioButton, withOffset: 10.0)
        bikeRadioButton.image = resizeImage(image: UIImage(named: "bike.png")!, targetSize: CGSize(width: 40*3, height: 40*3))
        
        
        view.addSubview(submitButton)
        submitButton.setTitle("SUBMIT", for: .normal)
        submitButton.backgroundColor = UIColor.orange
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        submitButton.autoSetDimension(.width, toSize: 100.0, relation: .greaterThanOrEqual)
        submitButton.autoAlignAxis(toSuperviewAxis: .vertical)
        submitButton.autoPinEdge(.top, to: .bottom, of: bikeRadioButton, withOffset: 20.0)
        submitButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
        submitButton.layer.cornerRadius = 5
        submitButton.clipsToBounds = true
        submitButton.isHidden = true
    }
    
    @objc func setPageTitle(){
        pageTitle = vehicleNoTextField.text!
    }
    
    //MARK: Action handling
    @objc func backButonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        hideKeyboard()
        dismissThisView()
    }
    
    @objc func submitButtonClicked() {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        DataCreator.sharedInstance.selectedVehicleNumber = vehicleNoTextField.text!
        //if data from fastlane
        //        appdelegate.conn.send("\(Constants.RequestStates.ADDCAR)|\(DataCreator.sharedInstance.selectedBrandID)|\(DataCreator.sharedInstance.selectedModelID)|\(DataCreator.sharedInstance.selectedSubModelID)|")
        //else go to select brand page
        let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String
        print("countryCode = \(countryCode!)")
        if DataCreator.sharedInstance.networkCheck == "1"{
            if !carRadioButton.isSelected && !bikeRadioButton.isSelected {
                ToastManager.vehicleTypeEmpty()
                return
            }
            if !(vehicleNoTextField.text?.isEmpty)!{
                for i in 0 ..< DataCreator.sharedInstance.vehicleArray.count{
                    if DataCreator.sharedInstance.vehicleArray[i].number == vehicleNoTextField.text{
                        ToastManager.vehicleNumberDuplicate()
                        return
                    }
                }
                appdelegate.conn.send("\(Constants.RequestStates.VehicleBrands)|\(vehicleType)|")
            }
            else{
                ToastManager.vehicleNumberEmpty()
            }
        }else{
            ToastManager.internetError()
        }
    }
    
    func dismissThisView(){
        self.view.window!.layer.add(Helper.presentDismissTransition(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    //MARK: Textfield delegate and keyboard
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //        if(textField == numberTextField){
    //            guard let text = textField.text else { return true }
    //
    //            let newLength = text.count + string.count - range.length
    //            return newLength <= 10 // Bool
    //        }
    //        return true
    //    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        // Get invalid characters
        let invalidChars = NSCharacterSet.alphanumerics.inverted
        // Attempt to find the range of invalid characters in the input string. This returns an optional.
        let range1 = string.rangeOfCharacter(from: invalidChars)
        if range1 != nil {
            // We have found an invalid character, don't allow the change
            return false
        }
        guard let text = textField.text else { return true }
        
        let newLength = text.count + string.count - range.length
        return newLength <= 15 // Bool
        // No invalid character, allow the change
        //            return true
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
        //        newHt = newSize.height
        //        newWt = newSize.width
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    //MARK: Location handling
    func getLatLong(){
        lat = (locationManager.location?.coordinate.latitude.description)!
        long = (locationManager.location?.coordinate.longitude.description)!
        //        dataFromAccountView2 = lat + "|" + long + "|"
    }
    
    func reverseGeocodeCoordinate(_ location: CLLocation, latLong: String){
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            let cityName = placeMark.locality?.split(separator: " ").map(String.init)
            let completeString1 = "PICKUPVIEW!" + latLong
            let completeString2 = cityName![0] + "|" + "2|"
            _ = completeString1 + completeString2
            //            self.passData.dataCheck(completeString)
        })
    }
    
    //MARK: Delegate methods
    func presentChooseBrand() {
        let chooseBrandVC = ChooseBrandViewController()
        chooseBrandVC.chooseBrandVCDelegate = self
        Helper.topMostController().present(chooseBrandVC, animated: true, completion: nil)
    }
    
    func dismissAddNoVC(){
        self.dismiss(animated: true, completion: nil)
        addVehicleNoVCDelegate?.dismissProfileFromAddVehicle()
    }
}

