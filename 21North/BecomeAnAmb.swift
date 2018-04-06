//
//  BecomeAnAmb.swift
//  21North
//
//  Created by Sachin Tomar on 12/08/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit

class BecomeAnAmb: UIViewController {
    
    let shapes = Shapes()
    let drawservicing = drawServicing()
    let passData = PassData()
    let style = Style()
    let delegate = UIApplication.sharedApplication().delegate as! AppDelegate

    var width: CGFloat!
    var height: CGFloat!
    
    let profileImageView = UIImageView()
    var nameTextField: UITextField!
    var mobileNumberTextField: UITextField!
    var emailTextField: UITextField!
    var updateButton = UIButton()
    let ambassadorView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        width = UIScreen.mainScreen().bounds.width
        height = UIScreen.mainScreen().bounds.height
        
        view.backgroundColor = UIColor.whiteColor()
        
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
        
        ambassadorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ambassadorView)
        view.addConstraintsWithFormat("H:|[v0]|", views: ambassadorView)
        
        let driveWithLabel = drawservicing.makeLabel("Drive with 21North", screenWidth: width, heading: "subHeading")
        driveWithLabel.font = style.editCarTextFieldFont
        driveWithLabel.textColor = style.labelFontColor
        ambassadorView.addSubview(driveWithLabel)
        ambassadorView.addConstraintsWithFormat("H:|-16-[v0]", views: driveWithLabel)
        
        nameTextField = drawservicing.drawTextField("Name")
        nameTextField.layer.borderWidth = 1.0
        nameTextField.font = style.editCarTextFieldFont
        nameTextField.layer.borderColor = style.borderColor
        nameTextField.backgroundColor = UIColor.whiteColor()
        nameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        nameTextField.keyboardType = .NamePhonePad
        ambassadorView.addSubview(nameTextField)
        ambassadorView.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: nameTextField)
        
        mobileNumberTextField = drawservicing.drawTextField("Mobile Number")
        mobileNumberTextField.layer.borderWidth = 1.0
        mobileNumberTextField.font = style.editCarTextFieldFont
        mobileNumberTextField.keyboardType = .NumberPad
        mobileNumberTextField.layer.borderColor = style.borderColor
        mobileNumberTextField.backgroundColor = UIColor.whiteColor()
        mobileNumberTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        ambassadorView.addSubview(mobileNumberTextField)
        ambassadorView.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: mobileNumberTextField)
        
        emailTextField = drawservicing.drawTextField("Email")
        emailTextField.layer.borderWidth = 1.0
        emailTextField.font = style.editCarTextFieldFont
        emailTextField.layer.borderColor = style.borderColor
        emailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        emailTextField.backgroundColor = UIColor.whiteColor()
        emailTextField.keyboardType = .EmailAddress
        ambassadorView.addSubview(emailTextField)
        ambassadorView.addConstraintsWithFormat("H:|-16-[v0]-16-|", views: emailTextField)
        
        let viewsDictionary = ["profileImageView": profileImageView]
        let profileGap = (width-82)/2
        let metric = ["profileGap": profileGap]
        
        let profileImgaeHorConst: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-profileGap-[profileImageView(82)]-profileGap-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric, views: viewsDictionary)
        view.addConstraints(profileImgaeHorConst as! [NSLayoutConstraint])
        
        ambassadorView.addConstraintsWithFormat("V:|[v0]-16-[v1(33)]-27-[v2(33)]-27-[v3(33)]", views: driveWithLabel, nameTextField, mobileNumberTextField, emailTextField)
        view.addConstraintsWithFormat("V:|-72-[v0(82)]-43-[v1]|", views: profileImageView, ambassadorView)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ambLeadAddes), name: "AMBLEADID", object: nil)
    }
    func back_btn_clicked(){
        self.presentViewController(Partner(), animated: true, completion: nil)
    }
    func sendButtonClicked(){
        if(nameTextField.text?.characters.count == 0){
            nameTextField.layer.borderWidth = 2.0
            nameTextField.layer.borderColor = UIColor.redColor().CGColor
            nameTextField.placeholder = "Please enter name"
        }
        else if(mobileNumberTextField.text?.characters.count == 0){
            mobileNumberTextField.layer.borderWidth = 2.0
            mobileNumberTextField.layer.borderColor = UIColor.redColor().CGColor
            mobileNumberTextField.placeholder = "Enter Number"
        }
        else if(emailTextField.text?.characters.count == 0){
            emailTextField.layer.borderWidth = 2.0
            emailTextField.layer.borderColor = UIColor.redColor().CGColor
            emailTextField.placeholder = "Enter Email"
        }
        else{
            let str1 = "NEWAMB!" + nameTextField.text! + "|" + mobileNumberTextField.text! + "|"
            let str2 = emailTextField.text! + "|"
            let str = str1 + str2
            
            passData.dataCheck(str)
        }
    
    }
    func ambLeadAddes(notification: NSNotification){
        let pin = notification.userInfo!["AMBLEADID"] as! String
        let data = pin.characters.split("$").map(String.init)
        let ambID = Int(data[0])
        if(ambID > 0){
            self.presentViewController(ViewController(), animated: true, completion: nil)
        }
    }


}
