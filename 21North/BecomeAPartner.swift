//
//  BecomeAPartner.swift
//  21North
//
//  Created by Sachin Tomar on 12/08/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit

class BecomeAPartner: UIViewController {
    
    let drawservicing = drawServicing()
    let passData = PassData()
    let shapes = Shapes()
    let style = Style()
    
    var width: CGFloat!
    var height: CGFloat!
    
    var backButtonImage = UIImageView()
    var backButton = UIButton()
    var headingLabel: UILabel!
    var nameTextField: UITextField!
    var mobileNumberTextField: UITextField!
    var emailTextField: UITextField!
    var sendButton = UIButton()
    var serviceCentreNameTxtField: UITextField!
    
    var updateButton = UIButton()
    var profileImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.userInteractionEnabled = true
        view.addGestureRecognizer(tapOnView)
        
        width = UIScreen.mainScreen().bounds.width
        height = UIScreen.mainScreen().bounds.height
//
//        backButtonImage = shapes.drawShapes(view, type: "back")
//        backButtonImage.translatesAutoresizingMaskIntoConstraints = true
//        backButtonImage.frame = CGRectMake(6, 22, 25, 25)
//        view.addSubview(backButtonImage)
//        
//        backButton = UIButton(frame: CGRectMake(10, 20, 60, 20))
//        backButton.setTitle("Back", forState: .Normal)
//        backButton.titleLabel?.textColor = UIColor.whiteColor()
//        backButton.addTarget(self, action: #selector(back_btn_clicked), forControlEvents: .TouchUpInside)
//        view.addSubview(backButton)
//        
//        headingLabel = drawservicing.makeLabel("Become a Partner", screenWidth: width, heading: "mainHeading")
//        headingLabel.font = UIFont(name: "HelveticaNeue-Bold", size:16)
//        headingLabel.translatesAutoresizingMaskIntoConstraints = false
//        headingLabel.textColor = UIColor(red: 242.0/255.0, green: 103.0/255.0, blue: 33.0/255.0, alpha: 1.0)
//        view.addSubview(headingLabel)
//        
//        let line1 = (drawservicing.drawLine(0, y: 0, width: width-CGFloat(2*23), color: "setting"))
//        headingLabel.layer.addSublayer(line1)
        
        updateButton.setTitle("SAVE", forState: .Normal)
        updateButton.titleLabel?.font = UIFont(name: "HelveticaNeue-bold", size:14)
        updateButton.setTitleColor(drawservicing.lineColor, forState: .Normal)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.titleLabel?.adjustsFontSizeToFitWidth = true
        updateButton.addTarget(self, action: #selector(sendButtonClicked), forControlEvents: .TouchUpInside)
        view.addSubview(updateButton)
        
        let cross = shapes.drawShapes(view, type: "cross")
        cross.userInteractionEnabled = true
        let tapOnCross = UITapGestureRecognizer(target: self, action: #selector(back_btn_clicked))
        cross.addGestureRecognizer(tapOnCross)
        view.addSubview(cross)
        
        view.addConstraintsWithFormat("H:|-14-[v0]", views: cross)
        view.addConstraintsWithFormat("V:|-23-[v0]", views: cross)
        view.addConstraintsWithFormat("H:[v0(38)]-16-|", views: updateButton)
        view.addConstraintsWithFormat("V:|-25-[v0(18)]", views: updateButton)
        
        profileImageView.layer.cornerRadius = 41
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = UIColor.grayColor()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        let becomePartnerView = UIView()
        becomePartnerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(becomePartnerView)
        view.addConstraintsWithFormat("H:|[v0]|", views: becomePartnerView)
        
        let driveWithLabel = drawservicing.makeLabel("Drive with 21North", screenWidth: width, heading: "subHeading")
        driveWithLabel.font = style.editCarTextFieldFont
        driveWithLabel.textColor = style.labelFontColor
        becomePartnerView.addSubview(driveWithLabel)
        becomePartnerView.addConstraintsWithFormat("H:|-16-[v0]", views: driveWithLabel)
        
        serviceCentreNameTxtField = drawservicing.drawTextField("Service Centre Name")
        serviceCentreNameTxtField.layer.borderWidth = 1.0
        serviceCentreNameTxtField.layer.borderColor = style.borderColor
        serviceCentreNameTxtField.font = style.editCarTextFieldFont
        serviceCentreNameTxtField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        serviceCentreNameTxtField.backgroundColor = UIColor.whiteColor()
        serviceCentreNameTxtField.keyboardType = .NamePhonePad
        becomePartnerView.addSubview(serviceCentreNameTxtField)
        becomePartnerView.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: serviceCentreNameTxtField)
        
        nameTextField = drawservicing.drawTextField("Name")
        nameTextField.layer.borderWidth = 1.0
        nameTextField.font = style.editCarTextFieldFont
        nameTextField.layer.borderColor = style.borderColor
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        nameTextField.backgroundColor = UIColor.whiteColor()
        nameTextField.keyboardType = .NamePhonePad
        becomePartnerView.addSubview(nameTextField)
        becomePartnerView.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: nameTextField)
        
        mobileNumberTextField = drawservicing.drawTextField("Mobile Number")
        mobileNumberTextField.layer.borderWidth = 1.0
        mobileNumberTextField.font = style.editCarTextFieldFont
        mobileNumberTextField.layer.borderColor = style.borderColor
        mobileNumberTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        mobileNumberTextField.keyboardType = .NumberPad
        mobileNumberTextField.backgroundColor = UIColor.whiteColor()
        becomePartnerView.addSubview(mobileNumberTextField)
        becomePartnerView.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: mobileNumberTextField)
        
        emailTextField = drawservicing.drawTextField("Email")
        emailTextField.layer.borderWidth = 1.0
        emailTextField.font = style.editCarTextFieldFont
        emailTextField.layer.borderColor = style.borderColor
        emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        emailTextField.backgroundColor = UIColor.whiteColor()
        emailTextField.keyboardType = .EmailAddress
        becomePartnerView.addSubview(emailTextField)
        becomePartnerView.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: emailTextField)
        
        becomePartnerView.addConstraintsWithFormat("V:|[v0]-16-[v1(33)]-27-[v2(33)]-27-[v3(33)]-27-[v4(33)]", views: driveWithLabel, serviceCentreNameTxtField,nameTextField, mobileNumberTextField, emailTextField)
        view.addConstraintsWithFormat("V:|-72-[v0(82)]-43-[v1]", views: profileImageView, becomePartnerView)
//        sendButton.setTitle("Send", forState: .Normal)
//        sendButton.backgroundColor = UIColor(red: 242.0/255.0, green: 103.0/255.0, blue: 33.0/255.0, alpha: 1.0)
//        sendButton.translatesAutoresizingMaskIntoConstraints = false
//        sendButton.addTarget(self, action: #selector(sendButtonClicked), forControlEvents: .TouchUpInside)
//        sendButton.titleLabel?.font = UIFont(name: "AspiraWide-Bold", size: 10)
//        view.addSubview(sendButton)
        
        let viewsDictionary = ["profileImageView": profileImageView]
        let profileGap = (width-82)/2
        let metric = ["profileGap": profileGap]
        
        let profileImgaeHorConst: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-profileGap-[profileImageView(82)]-profileGap-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric, views: viewsDictionary)
        view.addConstraints(profileImgaeHorConst as! [NSLayoutConstraint])
        
//        let viewsDictionary = ["headingLabel": headingLabel, "serviceCentreNameTxtField": serviceCentreNameTxtField, "nameTextField": nameTextField, "mobileNumberTextField": mobileNumberTextField, "emailTextField":emailTextField, "sendButton": sendButton]
//        let viewVerConst: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-50-[headingLabel]-45-[serviceCentreNameTxtField(33)]-15-[nameTextField(33)]-15-[mobileNumberTextField(33)]-15-[emailTextField(33)]-25-[sendButton(23)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
//        view.addConstraints(viewVerConst as! [NSLayoutConstraint])
//        
//        let headingLabelHorConst: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-23-[headingLabel]-23-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
//        view.addConstraints(headingLabelHorConst as! [NSLayoutConstraint])
//        
//        let serviceCentreTextFieldHorConst: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-23-[serviceCentreNameTxtField]-23-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
//        view.addConstraints(serviceCentreTextFieldHorConst as! [NSLayoutConstraint])
//        
//        let nameTextFieldHorConst: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-23-[nameTextField]-23-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
//        view.addConstraints(nameTextFieldHorConst as! [NSLayoutConstraint])
//        
//        let mobileNumberTextFieldHorConst: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-23-[mobileNumberTextField]-23-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
//        view.addConstraints(mobileNumberTextFieldHorConst as! [NSLayoutConstraint])
//        
//        let emailTextFieldHorConst: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-23-[emailTextField]-23-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
//        view.addConstraints(emailTextFieldHorConst as! [NSLayoutConstraint])
//        
//        let sendButttonHorConst: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-23-[sendButton(72)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
//        view.addConstraints(sendButttonHorConst as! [NSLayoutConstraint])
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(partnerID), name: "PARTNERLEADID", object: nil)

    }

    func back_btn_clicked(){
        self.presentViewController(Partner(), animated: true, completion: nil)
    }
    func sendButtonClicked(){
        if(serviceCentreNameTxtField.text?.characters.count == 0){
            serviceCentreNameTxtField.layer.borderWidth = 2.0
            serviceCentreNameTxtField.layer.borderColor = UIColor.redColor().CGColor
        }
        else if(nameTextField.text?.characters.count == 0){
            nameTextField.layer.borderWidth = 2.0
            nameTextField.layer.borderColor = UIColor.redColor().CGColor
        }
        else if(mobileNumberTextField.text?.characters.count == 0){
            mobileNumberTextField.layer.borderColor = UIColor.redColor().CGColor
            mobileNumberTextField.layer.borderWidth = 2.0
        }
        else if(emailTextField.text?.characters.count == 0){
            emailTextField.layer.borderWidth = 2.0
            emailTextField.layer.borderColor = UIColor.redColor().CGColor
        }
        else{
            let str1 = "PARTNERLEAD!" + serviceCentreNameTxtField.text! + "|" + nameTextField.text! + "|"
            let str2 = mobileNumberTextField.text! + "|" + emailTextField.text! + "|"
            let str = str1 + str2
            passData.dataCheck(str)
        }
    }
    func partnerID(notification: NSNotification){
        let pin = notification.userInfo!["PARTNERLEADID"] as! String
        let data = pin.characters.split("$").map(String.init)
        let partnerID1 = Int(data[0])
        if(partnerID1 > 0){
            self.presentViewController(ViewController(), animated: true, completion: nil)
        }
    }
    func hideKeyboard(){
        view.endEditing(true)
    }
}
