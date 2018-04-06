//
//  FeedBack.swift
//  21North
//
//  Created by Sachin Tomar on 04/10/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation

class FeedBack:BaseViewController, SocketManagerDelegate12{
    
    let drawservicing = DrawServicing()
    let shapes = Shapes()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var width: CGFloat!
    var height: CGFloat!
    
    let helpNumberLabel = UILabel()
    let feedBackTextView = UITextView()
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: UI setup
    func setupUI(){
        DataCreator.sharedInstance.currentScreen = ""
        appdelegate.conn.delegate12 = self
        
        view.backgroundColor = UIColor.white
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        
        let cross = shapes.drawShapes(type: "cross")
        let closeButtonItem = NavigationItemModel(title: nil, image: cross, highlitedImage: nil, action: #selector(cancelButtonClicked), type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        let saveButtonItem = NavigationItemModel(title: "SAVE", image: nil, highlitedImage: nil, action: #selector(saveButtonClicked), type: NavigationItemType.titleOnly)
        titleFont = UIFont(name: "HelveticaNeue-bold", size:14)!
        titleColor = drawservicing.lineColor
        setRightButtonItems(saveButtonItem)
        
        let logo = shapes.drawLogo()
        view.addSubview(logo)
        logo.autoSetDimension(.width, toSize: 103.0)
        logo.autoPinEdge(toSuperviewEdge: .top, withInset: navigationHeight+50.0)
        logo.autoAlignAxis(.vertical, toSameAxisOf: self.view, withOffset: 0.0)
        logo.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        helpNumberLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 36)
        helpNumberLabel.textColor = UIColor(red: 158/255.0, green: 158/255.0, blue: 158/255.0, alpha: 1.0)
        helpNumberLabel.textAlignment = .center
        helpNumberLabel.numberOfLines = 0
        helpNumberLabel.isUserInteractionEnabled = true
        let tapOnNumber = UITapGestureRecognizer(target: self, action: #selector(callHelpNumber))
        helpNumberLabel.addGestureRecognizer(tapOnNumber)
        helpNumberLabel.text = DataCreator.sharedInstance.loginResponse.support
        view.addSubview(helpNumberLabel)
        helpNumberLabel.autoPinEdge(.top, to: .bottom, of: logo, withOffset: 40.0)
        helpNumberLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        helpNumberLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        helpNumberLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        let feedbackLabel = UILabel()
        feedbackLabel.text = NSLocalizedString("FeedbackText", comment: "")
        feedbackLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 20)
        feedbackLabel.textColor = UIColor(red: 158/255.0, green: 158/255.0, blue: 158/255.0, alpha: 1.0)
        view.addSubview(feedbackLabel)
        feedbackLabel.autoPinEdge(.top, to: .bottom, of: helpNumberLabel, withOffset: 30.0)
        feedbackLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        feedbackLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        feedbackLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        view.addSubview(feedBackTextView)
        let borderColor = UIColor(red: 162/255.0, green: 162/255.0, blue: 162/255.0, alpha: 1.0).cgColor
        feedBackTextView.layer.borderWidth = 1
        feedBackTextView.layer.borderColor = borderColor
        feedBackTextView.autoPinEdge(.top, to: .bottom, of: feedbackLabel, withOffset: 10.0)
        feedBackTextView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        feedBackTextView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        feedBackTextView.autoSetDimension(.height, toSize: 100.0)
        
        view.isUserInteractionEnabled = true
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapOnView)
        
        addDoneButtonOnKeyboard()
    }
    
    //MARK: Keyboard handling
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
        
        self.feedBackTextView.inputAccessoryView = doneToolbar
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    var keyboardHeight: CGFloat!
    func keyboardHide(){
        if(keyboardHeight != nil){
            animateViewMoving(false, moveValue: keyboardHeight-50)
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
    
    //MARK: Action handling
    @objc func callHelpNumber() {
        Helper.callNumber(helpNumberLabel.text!)
    }
    
    @objc func saveButtonClicked(){
        if(feedBackTextView.text.count>0){
            appdelegate.conn.send("\(Constants.RequestStates.Feedback)|\(feedBackTextView.text!)|")
        }
        cancelButtonClicked()
    }
    
    @objc func cancelButtonClicked(){
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
    
    //Socket delegate
    func dismissHelpScreen(){
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
}

