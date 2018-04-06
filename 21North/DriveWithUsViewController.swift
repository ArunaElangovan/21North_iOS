//
//  PartnerDetailsViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 28/12/17.
//  Copyright © 2017 Sachin Tomar. All rights reserved.
//

import Foundation
import PureLayout

class DriveWithUsViewController: UIViewController, UITextFieldDelegate{
    
    let shapes = Shapes()
    let style = Style()
    let drawservicing = DrawServicing()
    let passData = PassData()
    let loadingPageClass = LoadingPage()
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
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
    
    var split:String!
    
    var checkMark = UIImageView()
    var checkMark1 = UIImageView()
    var checkMark2 = UIImageView()
    var checkMark3 = UIImageView()
    var checkMark4 = UIImageView()
    var checkMark5 = UIImageView()
    var checkMark6 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        split = String(style.splitChar)
        
        view.backgroundColor = UIColor.white
        
        superViewWidth = UIScreen.main.bounds.width
        superViewHeight = UIScreen.main.bounds.height
        
        
        let mainScrollView = UIScrollView()
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.showsHorizontalScrollIndicator = false
        view.addSubview(mainScrollView)
        mainScrollView.autoPinEdgesToSuperviewEdges()
        
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(mainView)
        mainView.autoSetDimension(.width, toSize: superViewWidth)
        mainView.autoPinEdgesToSuperviewEdges()
        
        let cross = shapes.drawShapes(view, type: "cross")
        cross.isUserInteractionEnabled = true
        let tapOnCross = UITapGestureRecognizer(target: self, action: #selector(cancelClicked))
        cross.addGestureRecognizer(tapOnCross)
        mainView.addSubview(cross)
        cross.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        cross.autoPinEdge(toSuperviewEdge: .top, withInset: 20.0)
        
        
        profileImageView.layer.cornerRadius = 41
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = UIColor.gray
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(profileImageView)
        profileImageView.image = loadingPageClass.loadImageFromPath()
        profileImageView.autoSetDimension(.width, toSize: 82.0)
        profileImageView.autoSetDimension(.height, toSize: 82.0)
        profileImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 50.0)
        profileImageView.autoAlignAxis(.vertical, toSameAxisOf: self.view, withOffset: 0.0)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Drive with us"
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        mainView.addSubview(headerLabel)
        headerLabel.autoPinEdge(.top, to: .bottom, of: profileImageView, withOffset: 30)
        headerLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        headerLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        NSLayoutConstraint.autoSetPriority(1000.0) {
            headerLabel.contentCompressionResistancePriority(for: .vertical)
        }
        
                saveButton.setTitle(NSLocalizedString("SAVE", comment: ""), for: UIControlState())
                saveButton.titleLabel?.font = UIFont(name: "HelveticaNeue-bold", size:14)
                saveButton.setTitleColor(drawservicing.lineColor, for: UIControlState())
                saveButton.translatesAutoresizingMaskIntoConstraints = false
                saveButton.titleLabel?.adjustsFontSizeToFitWidth = true
                saveButton.isHidden = true
                saveButton.addTarget(self, action: #selector(sendButtonClicked), for: .touchUpInside)
                mainView.addSubview(saveButton)
        saveButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        saveButton.autoPinEdge(toSuperviewEdge: .top, withInset: 20.0)
//        saveButton.autoSetDimension(.width, toSize: 100.0)
//        NSLayoutConstraint.autoSetPriority(1000.0) {
//            saveButton.contentCompressionResistancePriority(for: .vertical)
//        }
        
        serviceCentreNameTxtField.layer.borderWidth = 1.0
        serviceCentreNameTxtField.layer.borderColor = style.borderColor
        serviceCentreNameTxtField.font = style.editCarTextFieldFont
        serviceCentreNameTxtField.addTarget(self, action: #selector(serviceCentCheck), for: .editingChanged)
        serviceCentreNameTxtField.backgroundColor = UIColor.white
        serviceCentreNameTxtField.keyboardType = .namePhonePad
        serviceCentreNameTxtField.returnKeyType = .done
        serviceCentreNameTxtField.delegate = self
        serviceCentreNameTxtField.placeholder = "SERVICE CENTER"
        serviceCentreNameTxtField.isUserInteractionEnabled = true
        mainView.addSubview(serviceCentreNameTxtField)
        serviceCentreNameTxtField.autoPinEdge(.top, to: .bottom, of: headerLabel, withOffset: 30)
        serviceCentreNameTxtField.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        serviceCentreNameTxtField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        NSLayoutConstraint.autoSetPriority(1000.0) {
            serviceCentreNameTxtField.contentCompressionResistancePriority(for: .vertical)
        }
        
        checkMark3 = shapes.drawShapes(view, type: "checkMark")
        checkMark3.isHidden = true
        mainView.addSubview(checkMark3)
        checkMark3.autoSetDimension(.height, toSize: 30.0)
        checkMark3.autoPinEdge(toSuperviewEdge: .leading, withInset: 0.0)
        checkMark3.autoPinEdge(.right, to: .left, of: nameTextField, withOffset: 1.0)
        

        
                nameTextField.layer.borderWidth = 1.0
                nameTextField.font = style.editCarTextFieldFont
                nameTextField.layer.borderColor = style.borderColor
                nameTextField.addTarget(self, action: #selector(nameCheck), for: .editingChanged)
                nameTextField.backgroundColor = UIColor.white
                nameTextField.keyboardType = .namePhonePad
                nameTextField.returnKeyType = .done
                nameTextField.delegate = self
        nameTextField.placeholder = "NAME"
        nameTextField.isUserInteractionEnabled = true
                mainView.addSubview(nameTextField)
        nameTextField.autoPinEdge(.top, to: .bottom, of: serviceCentreNameTxtField, withOffset: 30)
        nameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        nameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        NSLayoutConstraint.autoSetPriority(1000.0) {
            nameTextField.contentCompressionResistancePriority(for: .vertical)
        }
        
                checkMark = shapes.drawShapes(view, type: "checkMark")
                checkMark.isHidden = true
                mainView.addSubview(checkMark)
        checkMark.autoSetDimension(.height, toSize: 30.0)
        checkMark.autoPinEdge(toSuperviewEdge: .leading, withInset: 0.0)
        checkMark.autoPinEdge(.right, to: .left, of: nameTextField, withOffset: 1.0)
        
                mobileNumberTextField.layer.borderWidth = 1.0
                mobileNumberTextField.font = style.editCarTextFieldFont
                mobileNumberTextField.keyboardType = .numberPad
                mobileNumberTextField.layer.borderColor = style.borderColor
                mobileNumberTextField.backgroundColor = UIColor.white
                mobileNumberTextField.addTarget(self, action: #selector(mobileCheck), for: .editingChanged)
                mobileNumberTextField.delegate = self
        mobileNumberTextField.placeholder = "MOBILE"
        mobileNumberTextField.isUserInteractionEnabled = true
                mainView.addSubview(mobileNumberTextField)
        mobileNumberTextField.autoPinEdge(.top, to: .bottom, of: nameTextField, withOffset: 30)
        mobileNumberTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        mobileNumberTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        NSLayoutConstraint.autoSetPriority(1000.0) {
            mobileNumberTextField.contentCompressionResistancePriority(for: .vertical)
        }
        
                checkMark1 = shapes.drawShapes(view, type: "checkMark")
                checkMark1.isHidden = true
                mainView.addSubview(checkMark1)
        checkMark1.autoSetDimension(.height, toSize: 30.0)
        checkMark1.autoPinEdge(toSuperviewEdge: .leading, withInset: 0.0)
        checkMark1.autoPinEdge(.right, to: .left, of: mobileNumberTextField, withOffset: 1.0)
        
                emailTextField.layer.borderWidth = 1.0
                emailTextField.font = style.editCarTextFieldFont
                emailTextField.layer.borderColor = style.borderColor
                emailTextField.addTarget(self, action: #selector(emailCheck), for: .editingChanged)
                emailTextField.backgroundColor = UIColor.white
                emailTextField.keyboardType = .emailAddress
                emailTextField.returnKeyType = .done
                emailTextField.autocapitalizationType = .none
                emailTextField.delegate = self
        emailTextField.placeholder = "EMAIL"
        emailTextField.isUserInteractionEnabled = true
                mainView.addSubview(emailTextField)
        emailTextField.autoPinEdge(.top, to: .bottom, of: mobileNumberTextField, withOffset: 30)
        emailTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        emailTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        NSLayoutConstraint.autoSetPriority(1000.0) {
            emailTextField.contentCompressionResistancePriority(for: .vertical)
        }
        
                checkMark2 = shapes.drawShapes(view, type: "checkMark")
                checkMark2.isHidden = true
                mainView.addSubview(checkMark2)
        checkMark2.autoSetDimension(.height, toSize: 30.0)
        checkMark2.autoPinEdge(toSuperviewEdge: .leading, withInset: 0.0)
        checkMark2.autoPinEdge(.right, to: .left, of: emailTextField, withOffset: 1.0)
        
                mainView.isUserInteractionEnabled = true
                let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                mainView.addGestureRecognizer(tapOnView)
        
                NotificationCenter.default.addObserver(self, selector: #selector(check), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(cancelClicked), name: NSNotification.Name(rawValue: "APPLEADS"), object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(networkStatus), name: NSNotification.Name(rawValue: "NetworkStatus"), object: nil)
                addDoneButtonOnKeyboard()
    }
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        //        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(hideKeyboard))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        //        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.mobileNumberTextField.inputAccessoryView = doneToolbar
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //        hideKeyboard()
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
        func nameCheck(){
            if((nameTextField.text?.count)! > 2){
                checkMark.isHidden = false
            }
            else{
                checkMark.isHidden = true
            }
        }
        func emailCheck(){
            if(isValidEmail(emailTextField.text!) == true){
                checkMark2.isHidden = false
            }
            else{
                checkMark2.isHidden = true
            }
        }
        func mobileCheck(){
            if(mobileNumberTextField.text!.count == 10){
                checkMark1.isHidden = false
            }
            else{
                checkMark1.isHidden = true
            }
        }
        func serviceCentCheck(){
            if((serviceCentreNameTxtField.text?.count)! > 2){
                checkMark3.isHidden = false
            }
            else{
                checkMark3.isHidden = true
            }
        }
    
        func isValidEmail(_ testStr:String) -> Bool {
            // print("validate calendar: \(testStr)")
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: testStr)
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
        var networkView  = UIView()
        func networkStatus(_ notification: Notification){
            let check = (notification as NSNotification).userInfo!["check"] as! String
    
            print(check)
            if(check == "0"){//server down
                if(networkView.isDescendant(of: view)){
    
                }
                else{
                    networkView = loadingPageClass.networkIssue(view1: view, width: superViewWidth!)
                    view.addSubview(networkView)
                    animateViewMoving1(false, moveValue: 100)
                }
            }
            else if(check == "1"){// server running
                //            if(networkView.isDescendant(of: view)){
                animateViewMoving1(true, moveValue: 100)
                networkView.removeFromSuperview()
                //            }
            }
        }
        func animateViewMoving1 (_ up:Bool, moveValue :CGFloat){
    
            let movementDuration:TimeInterval = 0.3
            //        let movement:CGFloat = ( up ? -move1 : move1)
            let movementForChatBox = (up ? -moveValue : moveValue)
            UIView.beginAnimations( "animateView", context: nil)
            UIView.setAnimationBeginsFromCurrentState(true)
            UIView.setAnimationDuration(movementDuration )
    
            self.networkView.frame = self.networkView.frame.offsetBy(dx: 0,  dy: movementForChatBox)
    
    
            //        self.chatBox.frame = self.chatBox.frame.offsetBy(dx: 0, dy: movementForChatBox)
            UIView.commitAnimations()
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
    
        func sendButtonClicked(){
            if(cancelCheck == 1){
                if(mobileNumberTextField.text?.count == 10){
                    if(isValidEmail(emailTextField.text!) == true){
                        let str = "APPLEADS!" + nameTextField.text! + split + mobileNumberTextField.text! + split + emailTextField.text! + split + split + " " + split + "1" + split
                        passData.dataCheck(str)
                    }
                    else{
                        showAlert(dataToShow: "Please Enter Valid Email")
                    }
                }
                else{
                    showAlert(dataToShow: "Mobile Number Should Have 10 Digits")
                }
            }
        }
    
    func showAlert(dataToShow: String){
                let alert = UIAlertController(title: "21North", message: dataToShow, preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
    
    func cancelClicked(){
                passData.clickTrack(dataString: "59")
                self.dismiss(animated: true, completion: nil)
            }
    
        func hideKeyboard(){
    
            view.endEditing(true)
        }
}

