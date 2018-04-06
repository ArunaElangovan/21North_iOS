//
//  RequestRSA.swift
//  21North
//
//  Created by Sachin Tomar on 22/08/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit
import GoogleMaps

@objc protocol RequestingScreenVCDelegate{
    func dismissBookingFormVC()
}

class RequestingScreen: UIViewController, SocketManagerDelegate15{
    let drawservicing = DrawServicing()
    let shapes = Shapes()
    let style = Style()
    var requestingScreenVCDelegate: RequestingScreenVCDelegate?
    let awaitingAnimation = Awaiting()
    let requestingTimer = UILabel()
    let cancelbuttonReq = UIButton()
    let headingLabelReq = UILabel()
    var okButton = UIButton()
    var labelText: String!
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var width: CGFloat!
    var height: CGFloat!
    var cancelReasonId = ""
    var intialTimerValue:Int!
    var timerUpdate = Timer()
    var timeOut = Int()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    //UI setup
    func setupUI(){
        appdelegate.conn.delegate15 = self
        
        intialTimerValue = Int(DataCreator.sharedInstance.waitTimeForRequest.wait_time)
        timeOut = intialTimerValue
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        awaitingAnimation.frame = CGRect(x: 0, y: (height-2)/2, width: width, height: 2)
        view.addSubview(awaitingAnimation)
        awaitingAnimation.addUntitled1Animation()
        let homePageIcon = HomePageIcon()
        
        cancelbuttonReq.setImage(homePageIcon.editIcon("cancelButton"), for: .normal)
        cancelbuttonReq.frame = CGRect(x: (width-42)/2, y: (height-42)/2, width: 42, height: 42)
        cancelbuttonReq.backgroundColor = UIColor.black
        cancelbuttonReq.layer.cornerRadius = 21
        cancelbuttonReq.isHidden = false
        cancelbuttonReq.clipsToBounds = true
        cancelbuttonReq.addTarget(self, action: #selector(confirmCancelClicked), for: .touchUpInside)
        view.addSubview(cancelbuttonReq)
        
        requestingTimer.frame = CGRect(x: 0, y: (height-42)/2+60, width: width, height: 18)
        requestingTimer.text = "00:" + "\(timeOut)"
        requestingTimer.textAlignment = .center
        requestingTimer.textColor = UIColor.white
        requestingTimer.isHidden = false
        view.addSubview(requestingTimer)
        
        timerUpdate = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        headingLabelReq.frame = CGRect(x: 0, y: (height-42)/2-40, width: width, height: 19)
        headingLabelReq.textAlignment = .center
        headingLabelReq.text = labelText
        headingLabelReq.font = UIFont(name: "HelveticaNeue", size: 15)
        headingLabelReq.textColor = UIColor.white
        view.addSubview(headingLabelReq)
        
        okButton.setTitle("OK", for: .normal)
        okButton.frame = CGRect(x: (width-42)/2, y: (height-42)/2, width: 42, height: 42)
        okButton.backgroundColor = style.editCarButtonFontColor
        okButton.layer.cornerRadius = 21
        okButton.clipsToBounds = true
        okButton.addTarget(self, action: #selector(hideRequestingView), for: .touchUpInside)
        okButton.isHidden = true
        view.addSubview(okButton)
    }
    
    //Timer handling
    @objc func countDown(){
        timeOut = timeOut - 1
        if(timeOut<10){
            requestingTimer.text = "00:0" + "\(timeOut)"
        }
        else{
            requestingTimer.text = "00:" + "\(timeOut)"
        }
        if(timeOut == 0){
            timerUpdate.invalidate()
            cancelBooking()
        }
    }
    
    //Action handling
    @objc func cancelBooking(){
        timerUpdate.invalidate()
        timeOut = intialTimerValue
        headingLabelReq.text = NSLocalizedString("Booking Cancelled", comment: "")
        okButton.isHidden = false
        cancelbuttonReq.isHidden = true
        requestingTimer.isHidden = true
        appdelegate.conn.send("\(Constants.RequestStates.CancelBooking)|\(DataCreator.sharedInstance.currentBookingId)|\(cancelReasonId)|")
    }
    
    @objc func confirmCancelClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        let alertController = UIAlertController(title: "21North", message: NSLocalizedString("Are you sure you want to cancel?", comment: ""), preferredStyle: .actionSheet)
        for i in 0 ..< DataCreator.sharedInstance.cancelReasons.count {
            let reasonDesc = UIAlertAction(title: DataCreator.sharedInstance.cancelReasons[i].cancelreason, style: .default, handler: {
                action in
                self.cancelReasonId = DataCreator.sharedInstance.cancelReasons[i].id
                self.cancelBooking()
            }
            )
            alertController.addAction(reasonDesc)
        }
        
        let defaultAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func hideRequestingView(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func dismissRequestingVC(){
        //        self.dismiss(animated: true, completion: nil)
        hideRequestingView()
        requestingScreenVCDelegate?.dismissBookingFormVC()
        
        //        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
}
