//
//  PartnerDetailsViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 28/12/17.
//  Copyright © 2017 Sachin Tomar. All rights reserved.
//

import Foundation

protocol PartnerDetailsViewControllerDelegate {
    func dismissPartnerScreen()
}

class PartnerDetailsViewController: BaseViewController, UITextFieldDelegate, SocketManagerDelegate13{
    
    let shapes = Shapes()
    let style = Style()
    let drawservicing = DrawServicing()
    var partnerDetailsVCDelegate: PartnerDetailsViewControllerDelegate?
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var superViewWidth: CGFloat!
    var superViewHeight: CGFloat!
    
    let profileImageView = UIImageView()
    let headerLabel = UILabel()
    
    var nameTextField = UITextFieldWithPadding()
    var mobileNumberTextField = UITextFieldWithPadding()
    var emailTextField = UITextFieldWithPadding()
    var saveButton = UIButton()
    var serviceCentreNameTxtField = UITextFieldWithPadding()
    var triggeredFrom: String!
    var serviceCode: Int!
    
    var scrollView  = UIScrollView.newAutoLayout()
    var contentView = UIView.newAutoLayout()
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    //For setting the scrollview contentSize
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appdelegate.conn.delegate13 = self
        
        setupUI()
        //                NotificationCenter.default.addObserver(self, selector: #selector(networkStatus), name: NSNotification.Name(rawValue: "NetworkStatus"), object: nil)
        addDoneButtonOnKeyboard()
    }
    
    //MARK: UI setup
    func setupUI(){
        view.backgroundColor = UIColor.white
        
        superViewWidth = UIScreen.main.bounds.width
        superViewHeight = UIScreen.main.bounds.height
        
        let cross = shapes.drawShapes(type: "cross")
        let closeButtonItem = NavigationItemModel(title: nil, image: cross, highlitedImage: nil, action: #selector(cancelClicked), type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        let saveButtonItem = NavigationItemModel(title: "SAVE", image: nil, highlitedImage: nil, action: #selector(sendButtonClicked), type: NavigationItemType.titleOnly)
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
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        contentView.addGestureRecognizer(tapOnView)
        
        profileImageView.layer.cornerRadius = 41
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = UIColor.gray
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(profileImageView)
        profileImageView.image = Helper.loadImageFromPath()
        profileImageView.autoSetDimension(.width, toSize: 82.0)
        profileImageView.autoSetDimension(.height, toSize: 82.0)
        profileImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 50.0)
        profileImageView.autoAlignAxis(.vertical, toSameAxisOf: self.view, withOffset: 0.0)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        if triggeredFrom == "Service" {
            serviceCode = 0
            headerLabel.text = "Partner with us"
        }
        else {
            serviceCode = 1
            headerLabel.text = "Drive with us"
        }
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(headerLabel)
        headerLabel.autoPinEdge(.top, to: .bottom, of: profileImageView, withOffset: 30)
        headerLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        headerLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        headerLabel.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        
        serviceCentreNameTxtField.layer.borderWidth = 1.0
        serviceCentreNameTxtField.layer.borderColor = style.borderColor
        serviceCentreNameTxtField.font = style.editCarTextFieldFont
        serviceCentreNameTxtField.backgroundColor = UIColor.white
        serviceCentreNameTxtField.keyboardType = .namePhonePad
        serviceCentreNameTxtField.returnKeyType = .done
        serviceCentreNameTxtField.delegate = self
        if triggeredFrom == "Service" {
            serviceCentreNameTxtField.placeholder = "SERVICE CENTRE"
            serviceCentreNameTxtField.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        }
        else{
            serviceCentreNameTxtField.autoSetDimension(.height, toSize: 0)
        }
        serviceCentreNameTxtField.isUserInteractionEnabled = true
        contentView.addSubview(serviceCentreNameTxtField)
        serviceCentreNameTxtField.autoPinEdge(.top, to: .bottom, of: headerLabel, withOffset: 10)
        serviceCentreNameTxtField.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        serviceCentreNameTxtField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        
        nameTextField.layer.borderWidth = 1.0
        nameTextField.font = style.editCarTextFieldFont
        nameTextField.layer.borderColor = style.borderColor
        nameTextField.backgroundColor = UIColor.white
        nameTextField.keyboardType = .namePhonePad
        nameTextField.returnKeyType = .done
        nameTextField.delegate = self
        nameTextField.text = DataCreator.sharedInstance.userData.firstName
        //        nameTextField.placeholder = "NAME"
        nameTextField.isUserInteractionEnabled = true
        contentView.addSubview(nameTextField)
        nameTextField.autoPinEdge(.top, to: .bottom, of: serviceCentreNameTxtField, withOffset: 30)
        nameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        nameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        nameTextField.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        
        mobileNumberTextField.layer.borderWidth = 1.0
        mobileNumberTextField.font = style.editCarTextFieldFont
        mobileNumberTextField.keyboardType = .numberPad
        mobileNumberTextField.layer.borderColor = style.borderColor
        mobileNumberTextField.backgroundColor = UIColor.white
        mobileNumberTextField.delegate = self
        mobileNumberTextField.text = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) as? String
        //        mobileNumberTextField.placeholder = "MOBILE"
        mobileNumberTextField.isUserInteractionEnabled = true
        contentView.addSubview(mobileNumberTextField)
        mobileNumberTextField.autoPinEdge(.top, to: .bottom, of: nameTextField, withOffset: 30)
        mobileNumberTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        mobileNumberTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        mobileNumberTextField.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        
        emailTextField.layer.borderWidth = 1.0
        emailTextField.font = style.editCarTextFieldFont
        emailTextField.layer.borderColor = style.borderColor
        emailTextField.backgroundColor = UIColor.white
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .done
        emailTextField.autocapitalizationType = .none
        emailTextField.delegate = self
        emailTextField.text = DataCreator.sharedInstance.userData.email
        //        emailTextField.placeholder = "EMAIL"
        emailTextField.isUserInteractionEnabled = true
        contentView.addSubview(emailTextField)
        emailTextField.autoPinEdge(.top, to: .bottom, of: mobileNumberTextField, withOffset: 30)
        emailTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        emailTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        emailTextField.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        emailTextField.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -20)
    }
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.mobileNumberTextField.inputAccessoryView = doneToolbar
    }
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == mobileNumberTextField){
            guard let text = textField.text else { return true }
            
            let newLength = text.count + string.count - range.length
            return newLength <= 10 // Bool
        }
        return true
    }
    
    var keyboardCheck = 0
    var keyboardHeight: CGFloat!
    func check(_ notification: Notification){
        if let userInfo = (notification as NSNotification).userInfo {
            let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
            keyboardHeight = keyboardSize!.height
        }
        if(keyboardHeight > 0){
            if(keyboardCheck == 0){
                animateViewMoving(true, moveValue: keyboardHeight-50)
                keyboardCheck = 1
            }
        }
    }
    
    func keyboardHide(){
        if(keyboardHeight != nil){
            if(keyboardCheck == 1){
                animateViewMoving(false, moveValue: keyboardHeight-50)
                keyboardCheck = 0
            }
        }
    }
    
    //MARK: Data validation
    func isValidName(name: String) -> Bool {
        if((name.count) > 2){
            return true
        }
        return false
    }
    
    func isValidPhoneNumber() -> Bool {
        if(mobileNumberTextField.text!.count == 10){
            return true
        }
        return false
    }
    
    func isValidEmail() -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailTextField.text)
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
    var cancelCheck = 0
    
    
    //MARK: Action handling
    @objc func sendButtonClicked(){
        if isValidName(name: serviceCentreNameTxtField.text!) || triggeredFrom == "Driver" {
            if isValidName(name: nameTextField.text!) {
                if(isValidPhoneNumber()){
                    if(isValidEmail()){
                        if serviceCode == 0{
                            appdelegate.conn.send("\(Constants.RequestStates.AppLeads)|\(nameTextField.text!)|\(mobileNumberTextField.text!)|\(emailTextField.text!)||\(serviceCentreNameTxtField.text!)|\(serviceCode!)|")
                        }
                        else{
                            appdelegate.conn.send("\(Constants.RequestStates.AppLeads)|\(nameTextField.text!)|\(mobileNumberTextField.text!)|\(emailTextField.text!)|| |\(serviceCode!)|")
                        }
                    }
                    else{
                        showAlert(dataToShow: "Please Enter Valid Email")
                    }
                }
                else{
                    showAlert(dataToShow: "Mobile Number Should Have 10 Digits")
                }
            }
            else {
                showAlert(dataToShow: "Name should have 3 characters")
            }
        }
        else {
            showAlert(dataToShow: "Service centre should have 3 characters")
        }
    }
    
    func showAlert(dataToShow: String){
        let alert = UIAlertController(title: "21North", message: dataToShow, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        Helper.topMostController().present(alert, animated: true, completion: nil)
    }
    
    @objc func cancelClicked(){
        //                passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    func dismissPartnerPage(){
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        //        self.partnerDetailsVCDelegate?.dismissPartnerScreen()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: Int(-100), up: true)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: Int(-100), up: false)
    }
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
}

