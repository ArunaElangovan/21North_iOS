//
//  OTPVerificationViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 04/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import CoreLocation

@objc protocol OTPVerificationVCDelegate1{
    func sendTimerCount(count: Int)
}

@objc protocol OTPVerificationVCDelegate{
    func refreshHome()
}

class OTPVerificationViewController: BaseViewController , CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, ProfileVCDelegate{
    var pinPromptLabel = UILabel()
    var pinTextField = UITextField()
    var mobileNumberLabel = UILabel()
    var changeNumberLabel = UILabel()
    var regeneratePinPromptLabel = UILabel()
    var regeneratePinButton = UIButtonWithPadding()
    var timerLabel = UILabel()
    var countTimer:Timer?
    var count: Int!
    var drawservicing = DrawServicing()
    var shapes = Shapes()
    var latitude: String!
    var longitude: String!
    var userName: String!
    var email: String!
    var triggeredFrom: String!
    var delegate: OTPVerificationVCDelegate?
    var delegate1: OTPVerificationVCDelegate1?
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidAppear(_ animated: Bool) {
        countTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataCreator.sharedInstance.currentScreen = "OtpScreen"
    }
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    //MARK: UI setup
    func setupUI(){
        view.isUserInteractionEnabled = true
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapOnView)
        
        regeneratePinButton.isEnabled = false
        
        let backButton = shapes.drawShapes(type: "backButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        headerImage = UIImage(named: "servicing")
        
        view.backgroundColor = UIColor(red: 236/255.0, green: 236/255.0, blue: 236/255.0, alpha: 1.0)
        
        view.addSubview(pinPromptLabel)
        pinPromptLabel.text = NSLocalizedString("PinPromptText", comment: "")
        pinPromptLabel.textAlignment = NSTextAlignment.center
        pinPromptLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake((headerImage?.size.height)!+30.0, 20.0, 0.0, 20.0), excludingEdge: .bottom)
        pinPromptLabel.numberOfLines = 0
        pinPromptLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(pinTextField)
        pinTextField.placeholder = NSLocalizedString("PinText", comment: "")
        pinTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        pinTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        pinTextField.autoSetDimension(.width, toSize: 100.0, relation: .greaterThanOrEqual)
        pinTextField.autoPinEdge(.top, to: .bottom, of: pinPromptLabel, withOffset: 10.0)
        let line1 = drawservicing.drawLine(0, y: 20, width: 100.0, color: "service")
        pinTextField.layer.addSublayer(line1)
        pinTextField.delegate = self
        pinTextField.keyboardType = .numberPad
        pinTextField.textAlignment = .center
        pinTextField.becomeFirstResponder()
        pinTextField.font = UIFont(name: "HelveticaNeue" , size: 15)
        pinTextField.addTarget(self, action: #selector(checkPin), for: .editingChanged)
        
        view.addSubview(mobileNumberLabel)
        mobileNumberLabel.numberOfLines = 0
        mobileNumberLabel.lineBreakMode = .byWordWrapping
        mobileNumberLabel.text = DataCreator.sharedInstance.mobileNumber
        mobileNumberLabel.textAlignment = .center
        mobileNumberLabel.autoPinEdge(.top, to: .bottom, of: pinTextField, withOffset: 20.0)
        mobileNumberLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        mobileNumberLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        mobileNumberLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        view.addSubview(changeNumberLabel)
        changeNumberLabel.numberOfLines = 0
        changeNumberLabel.lineBreakMode = .byWordWrapping
        changeNumberLabel.text = NSLocalizedString("ChangeNumberPromptText", comment: "") + NSLocalizedString("ChangeText", comment: "")
        let tapToChange = UITapGestureRecognizer(target: self, action: #selector(backButtonClicked))
        changeNumberLabel.addGestureRecognizer(tapToChange)
        changeNumberLabel.isUserInteractionEnabled = true
        changeNumberLabel.textAlignment = .center
        changeNumberLabel.textColor = UIColor.orange
        changeNumberLabel.autoPinEdge(.top, to: .bottom, of: mobileNumberLabel, withOffset: 10.0)
        changeNumberLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        changeNumberLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        changeNumberLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        view.addSubview(regeneratePinPromptLabel)
        regeneratePinPromptLabel.numberOfLines = 0
        regeneratePinPromptLabel.lineBreakMode = .byWordWrapping
        regeneratePinPromptLabel.text = NSLocalizedString("RegeneratePinPrompt", comment: "")
        regeneratePinPromptLabel.textAlignment = .center
        regeneratePinPromptLabel.autoPinEdge(.top, to: .bottom, of: changeNumberLabel, withOffset: 30.0)
        regeneratePinPromptLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        regeneratePinPromptLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        regeneratePinPromptLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        view.addSubview(regeneratePinButton)
        regeneratePinButton.setTitle(NSLocalizedString("RegeneratePinText", comment: ""), for: .normal)
        regeneratePinButton.backgroundColor = UIColor.orange
        regeneratePinButton.setTitleColor(UIColor.white, for: .normal)
        regeneratePinButton.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        regeneratePinButton.autoSetDimension(.width, toSize: 100.0, relation: .greaterThanOrEqual)
        regeneratePinButton.autoAlignAxis(toSuperviewAxis: .vertical)
        regeneratePinButton.autoPinEdge(.top, to: .bottom, of: regeneratePinPromptLabel, withOffset: 10.0)
        regeneratePinButton.addTarget(self, action: #selector(generatePin), for: .touchUpInside)
        regeneratePinButton.layer.cornerRadius = 5
        regeneratePinButton.clipsToBounds = true
        
        view.addSubview(timerLabel)
        timerLabel.numberOfLines = 0
        timerLabel.lineBreakMode = .byWordWrapping
        timerLabel.textAlignment = .center
        timerLabel.autoPinEdge(.top, to: .bottom, of: regeneratePinButton, withOffset: 10.0)
        timerLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        timerLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        timerLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        view.backgroundColor = UIColor(red: 242.0/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        
        addDoneButtonOnKeyboard()
        
        if count == nil || count == 0{
            count = 60
        }
        DataCreator.sharedInstance.currentScreen = "Otp"
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
        
        self.pinTextField.inputAccessoryView = doneToolbar
    }
    
    //MARK: Action handling
    @objc func checkPin(){
        if pinTextField.text?.count == 4 {
            if(DataCreator.sharedInstance.signupResponse.otp == pinTextField.text){
                countTimer?.invalidate()
                let profileVC = ProfileViewController()
                profileVC.dismissOtpDelegate = self
                if triggeredFrom == "Signup"{
                    if DataCreator.sharedInstance.signupResponse.userId != "-1"{
                        //                        appdelegate.conn.send("\(Constants.RequestStates.Login)|\(DataCreator.sharedInstance.mobileNumber)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.deviceId)!)|")
                        UserDefaults.standard.set(DataCreator.sharedInstance.mobileNumber, forKey: Constants.UserDefaultKeys.MobileNumber)
                        dismissSelf()
                    }
                    else{
                        Helper.topMostController().present(profileVC, animated: true, completion: nil)
                    }
                }
                else{
                    appdelegate.conn.send("\(Constants.RequestStates.UpdateUser)|\(userName!)|\(email!)|\(String(describing: UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber)!))|")
                    hideKeyboard()
                    self.dismiss(animated: true, completion: nil)
                }
            }
            else{
                pinTextField.placeholder = "Wrong PIN"
                pinTextField.text = ""
            }
        }
    }
    
    @objc func generatePin(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        //If account exists, send GENOTP else send PRELEAD for signup
        if DataCreator.sharedInstance.signupResponse.userId != "-1"{
            appdelegate.conn.send("\(Constants.RequestStates.GenerateOtp)|\(DataCreator.sharedInstance.mobileNumber)|")
        }
        else {
            appdelegate.conn.send("\(Constants.RequestStates.Signup)|\(DataCreator.sharedInstance.mobileNumber)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.deviceId)!)|\(UIDevice.current.systemName)|\(UIDevice.current.systemVersion)|\(UIDevice.current.model)|\(latitude!)|\(longitude!)|")
        }
    }
    
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        hideKeyboard()
        countTimer!.invalidate()
        if triggeredFrom == "Signup"{
            self.delegate1?.sendTimerCount(count: count)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Set timer
    @objc func countDown(){
        if(count > 1){
            count = count - 1
            if count < 10 {
                timerLabel.text = "00:0"+String(count)
            }
            else{
                timerLabel.text = "00:"+String(count)
            }
            print(count)
        }
            
        else{
            timerLabel.text = "00:00"
            regeneratePinButton.isEnabled = true
            regeneratePinButton.backgroundColor = UIColor.green
        }
    }
    
    //MARK: Textfield delegate and keyboard
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == pinTextField){
            guard let text = textField.text else { return true }
            
            let newLength = text.count + string.count - range.length
            return newLength <= 4 // Bool
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    func dismissSelf(){
        hideKeyboard()
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Delegate methods
    //ProfileVCDelegate
    func dismissOTPVerificationScreen(){
        hideKeyboard()
    }
}

