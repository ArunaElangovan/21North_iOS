//
//  EditVehicle.swift
//  21North
//
//  Created by Sachin Tomar on 06/08/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit
import CoreLocation

@objc protocol EditVehicleVCDelegate{
    func reloadHomeFromEdit()
}

class EditVehicle: BaseViewController , CLLocationManagerDelegate, UITextFieldDelegate, SocketManagerDelegate11, ChooseModelSubModelVCDelegate, ChooseBrandVCDelegate1, ChooseModelSubModelVCDelegate1 {
    func dismissChooseBrandVC() {
    }
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var superViewWidth: CGFloat!
    var superViewHeight: CGFloat!
    let shapes = Shapes()
    let drawservicing = DrawServicing()
    let style = Style()
    var editVehicleVCDelegate: EditVehicleVCDelegate?
    var scrollView  = UIScrollView.newAutoLayout()
    var contentView = UIView.newAutoLayout()
    let brandImageView = UIImageView()
    let editImageButton = UIButton()
    let vehicleNoLabel = UILabel()
    let vehicleNoTextField = UITextFieldWithPadding()
    let modelNameLabel = UILabel()
    let modelTextField = UITextFieldWithPadding()
    let subModelNameLabel = UILabel()
    let subModelTextField = UITextFieldWithPadding()
    let serviceDueLabel = UILabel()
    let serviceDueTxtField = UITextFieldWithPadding()
    let pollutionLabel = UILabel()
    let pollutionTextField = UITextFieldWithPadding()
    let insuranceLabel = UILabel()
    let insuranceTextField = UITextFieldWithPadding()
    let chassisNoLabel = UILabel()
    let chassisNoTxtField = UITextFieldWithPadding()
    let engineNoLabel = UILabel()
    let engineNoTxtField = UITextFieldWithPadding()
    let deleteVehicleButton = UIButtonWithPadding()
    var datePicker = UIDatePicker()
    var setDateCount = 0
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateScreen()
        appdelegate.conn.delegate11 = self
    }
    
    //For setting the scrollview contentSize
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
    }
    
    //MARK: UI setup
    func setupUI(){
        superViewWidth = UIScreen.main.bounds.width
        superViewHeight = UIScreen.main.bounds.height
        
        view.backgroundColor = UIColor.white
        
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        contentView.addGestureRecognizer(tapOnView)
        
        let cross = shapes.drawShapes(type: "cross")
        let closeButtonItem = NavigationItemModel(title: nil, image: cross, highlitedImage: nil, action: #selector(cancelButtonClicked), type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        let saveButtonItem = NavigationItemModel(title: "SAVE", image: nil, highlitedImage: nil, action: #selector(saveButtonClicked), type: NavigationItemType.titleOnly)
        titleFont = UIFont(name: "HelveticaNeue-bold", size:14)!
        titleColor = drawservicing.lineColor
        setRightButtonItems(saveButtonItem)
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.autoPinEdgesToSuperviewEdges(with: (UIEdgeInsetsMake(navigationHeight, 0.0, 0.0, 0.0)))
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.autoPinEdgesToSuperviewEdges()
        contentView.autoMatch(.width, to: .width, of: view)
        contentView.isUserInteractionEnabled = true
        
        let imageName:String = "BrandImages/Logo" + DataCreator.sharedInstance.fullVehicleData.vehiclemake_id + ".png"
        var brandImage = UIImage()
        
        if(Float((UIImage(named: imageName)?.size.height)!) > Float((UIImage(named: imageName)?.size.width)!)){
            brandImage = ResizeImage(UIImage(named: imageName)!, targetHeight: 45*3)
        }
        else{
            brandImage = ResizeImage1(UIImage(named: imageName)!, targetWidth: 60*3)
        }
        
        contentView.addSubview(brandImageView)
        brandImageView.translatesAutoresizingMaskIntoConstraints = false
        brandImageView.autoSetDimension(.width, toSize: brandImage.size.width)
        brandImageView.autoSetDimension(.height, toSize: brandImage.size.height)
        brandImageView.autoAlignAxis(toSuperviewAxis: .vertical)
        brandImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 20.0)
        brandImageView.image = brandImage//UIImage(named: imageName)
        brandImageView.isUserInteractionEnabled = true
        let tapOnEdit = UITapGestureRecognizer(target: self, action: #selector(editBrandClicked))
        brandImageView.addGestureRecognizer(tapOnEdit)
        
        contentView.addSubview(editImageButton)
        let editImage = shapes.drawShapes(type: "edit")
        editImageButton.translatesAutoresizingMaskIntoConstraints = false
        editImageButton.setImage(editImage, for: .normal)
        editImageButton.addTarget(self, action: #selector(editBrandClicked), for: .touchUpInside)
        editImageButton.autoSetDimension(.width, toSize: editImage.size.width)
        editImageButton.autoSetDimension(.height, toSize: editImage.size.height)
        editImageButton.autoAlignAxis(toSuperviewAxis: .vertical)
        editImageButton.autoPinEdge(.top, to: .bottom, of: brandImageView, withOffset: 10.0)
        
        contentView.addSubview(vehicleNoLabel)
        vehicleNoLabel.font = style.editCarFont
        vehicleNoLabel.text = NSLocalizedString("LicencePlateText", comment: "")
        vehicleNoLabel.textColor = style.labelFontColor
        vehicleNoLabel.autoPinEdge(.top, to: .bottom, of: editImageButton, withOffset: 20.0)
        vehicleNoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        vehicleNoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        vehicleNoLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(vehicleNoTextField)
        vehicleNoTextField.backgroundColor = UIColor.white
        vehicleNoTextField.translatesAutoresizingMaskIntoConstraints = false
        vehicleNoTextField.font = style.firstLineMedium
        vehicleNoTextField.textColor = style.labelFontColor
        vehicleNoTextField.autocapitalizationType = .allCharacters
        vehicleNoTextField.textAlignment = .center
        vehicleNoTextField.layer.borderWidth = 1
        vehicleNoTextField.layer.borderColor = style.borderColor
        vehicleNoTextField.autoPinEdge(.top, to: .bottom, of: vehicleNoLabel, withOffset: 10.0)
        vehicleNoTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        vehicleNoTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        vehicleNoTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        vehicleNoTextField.delegate = self
        
        contentView.addSubview(modelNameLabel)
        modelNameLabel.font = style.editCarFont
        modelNameLabel.text = NSLocalizedString("ModelText", comment: "")
        modelNameLabel.textColor = style.labelFontColor
        modelNameLabel.autoPinEdge(.top, to: .bottom, of: vehicleNoTextField, withOffset: 20.0)
        modelNameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        modelNameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        modelNameLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(modelTextField)
        modelTextField.backgroundColor = UIColor.white
        modelTextField.translatesAutoresizingMaskIntoConstraints = false
        modelTextField.font = style.firstLineMedium
        modelTextField.textColor = style.labelFontColor
        modelTextField.textAlignment = .center
        modelTextField.layer.borderWidth = 1
        modelTextField.layer.borderColor = style.borderColor
        let tapOnModel = UITapGestureRecognizer(target: self, action: #selector(changeModel))
        modelTextField.addGestureRecognizer(tapOnModel)
        modelTextField.autoPinEdge(.top, to: .bottom, of: modelNameLabel, withOffset: 10.0)
        modelTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        modelTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        modelTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(subModelNameLabel)
        subModelNameLabel.font = style.editCarFont
        subModelNameLabel.text = NSLocalizedString("SubModelText", comment: "")
        subModelNameLabel.textColor = style.labelFontColor
        subModelNameLabel.autoPinEdge(.top, to: .bottom, of: modelTextField, withOffset: 20.0)
        subModelNameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        subModelNameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        subModelNameLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(subModelTextField)
        subModelTextField.backgroundColor = UIColor.white
        subModelTextField.translatesAutoresizingMaskIntoConstraints = false
        subModelTextField.font = style.firstLineMedium
        subModelTextField.textColor = style.labelFontColor
        subModelTextField.textAlignment = .center
        subModelTextField.layer.borderWidth = 1
        subModelTextField.layer.borderColor = style.borderColor
        let tapOnSubModel = UITapGestureRecognizer(target: self, action: #selector(changeSubModel))
        subModelTextField.addGestureRecognizer(tapOnSubModel)
        subModelTextField.autoPinEdge(.top, to: .bottom, of: subModelNameLabel, withOffset: 10.0)
        subModelTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        subModelTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        subModelTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(insuranceLabel)
        insuranceLabel.font = style.editCarFont
        insuranceLabel.text = NSLocalizedString("InsuranceDueText", comment: "")
        insuranceLabel.textColor = style.labelFontColor
        insuranceLabel.autoPinEdge(.top, to: .bottom, of: subModelTextField, withOffset: 20.0)
        insuranceLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        insuranceLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        insuranceLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(insuranceTextField)
        insuranceTextField.backgroundColor = UIColor.white
        insuranceTextField.translatesAutoresizingMaskIntoConstraints = false
        insuranceTextField.font = style.firstLineMedium
        insuranceTextField.textColor = style.labelFontColor
        insuranceTextField.text = ""
        insuranceTextField.inputView = datePicker
        insuranceTextField.textAlignment = .center
        insuranceTextField.layer.borderWidth = 1
        insuranceTextField.layer.borderColor = style.borderColor
        insuranceTextField.addTarget(self, action: #selector(editInsuranceClicked), for: .editingDidBegin)
        insuranceTextField.autoPinEdge(.top, to: .bottom, of: insuranceLabel, withOffset: 10.0)
        insuranceTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        insuranceTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        insuranceTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(pollutionLabel)
        pollutionLabel.font = style.editCarFont
        pollutionLabel.text = NSLocalizedString("PollutionDueText", comment: "")
        pollutionLabel.textColor = style.labelFontColor
        pollutionLabel.autoPinEdge(.top, to: .bottom, of: insuranceTextField, withOffset: 20.0)
        pollutionLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        pollutionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        pollutionLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(pollutionTextField)
        pollutionTextField.backgroundColor = UIColor.white
        pollutionTextField.translatesAutoresizingMaskIntoConstraints = false
        pollutionTextField.font = style.firstLineMedium
        pollutionTextField.textColor = style.labelFontColor
        pollutionTextField.text = ""
        pollutionTextField.inputView = datePicker
        pollutionTextField.textAlignment = .center
        pollutionTextField.layer.borderWidth = 1
        pollutionTextField.layer.borderColor = style.borderColor
        pollutionTextField.addTarget(self, action: #selector(editPollutionClicked), for: .editingDidBegin)
        pollutionTextField.autoPinEdge(.top, to: .bottom, of: pollutionLabel, withOffset: 10.0)
        pollutionTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        pollutionTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        pollutionTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(serviceDueLabel)
        serviceDueLabel.font = style.editCarFont
        serviceDueLabel.text = NSLocalizedString("ServiceDueText", comment: "")
        serviceDueLabel.textColor = style.labelFontColor
        serviceDueLabel.autoPinEdge(.top, to: .bottom, of: pollutionTextField, withOffset: 20.0)
        serviceDueLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        serviceDueLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        serviceDueLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(serviceDueTxtField)
        serviceDueTxtField.backgroundColor = UIColor.white
        serviceDueTxtField.translatesAutoresizingMaskIntoConstraints = false
        serviceDueTxtField.font = style.firstLineMedium
        serviceDueTxtField.textColor = style.labelFontColor
        serviceDueTxtField.text = ""
        serviceDueTxtField.inputView = datePicker
        serviceDueTxtField.textAlignment = .center
        serviceDueTxtField.layer.borderWidth = 1
        serviceDueTxtField.layer.borderColor = style.borderColor
        serviceDueTxtField.addTarget(self, action: #selector(editServiceClicked), for: .editingDidBegin)
        serviceDueTxtField.autoPinEdge(.top, to: .bottom, of: serviceDueLabel, withOffset: 10.0)
        serviceDueTxtField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        serviceDueTxtField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        serviceDueTxtField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(chassisNoLabel)
        chassisNoLabel.font = style.editCarFont
        chassisNoLabel.text = NSLocalizedString("ChassisNumberText", comment: "")
        chassisNoLabel.textColor = style.labelFontColor
        chassisNoLabel.autoPinEdge(.top, to: .bottom, of: serviceDueTxtField, withOffset: 20.0)
        chassisNoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        chassisNoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        chassisNoLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(chassisNoTxtField)
        chassisNoTxtField.backgroundColor = UIColor.white
        chassisNoTxtField.translatesAutoresizingMaskIntoConstraints = false
        chassisNoTxtField.text = "0"
        chassisNoTxtField.font = style.firstLineMedium
        chassisNoTxtField.textColor = style.labelFontColor
        chassisNoTxtField.delegate = self
        chassisNoTxtField.textAlignment = .center
        chassisNoTxtField.layer.borderWidth = 1
        chassisNoTxtField.layer.borderColor = style.borderColor
        chassisNoTxtField.autoPinEdge(.top, to: .bottom, of: chassisNoLabel, withOffset: 10.0)
        chassisNoTxtField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        chassisNoTxtField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        chassisNoTxtField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(engineNoLabel)
        engineNoLabel.font = style.editCarFont
        engineNoLabel.text = NSLocalizedString("EngineNumberText", comment: "")
        engineNoLabel.textColor = style.labelFontColor
        engineNoLabel.autoPinEdge(.top, to: .bottom, of: chassisNoTxtField, withOffset: 20.0)
        engineNoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        engineNoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        engineNoLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(engineNoTxtField)
        engineNoTxtField.backgroundColor = UIColor.white
        engineNoTxtField.translatesAutoresizingMaskIntoConstraints = false
        engineNoTxtField.delegate = self
        engineNoTxtField.text = "0"
        engineNoTxtField.font = style.firstLineMedium
        engineNoTxtField.textColor = style.labelFontColor
        engineNoTxtField.textAlignment = .center
        engineNoTxtField.layer.borderWidth = 1
        engineNoTxtField.layer.borderColor = style.borderColor
        engineNoTxtField.autoPinEdge(.top, to: .bottom, of: engineNoLabel, withOffset: 10.0)
        engineNoTxtField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        engineNoTxtField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        engineNoTxtField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(deleteVehicleButton)
        deleteVehicleButton.backgroundColor = UIColor.white
        deleteVehicleButton.translatesAutoresizingMaskIntoConstraints = false
        deleteVehicleButton.setTitle(NSLocalizedString("DeleteVehicleText", comment: ""), for: UIControlState())
        deleteVehicleButton.layer.borderWidth = 1
        deleteVehicleButton.layer.borderColor = style.borderColor
        deleteVehicleButton.titleLabel?.font = style.editCarButtonFont
        deleteVehicleButton.setTitleColor(style.editCarButtonFontColor, for: UIControlState())
        deleteVehicleButton.addTarget(self, action: #selector(deleteVehicle), for: .touchUpInside)
        deleteVehicleButton.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        deleteVehicleButton.autoSetDimension(.width, toSize: 100.0, relation: .greaterThanOrEqual)
        deleteVehicleButton.autoAlignAxis(toSuperviewAxis: .vertical)
        deleteVehicleButton.autoPinEdge(.top, to: .bottom, of: engineNoTxtField, withOffset: 30.0)
        deleteVehicleButton.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -20)
        deleteVehicleButton.layer.cornerRadius = 5
        deleteVehicleButton.clipsToBounds = true
        
        //If vehicle has booking don't allow user to edit brand/model/variant/vehicle number
        if DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus == "000" ||  DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus == "001" || DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus == "011" {
            brandImageView.isUserInteractionEnabled = false
            editImageButton.isUserInteractionEnabled = false
            modelTextField.isUserInteractionEnabled = false
            modelTextField.textColor = UIColor.lightGray
            subModelTextField.isUserInteractionEnabled = false
            subModelTextField.textColor = UIColor.lightGray
            vehicleNoTextField.isUserInteractionEnabled = false
            vehicleNoTextField.textColor = UIColor.lightGray
        }
        createDatePicker()
    }
    
    func createDatePicker() {
        datePicker.datePickerMode = .date
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.black
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(donePressed))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(cancelPressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        toolBar.setItems([cancelButton,flexSpace,doneButton], animated: true)
        
        //        let cancelButton = UIButton()
        //        pickerContainerView.addSubview(cancelButton)
        //        cancelButton.frame = CGRect(x: 20,y: 0,width: 100,height: 30)
        //        cancelButton.setTitle("CANCEL", for: .normal)
        //        cancelButton.setTitleColor(UIColor.black, for: .normal)
        //        cancelButton.addTarget(self, action: #selector(cancelDatePicker), for: .touchUpInside)
        
        insuranceTextField.inputAccessoryView = toolBar
        pollutionTextField.inputAccessoryView = toolBar
        serviceDueTxtField.inputAccessoryView = toolBar
    }
    
    //MARK: Action handling
    @objc func donePressed(sender: UIBarButtonItem) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        dateChanged(datePicker: datePicker)
        closePicker()
    }
    
    @objc func cancelPressed(sender: UIBarButtonItem) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        closePicker()
    }
    
    func closePicker(){
        if(setDateCount == 1){
            serviceDueTxtField.resignFirstResponder()
        }
        else if(setDateCount == 3){
            pollutionTextField.resignFirstResponder()
        }
        else if(setDateCount == 2){
            insuranceTextField.resignFirstResponder()
        }
    }
    
    func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeStyle = DateFormatter.Style.none
        var date = String(describing: datePicker.date)
        //        var date = dateFormatter.string(from: datePicker.date)
        let index = date.index(of: " ")
        date = Helper.dateFormateChange(String(date.prefix(upTo: index!)))
        
        
        if(setDateCount == 1){
            serviceDueTxtField.text = date
        }
        else if(setDateCount == 3){
            pollutionTextField.text = date
        }
        else if(setDateCount == 2){
            insuranceTextField.text = date
        }
    }
    
    @objc func editBrandClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        DataCreator.sharedInstance.modelPageTriggeredFrom = "EditBrandPage"
        DataCreator.sharedInstance.shouldReloadSubModel = false
        appdelegate.conn.send("\(Constants.RequestStates.VehicleBrands)|a|a|")
    }
    
    @objc func saveButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        var insuranceDate = "0"
        var pollutionDate = "0"
        var serviceDate = "0"
        var chassisNo = "0"
        var engineNo = "0"
        if(insuranceTextField.text?.count != 0){
            insuranceDate = Helper.dateToSystem(insuranceTextField.text!)
        }
        if let pollutionText = pollutionTextField.text, pollutionText.count > 0{
            pollutionDate = Helper.dateToSystem(pollutionTextField.text!)
        }
        if let serviceText = serviceDueTxtField.text, serviceText.count > 0{
            serviceDate = Helper.dateToSystem(serviceDueTxtField.text!)
        }
        if let chassisText = chassisNoTxtField.text, chassisText.count > 0{
            chassisNo = chassisNoTxtField.text!
        }
        if let engineText = engineNoTxtField.text, engineText.count > 0{
            engineNo = engineNoTxtField.text!
        }
        DataCreator.sharedInstance.selectedVehicleNumber = vehicleNoTextField.text!
        if DataCreator.sharedInstance.networkCheck == "1"{
            appdelegate.conn.send("\(Constants.RequestStates.UpdateVehicle)|\(DataCreator.sharedInstance.selectedVehicleID)|\(vehicleNoTextField.text!)|\(insuranceDate)|\(pollutionDate)|\(serviceDate)|\(engineNo)|\(chassisNo)|")
        }
        else{
            ToastManager.internetError()
        }
    }
    
    @objc func editServiceClicked(){
        setDateCount = 1
    }
    
    @objc func editInsuranceClicked(){
        setDateCount = 2
    }
    
    @objc func editPollutionClicked(){
        setDateCount = 3
    }
    
    @objc func deleteVehicle(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        var alert: UIAlertController
        
        if DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus == "000" ||  DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus == "001" || DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus == "011" {
            alert = UIAlertController(title: "Delete Vehicle", message: "You Have An Active Booking.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add the action button
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        }
        else {
            alert = UIAlertController(title: "Delete Vehicle", message: "Would you like to continue?", preferredStyle: UIAlertControllerStyle.alert)
            
            // add the action button
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in
                if DataCreator.sharedInstance.networkCheck == "1"{
                    self.appdelegate.conn.send("\(Constants.RequestStates.DeleteVehicle)|\(DataCreator.sharedInstance.selectedVehicleID)|")
                }
                else{
                    ToastManager.internetError()
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        }
        // show the alert
        Helper.topMostController().present(alert, animated: true, completion: nil)
    }
    
    @objc func cancelButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func changeModel(){
        DataCreator.sharedInstance.modelPageTriggeredFrom = "EditPage"
        DataCreator.sharedInstance.shouldReloadSubModel = false
        appdelegate.conn.send("\(Constants.RequestStates.VehicleModels)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemake_id)|")
    }
    
    @objc func changeSubModel(){
        DataCreator.sharedInstance.modelPageTriggeredFrom = "EditPage"
        DataCreator.sharedInstance.shouldReloadSubModel = false
        appdelegate.conn.send("\(Constants.RequestStates.VehicleModels)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemake_id)|")
    }
    
    //MARK: Textfield delegate and keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        if textField == vehicleNoTextField{
            // Get invalid characters
            let invalidChars = NSCharacterSet.alphanumerics.inverted
            // Attempt to find the range of invalid characters in the input string. This returns an optional.
            let range = string.rangeOfCharacter(from: invalidChars)
            if range != nil {
                // We have found an invalid character, don't allow the change
                return false
            } else {
                // No invalid character, allow the change
                return true
            }
        }
        return true
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(hideKeyboard))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        chassisNoTxtField.inputAccessoryView = doneToolbar
        engineNoTxtField.inputAccessoryView = doneToolbar
    }
    
    var keyCheck = 0
    var keyboardHeight: CGFloat!
    func check(_ notification: Notification){
        if(keyCheck == 0){
            if let userInfo = (notification as NSNotification).userInfo {
                let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
                keyboardHeight = keyboardSize!.height
            }
            if(keyboardHeight > 0){
                animateViewMoving(true, moveValue: keyboardHeight)
            }
            keyCheck = 1
        }
    }
    
    func keyboardHide(){
        if(keyboardHeight != nil){
            animateViewMoving(false, moveValue: keyboardHeight)
            keyCheck = 0
        }
    }
    
    func animateViewMoving (_ up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    //MARK: Data handling
    func populateScreen(){
        vehicleNoTextField.text = DataCreator.sharedInstance.selectedVehicleNumber.components(separatedBy: CharacterSet.alphanumerics.inverted)
            .joined()
        modelTextField.text = DataCreator.sharedInstance.fullVehicleData.model
        subModelTextField.text = DataCreator.sharedInstance.fullVehicleData.sub_model_name
        let insuranceFieldText = Helper.dateFormateChange(DataCreator.sharedInstance.fullVehicleData.insurance)
        if(insuranceFieldText != "Null"){
            insuranceTextField.text = insuranceFieldText
        }
        let serviceDueFieldText = Helper.dateFormateChange(DataCreator.sharedInstance.fullVehicleData.duedate)
        if(serviceDueFieldText != "Null"){
            serviceDueTxtField.text = serviceDueFieldText
        }
        let pollutionFieldText = Helper.dateFormateChange(DataCreator.sharedInstance.fullVehicleData.puc)
        if(pollutionFieldText != "Null"){
            pollutionTextField.text = pollutionFieldText
        }
        chassisNoTxtField.text = DataCreator.sharedInstance.fullVehicleData.chassisnumber
        engineNoTxtField.text = DataCreator.sharedInstance.fullVehicleData.enginenumber
    }
    
    //MARK: Image handling
    func ResizeImage1(_ image: UIImage, targetWidth: CGFloat) -> UIImage {
        let size = image.size
        let heightRatio = targetWidth / image.size.width
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    func ResizeImage(_ image: UIImage, targetHeight: CGFloat) -> UIImage {
        let size = image.size
        let heightRatio = targetHeight / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    //Socket delegate
    func dismissEditPage(){
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
        editVehicleVCDelegate?.reloadHomeFromEdit()
    }
    func presentBrands(){
        let chooseBrandVC = ChooseBrandViewController()
        chooseBrandVC.chooseBrandVCDelegate1 = self
        Helper.topMostController().present(chooseBrandVC, animated: true, completion: nil)
    }
    func presentModels(){
        let chooseModelSubModelVC = ChooseModelSubModelViewController()
        chooseModelSubModelVC.chooseModelVCDelegate1 = self
        Helper.topMostController().present(chooseModelSubModelVC, animated: true, completion: nil)
    }
    func updateModel(){
        modelTextField.text = DataCreator.sharedInstance.fullVehicleData.model
        subModelTextField.text = DataCreator.sharedInstance.fullVehicleData.sub_model_name
    }
    func updateBrandModel(){
        let imageName:String = "BrandImages/Logo" + DataCreator.sharedInstance.fullVehicleData.vehiclemake_id + ".png"
        var brandImage = UIImage()
        
        if(Float((UIImage(named: imageName)?.size.height)!) > Float((UIImage(named: imageName)?.size.width)!)){
            brandImage = ResizeImage(UIImage(named: imageName)!, targetHeight: 45*3)
        }
        else{
            brandImage = ResizeImage1(UIImage(named: imageName)!, targetWidth: 60*3)
        }
        brandImageView.image = brandImage
        modelTextField.text = DataCreator.sharedInstance.fullVehicleData.model
        subModelTextField.text = DataCreator.sharedInstance.fullVehicleData.sub_model_name
    }
}

