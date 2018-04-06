////
////  RequestChauffer.swift
////  21North
////
////  Created by Sachin Tomar on 18/08/16.
////  Copyright © 2016 Sachin Tomar. All rights reserved.
////
//
//import UIKit
//import GoogleMaps
//
//class RequestChauffer: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate, UITextViewDelegate{
//    
//    var width: CGFloat!
//    var height: CGFloat!
//
//    let drawservicing = DrawServicing()
//    let constraints = Constraints()
//    let shapes = Shapes()
//    let passData = PassData()
//    let loadingPageClass = LoadingPage()
//    let style = Style()
//    
//    var carNumberValue:String!
//    let delegate = UIApplication.shared.delegate as! AppDelegate
//    var backButtonImage = UIImageView()
//    var backButton = UIButton()
//    var headingLabel: UILabel!
//    var pickupLocLabel: UILabel!
//    var dropLocLabel: UILabel!
//    var hourPickerView = UIPickerView()
//    var amountLabel = UILabel()
//    var approxHourLabel: UILabel!
//    var estimateFeeLabel = UILabel()
//    var hoursArray = [1, 2, 3, 4, 5, 6]
//    var latLong: String!
//    var dropLatLong: String!
//    
//    let locationManager = CLLocationManager()
//    
//    var hoursView = UIView()
//    var navigationBar = UINavigationBar()
//    var etaTimeLabel = UILabel()
//    
//    var mainView1 = UIView()
//    var pickupLat: Double!
//    var pickupLong: Double!
//    
//    var dropLat: Double!
//    var dropLong: Double!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        width = UIScreen.main.bounds.width
//        height = UIScreen.main.bounds.height
//        
//        let header = drawservicing.drawHeader()
//        header.image = UIImage(named: "Home-Chauffeur")
//        view.addSubview(header)
//        
//        view.backgroundColor = UIColor(red: 215.0/255.0, green: 213.0/255.0, blue: 213.0/255.0, alpha: 1.0)
//        
//        carNumberValue = delegate.selectedCarNumber
//        
//        let carNumber = drawservicing.makeLabel(carNumberValue, screenWidth: width!, heading: "mainHeading")
//        carNumber.textAlignment = .center
//        header.addSubview(carNumber)
//        
//        constraints.labelConstraints(carNumber, view1: header, labelType: "carConstraints")
//        
//        let serviceLabel = drawservicing.makeLabel("Chauffeur Service", screenWidth: width!, heading: "serviceName")
//        serviceLabel.textAlignment = .center
//        header.addSubview(serviceLabel)
//        
//        constraints.labelConstraints(serviceLabel, view1: header, labelType: "serviceName")
//        
//        let backButton1 = shapes.drawShapes(view, type: "backButton")
//        backButton1.isUserInteractionEnabled = true
//        backButton1.translatesAutoresizingMaskIntoConstraints = false
//        let tapOnBack = UITapGestureRecognizer(target: self, action: #selector(back_btn_clicked))
//        backButton1.addGestureRecognizer(tapOnBack)
//        view.addSubview(backButton1)
//        
//        view.addConstraintsWithFormat("H:|[v0]", views: backButton1)
//        view.addConstraintsWithFormat("V:|-5-[v0]", views: backButton1)
//        
//        switch delegate.currentScreenNo {
//        case -1:
//            requestChauffeur(check: 0)
//            break
//        case 20:
//            requestChauffeur(check: 0)
//            break
//            
//        case 21:
//            etaTimeInterval = delegate.refreshData[safe: 37]!
//            enrouteChauffer(check: 0)
//            
//            break
//        case 22:
//            etaTimeInterval = delegate.refreshData[safe: 37]!
//            enrouteChauffer(check: 0)
//            break
//            
//        case 23:
//            etaTimeInterval = delegate.refreshData[safe: 37]!
//            enrouteChauffer(check: 0)
//            break
//        case 24:
//            chauffeurServiceCompleted(check: 0)
//            break
//        case 25:
//            chauffeurFeedback(check: 0)
//            break
//        default:
//            dismiss(animated: true, completion: nil)
//        }
//        
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(mapLocationSet), name: NSNotification.Name(rawValue: "Location"), object: nil)
////        NotificationCenter.default.addObserver(self, selector: #selector(onLoad), name: NSNotification.Name(rawValue: "PICKUPDATA2"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(refreshData), name: NSNotification.Name(rawValue: "20"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(refreshData), name: NSNotification.Name(rawValue: "21"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(refreshData), name: NSNotification.Name(rawValue: "22"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(refreshData), name: NSNotification.Name(rawValue: "23"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(refreshData), name: NSNotification.Name(rawValue: "24"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(refreshData), name: NSNotification.Name(rawValue: "25"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(bookingData), name: NSNotification.Name(rawValue: "BOOKINGDATA"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(ratingUpdate), name: NSNotification.Name(rawValue: "UPDATERATING"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(updateETA), name: NSNotification.Name(rawValue: "REFRESHETACHAF"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(networkStatus), name: NSNotification.Name(rawValue: "NetworkStatus"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(cancelConfirm), name: NSNotification.Name(rawValue: "CANCELBOOKING"), object: nil)
//    }
//    var feedbackCheck = 0
//    func updateETA(notification: Notification){
//        let pin = notification.userInfo!["REFRESHETACHAF"] as! String
//        let firstBrk = pin.characters.split(separator: "^").map(String.init)
//        let secBrk = firstBrk[safe: 0]!.characters.split(separator: "|").map(String.init)
//        let thirdBrk = secBrk[safe: 0]!.characters.split(separator: "$").map(String.init)
//        let EditText = thirdBrk[safe: 2]!
//        if(delegate.currentScreenNo == 20){
//            if(EditText == "-1"){
//                etaTimeLabel.text = "Chuffeur Not Available"
//                reqChauffeurButton.isEnabled = false
//                reqChauffeurButton.setTitle("Chauffeur Not Available", for: .normal)
//            }
//            else{
//                etaTimeLabel.text = EditText + " minutes"
//                reqChauffeurButton.isEnabled = true
//                reqChauffeurButton.setTitle("REQUEST CHAUFFEUR", for: .normal)
//            }
//        }
//        else if(delegate.currentScreenNo == 21){
//            expectedTimeLabel.text = EditText
//        }
//        print(EditText)
//    }
//    let reqChauffeurButton = UIButton()
//    var promocode = UILabel()
//    var viewForPromoCode = UIView()
//    var verifyPromoLabel = UILabel()
//    var promoTextField = UITextField()
//    
//    func requestChauffeur(check:CGFloat){
//        
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
//        locationManager.requestWhenInUseAuthorization()
//        
//        let reqScrollView = UIScrollView()
//        reqScrollView.showsHorizontalScrollIndicator = false
//        reqScrollView.showsVerticalScrollIndicator = false
//        reqScrollView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(reqScrollView)
//        
//        view.addConstraintsWithFormat("H:|[v0]|", views: reqScrollView)
//        view.addConstraintsWithFormat("V:|-100-[v0]|", views: reqScrollView)
//        
//        mainView1 = drawservicing.addView(1)
//        mainView1.translatesAutoresizingMaskIntoConstraints = false
//        mainView1.frame = CGRect(x: check, y: 0, width: width, height: 600)
//        reqScrollView.addSubview(mainView1)
//        
//        reqScrollView.addConstraintsWithFormat("H:|[v0(\(width!))]", views: mainView1)
//        reqScrollView.addConstraintsWithFormat("V:|[v0(600)]|", views: mainView1)
//        
//        let view1 = drawservicing.addView(1)
//        mainView1.addSubview(view1)
//        
//        let pickupLabel = drawservicing.makeLabel("Pickup Location", screenWidth: width!, heading: "heading")
//        view1.addSubview(pickupLabel)
//        
//        pickupLocLabel = drawservicing.makeLabel("Awaiting Pickup Location", screenWidth: width, heading: "subHeading")
//        pickupLabel.addSubview(pickupLocLabel)
//        
//        let line1 = (drawservicing.drawLine(0, y: 20, width: width, color: "service"))
//        pickupLocLabel.layer.addSublayer(line1)
//        
//        let pickLocIcon = shapes.drawShapes(view1, type: "locationIcon")
//        view1.addSubview(pickLocIcon)
//        
//        let touchView1 = drawservicing.touchView()
//        touchView1.isUserInteractionEnabled = true
//        let tapOnT1 = UITapGestureRecognizer(target: self, action: #selector(pickLoc))
//        touchView1.addGestureRecognizer(tapOnT1)
//        view1.addSubview(touchView1)
//        view1.addConstraintsWithFormat("H:|[v0]|", views: touchView1)
//        
//        let dropLabel = drawservicing.makeLabel("Dropoff Location", screenWidth: width!, heading: "heading")
//        pickupLocLabel.addSubview(dropLabel)
//        
//        dropLocLabel = drawservicing.makeLabel("Awaiting Dropoff Location", screenWidth: width, heading: "subHeading")
//        dropLabel.addSubview(dropLocLabel)
//        
//        let line2 = (drawservicing.drawLine(0, y: 20, width: width, color: "service"))
//        dropLocLabel.layer.addSublayer(line2)
//        
//        let dropLocIcon = shapes.drawShapes(view1, type: "locationIcon")
//        dropLocIcon.isUserInteractionEnabled = true
//        let tapOnDropOffIcon = UITapGestureRecognizer(target: self, action: #selector(dropOff))
//        dropLocIcon.addGestureRecognizer(tapOnDropOffIcon)
//        view1.addSubview(dropLocIcon)
//        
//        let touchView2 = drawservicing.touchView()
//        touchView2.isUserInteractionEnabled = true
//        let tapOnT2 = UITapGestureRecognizer(target: self, action: #selector(dropOff))
//        touchView2.addGestureRecognizer(tapOnT2)
//        view1.addSubview(touchView2)
//        view1.addConstraintsWithFormat("H:|[v0]|", views: touchView2)
//        
//        
//        view1.addConstraintsWithFormat("V:|[v0(70)][v1]|", views: touchView1, touchView2)
//        
//        let view2 = drawservicing.addView(2)
//        mainView1.addSubview(view2)
//        
//        let approxHours = drawservicing.makeLabel("Approximate number of Hours", screenWidth: width, heading: "heading")
//        view2.addSubview(approxHours)
//        
//        approxHourLabel = drawservicing.makeLabel("2 Hours", screenWidth: width, heading: "subHeading")
//        approxHours.addSubview(approxHourLabel)
//        
//        let line3 = (drawservicing.drawLine(0, y: 20, width: width, color: "service"))
//        approxHourLabel.layer.addSublayer(line3)
//        
//        let changeHourIcon = shapes.drawShapes(view2, type: "edit")
//        view2.addSubview(changeHourIcon)
//        
//        let touchView3 = drawservicing.touchView()
//        touchView3.isUserInteractionEnabled = true
//        let tapOnPickupIcon = UITapGestureRecognizer(target: self, action: #selector(anmiateChangehour))
//        touchView3.addGestureRecognizer(tapOnPickupIcon)
//        view2.addSubview(touchView3)
//        view2.addConstraintsWithFormat("H:|[v0]|", views: touchView3)
//        view2.addConstraintsWithFormat("V:|[v0(70)]", views: touchView3)
//        
//        let estimateConvFee = drawservicing.makeLabel("Estimated Convenience Fee", screenWidth: width, heading: "heading")
//        approxHourLabel.addSubview(estimateConvFee)
//        
//        estimateFeeLabel = drawservicing.makeLabel("Rs 2 per minute", screenWidth: width, heading: "subHeading")
//        estimateConvFee.addSubview(estimateFeeLabel)
//        
//        let line4 = (drawservicing.drawLine(0, y: 20, width: width, color: "service"))
//        estimateFeeLabel.layer.addSublayer(line4)
//        
//        amountLabel = drawservicing.makeLabel("240", screenWidth: width, heading: "heading")
//        view2.addSubview(amountLabel)
//        
//        let view3 = drawservicing.addView(1)
//        mainView1.addSubview(view3)
//        
//        let promolabel = (drawservicing.makeLabel("Promo Code",screenWidth: width!, heading: "heading"))
//        view3.addSubview(promolabel)
//        view3.addConstraintsWithFormat("H:|-23-[v0]", views: promolabel)
//        
//        //adds promo label
//        promocode = drawservicing.makeLabel("21North", screenWidth: width!, heading: "subHeading")
//        view3.addSubview(promocode)
//        view3.addConstraintsWithFormat("H:|-23-[v0]", views: promocode)
//        
//        let touchView7 = drawservicing.touchView()
//        let tapOnPromoEdit = UITapGestureRecognizer(target: self, action: #selector(editPromo))
//        touchView7.addGestureRecognizer(tapOnPromoEdit)
//        view3.addSubview(touchView7)
//        view3.addConstraintsWithFormat("H:|[v0]|", views: touchView7)
//        view3.addConstraintsWithFormat("V:|[v0(70)]", views: touchView7)
//        
//        //adds line 7
//        let line7 = (drawservicing.drawLine(0, y: 20, width: width!, color: "service"))
//        promocode.layer.addSublayer(line7)
//        
//        let etaLabel = drawservicing.makeLabel("ETA", screenWidth: width, heading: "heading")
//        etaLabel.textAlignment = .center
//        view3.addSubview(etaLabel)
//        
//        etaTimeLabel = drawservicing.makeLabel("30 minutes", screenWidth: width, heading: "subHeading")
//        etaTimeLabel.textAlignment = .center
//        view3.addSubview(etaTimeLabel)
//        let style = Style()
//        
//        reqChauffeurButton.setTitle("REQUEST CHAUFFEUR", for: UIControlState())
//        reqChauffeurButton.titleLabel?.font = style.editCarButtonFont
//        reqChauffeurButton.addTarget(self, action: #selector(reqChauffeurClicked), for: .touchUpInside)
//        reqChauffeurButton.titleLabel?.adjustsFontSizeToFitWidth = true
//        reqChauffeurButton.backgroundColor = style.editCarButtonFontColor
//        reqChauffeurButton.isEnabled = false
//        view3.addSubview(reqChauffeurButton)
//        
//        hoursView.frame = CGRect(x: 0, y: height, width: width, height: height)
//        hoursView.backgroundColor = UIColor(white: 0, alpha: 0.7)
//        view.addSubview(hoursView)
//        
//        hourPickerView.frame = CGRect(x: 0, y: height-150, width: width, height: 150)
//        hourPickerView.backgroundColor = UIColor.white
//        hourPickerView.delegate = self
//        hourPickerView.dataSource = self
//        hoursView.addSubview(hourPickerView)
//        
//        hourPickerView.selectRow(1, inComponent: 0, animated: true)
//        
//        mainView1.addConstraintsWithFormat("V:|[v0(140)][v1(140)][v2(200)]", views: view1, view2, view3)
//        mainView1.addConstraintsWithFormat("H:|[v0]|", views: view1)
//        mainView1.addConstraintsWithFormat("H:|[v0]|", views: view2)
//        mainView1.addConstraintsWithFormat("H:|[v0]|", views: view3)
//        view1.addConstraintsWithFormat("H:|-23-[v0]-40-|", views: pickupLabel)
//        view1.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]-22-[v2]-9-[v3]", views: pickupLabel, pickupLocLabel, dropLabel, dropLocLabel)
//        pickupLabel.addConstraintsWithFormat("H:|[v0]|", views: pickupLocLabel)
//        pickupLocLabel.addConstraintsWithFormat("H:|[v0]|", views: dropLabel)
//        dropLabel.addConstraintsWithFormat("H:|[v0]|", views: dropLocLabel)
//        view1.addConstraintsWithFormat("H:[v0]|", views: pickLocIcon)
//        view1.addConstraintsWithFormat("V:|-20-[v0]", views: pickLocIcon)
//        view1.addConstraintsWithFormat("H:[v0]|", views: dropLocIcon)
//        view1.addConstraintsWithFormat("V:|-80-[v0]", views: dropLocIcon)
//        view2.addConstraintsWithFormat("H:|-23-[v0]", views: approxHours)
//        view2.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]-22-[v2]-9-[v3]", views: approxHours, approxHourLabel, estimateConvFee, estimateFeeLabel)
//        view2.addConstraintsWithFormat("H:[v0]|", views: changeHourIcon)
//        view2.addConstraintsWithFormat("V:|-20-[v0]", views: changeHourIcon)
//        approxHourLabel.addConstraintsWithFormat("H:|[v0]", views: estimateConvFee)
//        approxHours.addConstraintsWithFormat("H:|[v0]", views: approxHourLabel)
//        estimateConvFee.addConstraintsWithFormat("H:|[v0]", views: estimateFeeLabel)
//        view2.addConstraintsWithFormat("H:[v0]-16-|", views: amountLabel)
//        view2.addConstraintsWithFormat("V:|-80-[v0]", views: amountLabel)
//        
//        view3.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]-22-[v2]-9-[v3]-9-[v4(40)]", views: promolabel, promocode, etaLabel, etaTimeLabel, reqChauffeurButton)
//        view3.addConstraintsWithFormat("H:|[v0]|", views: etaLabel)
//        view3.addConstraintsWithFormat("H:|[v0]|", views: etaTimeLabel)
//        
//        let gap = (width-200)/2
//        let metric = ["gap": gap]
//        let dictionary = ["reqChaButton": reqChauffeurButton]
//        let buttonConst: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-gap-[reqChaButton]-gap-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric, views: dictionary) as NSArray
//        view3.addConstraints(buttonConst as! [NSLayoutConstraint])
//        
//        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: height-190, width: width, height: 40))
//        
//        navigationBar.backgroundColor = UIColor.white
//        navigationBar.delegate = self as? UINavigationBarDelegate
//        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
//        
//        UIBarButtonItem.appearance().tintColor = UIColor.white
//        navigationBar.backgroundColor = UIColor.brown
//        
//        let navigationItem = UINavigationItem()
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(hidePickerView))
//        // Assign the navigation item to the navigation bar
//        let barbuttonFont = UIFont(name: "Ubuntu-Light", size: 15) ?? UIFont.systemFont(ofSize: 15)
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: barbuttonFont, NSForegroundColorAttributeName:UIColor.black], for: UIControlState.normal)
//        navigationBar.items = [navigationItem]
//        hoursView.addSubview(navigationBar)
//        
//        let curLat = (self.locationManager.location?.coordinate.latitude.description)!
//        let curLong = (self.locationManager.location?.coordinate.longitude.description)!
//        pickupLat = Double(curLat)
//        pickupLong = Double(curLong)
//        dropLat = Double(curLat)
//        dropLong = Double(curLong)
//        
//        latLong = curLat + "|" + curLong + "|"
//        dropLatLong = latLong
//        
//        onLoad()
//        
//        viewForPromoCode.frame = CGRect(x: width!, y: 0, width: width!, height: height!)
//        viewForPromoCode.isUserInteractionEnabled = true
//        let tap1 = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        viewForPromoCode.addGestureRecognizer(tap1)
//        viewForPromoCode.backgroundColor = UIColor(white: 0, alpha: 0.7)
//        view.addSubview(viewForPromoCode)
//        
//        let promoCodeLabel = UILabel()
//        let widthForPromoLabel = CGFloat(200)
//        let gap1 = (width!-200)/2
//        promoCodeLabel.frame = CGRect(x: gap1, y: 150, width: widthForPromoLabel, height: 30)
//        promoCodeLabel.text = "Enter Promo Code"
//        promoCodeLabel.textColor = UIColor.white
//        promoCodeLabel.textAlignment = .center
//        viewForPromoCode.addSubview(promoCodeLabel)
//        
//        promoTextField.frame = CGRect(x: gap1, y: 180, width: 200, height: 40)
//        promoTextField.borderStyle = .line
//        promoTextField.textAlignment = .center
//        promoTextField.attributedPlaceholder = NSAttributedString(string:"21North",
//                                                                  attributes:[NSForegroundColorAttributeName: UIColor.lightGray])
//        promoTextField.layer.borderColor = UIColor.orange.cgColor
//        promoTextField.layer.borderWidth = 1.0
//        promoTextField.textColor = UIColor.white
//        promoTextField.autocapitalizationType = .allCharacters
//        viewForPromoCode.addSubview(promoTextField)
//        
//        let promoEdit = shapes.drawShapes(view3, type: "edit")
//        view3.addSubview(promoEdit)
//        
//        view3.addConstraintsWithFormat("H:[v0]|", views: promoEdit)
//        view3.addConstraintsWithFormat("V:|-20-[v0]", views: promoEdit)
//        
//        verifyPromoLabel.frame = CGRect(x: 0, y: 225, width: width!, height: 20)
//        verifyPromoLabel.textAlignment = .center
//        verifyPromoLabel.text = ""
//        verifyPromoLabel.font = verifyPromoLabel.font.withSize(12)
//        verifyPromoLabel.textColor = UIColor.gray
//        viewForPromoCode.addSubview(verifyPromoLabel)
//        
//        let promoVerifyButton = UIButton()
//        let buttonWidth = CGFloat(180)
//        let buttongap = (width! - buttonWidth)/2
//        promoVerifyButton.frame = CGRect(x: buttongap, y: 250, width: buttonWidth, height: 40)
//        promoVerifyButton.setTitle("ADD", for: UIControlState())
//        promoVerifyButton.backgroundColor = UIColor.orange
//        promoVerifyButton.addTarget(self, action: #selector(promoVerificationBtnCLicked), for: .touchUpInside)
//        viewForPromoCode.addSubview(promoVerifyButton)
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(promoVerification), name: NSNotification.Name(rawValue: "PROMO"), object: nil)
//    }
//    func hideKeyboard(){
//        view.endEditing(true)
////        if()
//        UIView.animate(withDuration: 0.20, animations: {
//            self.viewForPromoCode.frame.origin.x = self.width!
//            }, completion: nil)
//    }
//    func promoVerificationBtnCLicked(){
//        if(promoTextField.text!.characters.count != 0){
//            let verifypromo = "VERIFYPROMO!" + promoTextField.text! + "|"
//            passData.dataCheck(verifypromo)
//        }
//    }
//    var promoSuccess = "0"
//    func promoVerification(_ notification: Notification){
//        print("PromoDone")
//        let pin = ((notification as NSNotification).userInfo!["PROMO"] as! String)
//        let brk1 = pin.characters.split(separator: "$").map(String.init)
//        if(brk1[safe: 0]! == "-1"){
//            verifyPromoLabel.text = "Promo Code Invalid"
//        }else{
//            verifyPromoLabel.text = "Done"
//            promocode.text = promoTextField.text! + " : \u{20B9} " + brk1[safe: 0]! + " Discount Applied"
////            amountLabel.text = "\u{20B9} \((120*multipleAmount) - Int(brk1[0])!)"
//            hideKeyboard()
//            promoSuccess = promoTextField.text!
//        }
//    }
//    func editPromo(){
//        passData.clickTrack(dataString: "39")
//        UIView.animate(withDuration: 0.20, animations: {
//            self.viewForPromoCode.frame.origin.x = 0
//            }, completion: nil)
//    }
//    func bookingData(_ notification: Notification){
//        let pin = (notification as NSNotification).userInfo!["BOOKINGDATA"] as! String
//        let data = pin.characters.split(separator: "$").map(String.init)
//        delegate.bookingID = data[safe: 0]!
//        delegate.bookingData.append([data[safe: 0]!])
//        delegate.bookedCars.append(["\(data[safe: 0]!)", (delegate.selectedCarID), "21", "Requesting", "2"])
//        for i in 0..<delegate.carArray.count{
//            if(delegate.carArray[i][0] == delegate.selectedCarID){
//                delegate.carArray[i][6] = data[safe: 2]!
//            }
//        }
////        let alert = UIAlertController(title: "Booking ID: " + data[safe: 0]!, message: data[safe: 1]!, preferredStyle: UIAlertControllerStyle.alert)
//        requestingChauffer()
//        UIView.animate(withDuration: 0.20, animations: {
//            self.requestingView.frame.origin.x = 0
//        }, completion: nil)
////        // add the actions (buttons)
////        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
////        
////        // show the alert
////        self.present(alert, animated: true, completion: nil)
//        
//    }
//    func refreshData(_ notification: Notification){
//        let pin = (notification as NSNotification).userInfo!["check"] as! String
//        let toScreen1 = (notification as NSNotification).userInfo!["toScreen"] as! String
//        if(pin == "0"){
//            if(delegate.refreshData.count>3){
//                delegate.screenLabel = delegate.refreshData[safe: 3]!
//            }
//        }
//        else if(pin == "1"){
//            timer.invalidate()
//            timerUpdate.invalidate()
//            let toScreenViewCtrl = toScreen()
//            let screenName = toScreenViewCtrl.servicingToScreen(toScreen1)
//            
//            if(delegate.currentScreenNo == 21){
//                enrouteChauffer(check: width)
//                expectedTimeLabel.text = etaTimeInterval + " minutes"
//                passData.dataCheck("STOPCHAUFPULOC!")
//                stopRefr = 0
//                loadingView.removeFromSuperview()
//                UIView.animate(withDuration: 0.25, delay: 0.25, options: UIViewAnimationOptions.curveEaseOut, animations: {
//                    self.scrollView.frame.origin.x = 0//CGRect(x: 0, y: 100, width: self.width, height: self.height-100)
//                    self.mainView1.frame.origin.x = -self.width!-100
//                    self.requestingView.frame.origin.x = -2*self.width!
//                    }, completion: nil)
//                
//            }
//            else if(delegate.currentScreenNo == 22){
//                delegate.screenLabel = delegate.refreshData[safe: 3]!
//                headingLabel?.text = delegate.refreshData[safe: 3]!
//                topIconView.removeFromSuperview()
//                topIconView = topViewShape.chauffeurTopView(1)
//                topView.addSubview(topIconView)
//                topView.addConstraintsWithFormat("H:|-\(space!)-[v0(164)]", views: topIconView)
//                //                    topView.addConstraintsWithFormat("H:|[v0]|", views: topIconView)
//                topView.addConstraintsWithFormat("V:|-20-[v0]-32-[v1(50)]", views: headingLabel, topIconView)
//                cancelButton.isHidden = true
//                etaLabel.isHidden = true
//                etaTimeLabel.isHidden = true
//                expectedTimeLabel.isHidden = true
//            }
//            else if(delegate.currentScreenNo == 23){
//                delegate.screenLabel = delegate.refreshData[safe: 3]!
//                headingLabel?.text = delegate.refreshData[safe: 3]!
//                topIconView.removeFromSuperview()
//                topIconView = topViewShape.chauffeurTopView(2)
//                topView.addSubview(topIconView)
//                topView.addConstraintsWithFormat("H:|-\(space!)-[v0(164)]", views: topIconView)
//                //                    topView.addConstraintsWithFormat("H:|[v0]|", views: topIconView)
//                topView.addConstraintsWithFormat("V:|-20-[v0]-32-[v1(50)]", views: headingLabel, topIconView)
//                etaLabel.removeFromSuperview()
//                expectedTimeLabel.removeFromSuperview()
//                
//                let serviceStartedlabel = drawservicing.makeLabel("Service Started at", screenWidth: width, heading: "heading")
//                view4.addSubview(serviceStartedlabel)
//                view4.addConstraintsWithFormat("H:|-21-[v0]", views: serviceStartedlabel)
//                
//                let dateTime = delegate.refreshData[safe: 23]!.characters.split(separator: " ").map(String.init)
//                let dateToDisplay = loadingPageClass.dateFormateChange(dateTime[safe: 0]!)
//                let timeToDisplay = loadingPageClass.timeTo12(dateTime[safe: 1]!)
//                
//                serviceStartedTimeLabel = drawservicing.makeLabel(timeToDisplay + ", " + dateToDisplay, screenWidth: width, heading: "subHeading")
//                view4.addSubview(serviceStartedTimeLabel)
//                view4.addConstraintsWithFormat("H:|-21-[v0]", views: serviceStartedTimeLabel)
//                
//                let line6 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//                serviceStartedTimeLabel.layer.addSublayer(line6)
//                
//                view4.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]", views: serviceStartedlabel, serviceStartedTimeLabel)
//                
//            }
//            else if(delegate.currentScreenNo == 24){
//                chauffeurServiceCompleted(check: width)
//                UIView.animate(withDuration: 0.20, animations: {
//                    self.scrollView.frame.origin.x = -self.width!-100
//                    self.scrollView1.frame.origin.x = 0
//                    }, completion: nil)
//            }
//            
//            else if(delegate.currentScreenNo == 25){
//                if(feedbackCheck == 0){
//                chauffeurFeedback(check: width)
//                UIView.animate(withDuration: 0.20, animations: {
//                    self.scrollView.frame.origin.x = -self.width!-100
//                        self.scrollView1.frame.origin.x = -self.width-100
//                        self.mainView3.frame.origin.x = 0
//                    }, completion: nil)
//                    feedbackCheck = 1
//                }
//            }
//            else{
//                let transition = CATransition()
//                transition.duration = 0.5
//                transition.type = kCATransitionPush
//                transition.subtype = kCATransitionFromRight
//                view.window!.layer.add(transition, forKey: kCATransition)
//                self.present(screenName, animated: false, completion: nil)
//            }
//        }
//    }
//    var mainView2 = UIView()
//    var view1 = UIView()
//    var view2 = UIView()
//    var view3 = UIView()
//    var serviceEndedTimeLabel = UILabel()
//    var convFeeAmount = UILabel()
//    var promoCodeUseLabel = UILabel()
//    var viewEstimatePage = UIWebView()
//    var payButton = UIButton()
//    let scrollView1 = UIScrollView()
//    func chauffeurServiceCompleted(check:CGFloat){
//        
//        scrollView1.translatesAutoresizingMaskIntoConstraints = true
//        scrollView1.frame = CGRect(x: 0, y: 100, width: width, height: height-100)
//        scrollView1.showsVerticalScrollIndicator = false
//        scrollView1.showsHorizontalScrollIndicator = false
//        view.addSubview(scrollView1)
//        
//        mainView2 = drawservicing.addView(1)
//        scrollView1.addSubview(mainView2)
//        scrollView1.addConstraintsWithFormat("H:|[v0(\(width!))]|", views: mainView2)
//        scrollView1.addConstraintsWithFormat("V:|[v0(1000)]|", views: mainView2)
//        
//        let topView = drawservicing.addView(1)
//        mainView2.addSubview(topView)
//        mainView2.addConstraintsWithFormat("H:|[v0]|", views: topView)
//        
//        headingLabel = drawservicing.makeLabel(delegate.refreshData[safe: 3]!, screenWidth: width!, heading: "subHeading")
//        headingLabel!.font = UIFont(name:"HelveticaNeue-Bold", size: 14)
//        headingLabel!.textColor = UIColor(red: 242/255.0, green: 103.0/255.0, blue: 33.0/255.0, alpha: 1.0)
//        topView.addSubview(headingLabel!)
//        topView.addConstraintsWithFormat("H:|-21-[v0]", views: headingLabel)
//        
//        let line1 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        headingLabel!.layer.addSublayer(line1)
//        
//        let topViewShape = topViewShapes()
//        let topIconView = topViewShape.chauffeurTopView(2)
//        topView.addSubview(topIconView)
//        
//        let space = (width-164)/2
//        topView.addConstraintsWithFormat("H:|-\(space)-[v0(164)]", views: topIconView)
//        topView.addConstraintsWithFormat("V:|-20-[v0]-32-[v1(50)]", views: headingLabel, topIconView)
//        
//        view1 = drawservicing.addView(2)
//        mainView2.addSubview(view1)
//        
//        let str = "http://m.21north.in/ambassadors/ambassadors-" + (delegate.refreshData[safe: 21]!) + ".png"
//        let url = URL(string: str)
//        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
//        profileImageView.image = UIImage(data: data!)
//        profileImageView.layer.cornerRadius = 40
//        profileImageView.clipsToBounds = true
//        profileImageView.backgroundColor = UIColor.gray
//        profileImageView.translatesAutoresizingMaskIntoConstraints = false
//        view1.addSubview(profileImageView)
//        
//        chauffeurNameLabel = drawservicing.makeLabel(delegate.refreshData[safe: 13]!, screenWidth: width, heading: "heading")
//        chauffeurNameLabel.textAlignment = .center
//        view1.addSubview(chauffeurNameLabel)
//        view1.addConstraintsWithFormat("H:|[v0]|", views: chauffeurNameLabel)
//        
//        chauffeurRating = UIImageView()
//        chauffeurRating.image = shapes.drawRatingStars(Int(delegate.refreshData[safe: 22]!)!)//(Int(delegate.refreshData[21])!)
//        view1.addSubview(chauffeurRating)
//        
//        let locationIcon = shapes.drawShapes(view1, type: "ambLocation")
//        locationIcon.isUserInteractionEnabled = true
//        let tapOnShowChauffer = UITapGestureRecognizer(target: self, action: #selector(showChaufferLoc))
//        locationIcon.addGestureRecognizer(tapOnShowChauffer)
//        view1.addSubview(locationIcon)
//        
//        ambContactNo = delegate.refreshData[safe: 14]!
//        let callChauffeurIcon = shapes.drawShapes(view1, type: "ambCall")
//        callChauffeurIcon.isUserInteractionEnabled = true
//        let tapOnCallChauffeur = UITapGestureRecognizer(target: self, action: #selector(callAmb))
//        callChauffeurIcon.addGestureRecognizer(tapOnCallChauffeur)
//        view1.addSubview(callChauffeurIcon)
//        
//        let profileGap = (width-80)/2
//        view1.addConstraintsWithFormat("H:|-45-[v0]", views: callChauffeurIcon)
//        view1.addConstraintsWithFormat("H:|-\(profileGap)-[v0(80)]", views: profileImageView)
//        view1.addConstraintsWithFormat("H:[v0]-45-|", views: locationIcon)
//        view1.addConstraintsWithFormat("V:|-46-[v0]", views: callChauffeurIcon)
//        view1.addConstraintsWithFormat("V:|-46-[v0]", views: locationIcon)
//        view1.addConstraintsWithFormat("V:|-20-[v0(80)]-5-[v1]", views: profileImageView, chauffeurNameLabel)
//        
//        view2 = drawservicing.addView(1)
//        mainView2.addSubview(view2)
//        
//        let pickUpLabel = drawservicing.makeLabel("Pickup Location", screenWidth: width, heading: "heading")
//        view2.addSubview(pickUpLabel)
//        view2.addConstraintsWithFormat("H:|-21-[v0]", views: pickUpLabel)
//        
//        let pickupLocationLabel = drawservicing.makeLabel(delegate.refreshData[safe: 6]!, screenWidth: width, heading: "subHeading")
//        view2.addSubview(pickupLocationLabel)
//        view2.addConstraintsWithFormat("H:|-21-[v0]-16-|", views: pickupLocationLabel)
//        
//        let line2 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        pickupLocationLabel.layer.addSublayer(line2)
//        
//        let dropoffLabel = drawservicing.makeLabel("Dropoff Location", screenWidth: width, heading: "heading")
//        view2.addSubview(dropoffLabel)
//        view2.addConstraintsWithFormat("H:|-21-[v0]", views: dropoffLabel)
//        
//        let dropOffLocationLabel = drawservicing.makeLabel(delegate.refreshData[9], screenWidth: width, heading: "subHeading")
//        view2.addSubview(dropOffLocationLabel)
//        view2.addConstraintsWithFormat("H:|-21-[v0]-16-|", views: dropOffLocationLabel)
//        
//        let line3 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        dropOffLocationLabel.layer.addSublayer(line3)
//        
//        view2.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]-22-[v2]-9-[v3]", views: pickUpLabel, pickupLocationLabel, dropoffLabel, dropOffLocationLabel)
//        
//        view3 = drawservicing.addView(2)
//        mainView2.addSubview(view3)
//        
//        let approxNoLabel = drawservicing.makeLabel("Approximate Hours", screenWidth: width, heading: "heading")
//        view3.addSubview(approxNoLabel)
//        view3.addConstraintsWithFormat("H:|-21-[v0]", views: approxNoLabel)
//        
//        let hoursLabel = drawservicing.makeLabel(delegate.refreshData[safe: 25]! + " Hours", screenWidth: width, heading: "subHeading")
//        view3.addSubview(hoursLabel)
//        view3.addConstraintsWithFormat("H:|-21-[v0]", views: hoursLabel)
//        
//        let line4 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        hoursLabel.layer.addSublayer(line4)
//        
//        let convFeeLabel = drawservicing.makeLabel("Chauffeur Cost", screenWidth: width, heading: "heading")
//        view3.addSubview(convFeeLabel)
//        view3.addConstraintsWithFormat("H:|-21-[v0]", views: convFeeLabel)
//        
//        let convFeeRateLabel = drawservicing.makeLabel("\u{20B9} " + delegate.refreshData[safe: 32]! + " per minute", screenWidth: width, heading: "subHeading")
//        view3.addSubview(convFeeRateLabel)
//        view3.addConstraintsWithFormat("H:|-21-[v0]", views: convFeeRateLabel)
//        
//        let line5 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        convFeeRateLabel.layer.addSublayer(line5)
//        
//        let convAmountLabel = drawservicing.makeLabel("\u{20B9} " + delegate.refreshData[safe: 28]!, screenWidth: width, heading: "heading")
//        view3.addSubview(convAmountLabel)
//        view3.addConstraintsWithFormat("H:[v0]-16-|", views: convAmountLabel)
//        view3.addConstraintsWithFormat("V:|-80-[v0]", views: convAmountLabel)
//        
//        view3.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]-22-[v2]-9-[v3]", views: approxNoLabel, hoursLabel, convFeeLabel, convFeeRateLabel)
//        
//        let view4 = drawservicing.addView(1)
//        mainView2.addSubview(view4)
//        mainView2.addConstraintsWithFormat("H:|[v0]|", views: view4)
//        
//        let serviceStartedLabel1 = drawservicing.makeLabel("Service Started At", screenWidth: width, heading: "heading")
//        view4.addSubview(serviceStartedLabel1)
//        view4.addConstraintsWithFormat("H:|-21-[v0]", views: serviceStartedLabel1)
//        
//        let dateTime = delegate.refreshData[safe: 23]!.characters.split(separator: " ").map(String.init)
//        let dateToDisplay = loadingPageClass.dateFormateChange(dateTime[safe: 0]!)
//        let timeToDisplay = loadingPageClass.timeTo12(dateTime[safe: 1]!)
//        serviceStartedTimeLabel = drawservicing.makeLabel(timeToDisplay + ", " + dateToDisplay, screenWidth: width, heading: "subHeading")
//        view4.addSubview(serviceStartedTimeLabel)
//        view4.addConstraintsWithFormat("H:|-21-[v0]", views: serviceStartedTimeLabel)
//        
//        let line6 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        serviceStartedTimeLabel.layer.addSublayer(line6)
//        
//        let serviceEndedLabel = drawservicing.makeLabel("Service Ended At", screenWidth: width, heading: "heading")
//        view4.addSubview(serviceEndedLabel)
//        view4.addConstraintsWithFormat("H:|-21-[v0]", views: serviceEndedLabel)
//        
//        let dateTime1 = delegate.refreshData[safe: 24]!.characters.split(separator: " ").map(String.init)
//        let dateToDisplay1 = loadingPageClass.dateFormateChange(dateTime1[safe: 0]!)
//        let timeToDisplay1 = loadingPageClass.timeTo12(dateTime1[safe: 1]!)
//        serviceEndedTimeLabel = drawservicing.makeLabel(timeToDisplay1 + ", " + dateToDisplay1, screenWidth: width, heading: "subHeading")
//        view4.addSubview(serviceEndedTimeLabel)
//        view4.addConstraintsWithFormat("H:|-21-[v0]", views: serviceEndedTimeLabel)
//        
//        let line7 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        serviceEndedTimeLabel.layer.addSublayer(line7)
//        
//        view4.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]-22-[v2]-9-[v3]", views: serviceStartedLabel1, serviceStartedTimeLabel, serviceEndedLabel, serviceEndedTimeLabel)
//        
//        let view5 = drawservicing.addView(2)
//        mainView2.addSubview(view5)
//        mainView2.addConstraintsWithFormat("H:|[v0]|", views: view5)
//        
//        let convenienceFeeLabel = drawservicing.makeLabel("Convenience Fee", screenWidth: width, heading: "heading")
//        view5.addSubview(convenienceFeeLabel)
//        view5.addConstraintsWithFormat("H:|-21-[v0]", views: convenienceFeeLabel)
//        
//        convFeeAmount = drawservicing.makeLabel("\u{20B9} " + delegate.refreshData[safe: 28]!, screenWidth: width, heading: "heading")
//        view5.addSubview(convFeeAmount)
//        view5.addConstraintsWithFormat("H:[v0]-16-|", views: convFeeAmount)
//        view5.addConstraintsWithFormat("V:|-20-[v0]", views: convFeeAmount)
//        
//        let totalTimeLabel = drawservicing.makeLabel(delegate.refreshData[safe: 35]! + " minutes", screenWidth: width, heading: "subHeading")
//        view5.addSubview(totalTimeLabel)
//        view5.addConstraintsWithFormat("H:|-21-[v0]", views: totalTimeLabel)
//        
//        let line8 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        totalTimeLabel.layer.addSublayer(line8)
//        
//        let promoCodeLabel = drawservicing.makeLabel("Promo Code", screenWidth: width, heading: "heading")
//        view5.addSubview(promoCodeLabel)
//        view5.addConstraintsWithFormat("H:|-21-[v0]", views: promoCodeLabel)
//        
//        promoCodeUseLabel = drawservicing.makeLabel(delegate.refreshData[safe: 33]!, screenWidth: width, heading: "subHeading")
//        view5.addSubview(promoCodeUseLabel)
//        view5.addConstraintsWithFormat("H:|-21-[v0]", views: promoCodeUseLabel)
//        
//        let promoDisLabel = drawservicing.makeLabel("\u{20B9} " + delegate.refreshData[safe: 29]!, screenWidth: width, heading: "heading")
//        view5.addSubview(promoDisLabel)
//        view5.addConstraintsWithFormat("H:[v0]-16-|", views: promoDisLabel)
//        view5.addConstraintsWithFormat("V:|-80-[v0]", views: promoDisLabel)
//        
//        let line9 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        promoCodeUseLabel.layer.addSublayer(line9)
//        
//        view5.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]-22-[v2]-9-[v3]", views: convenienceFeeLabel, totalTimeLabel, promoCodeLabel, promoCodeUseLabel)
//        
//        let view6 = drawservicing.addView(1)
//        mainView2.addSubview(view6)
//        mainView2.addConstraintsWithFormat("H:|[v0]|", views: view6)
//        
//        let totalAmountLabel = drawservicing.makeLabel("Total Payable Amount", screenWidth: width, heading: "heading")
//        view6.addSubview(totalAmountLabel)
//        view6.addConstraintsWithFormat("H:|-21-[v0]", views: totalAmountLabel)
//        
//        let amountLabel = drawservicing.makeLabel("\u{20B9} " + delegate.refreshData[safe: 31]!, screenWidth: width, heading: "heading")
//        view6.addSubview(amountLabel)
//        view6.addConstraintsWithFormat("H:[v0]-16-|", views: amountLabel)
//        
//        viewEstimatePage = UIWebView(frame: CGRect(x: width, y: 100, width: width, height: height-140))
//        view.addSubview(viewEstimatePage)
//        
//        
//        payButton.setTitle(NSLocalizedString("PAY INVOICE", comment: ""), for: UIControlState())
//        payButton.titleLabel?.font = style.editCarButtonFont
//        payButton.backgroundColor = style.editCarButtonFontColor
//        payButton.addTarget(self, action: #selector(payButtonClicked), for: .touchUpInside)
//        view6.addSubview(payButton)
//        
//        view6.addConstraintsWithFormat("V:|-20-[v0]-33-[v1(40)]", views: totalAmountLabel, payButton)
//        view6.addConstraintsWithFormat("V:|-20-[v0]", views: amountLabel)
//        
//        mainView2.addConstraintsWithFormat("V:|[v0(140)][v1(140)][v2(140)][v3(140)][v4(140)][v5(140)][v6(140)]", views: topView, view1, view2, view3, view4, view5, view6)
//        mainView2.addConstraintsWithFormat("H:|[v0]|", views: view2)
//        mainView2.addConstraintsWithFormat("H:|[v0]|", views: view1)
//        mainView2.addConstraintsWithFormat("H:|[v0]|", views: view3)
//        
//        let gap = (width-130)/2
//        let metric = ["gap": gap]
//        let dictionary = ["payButton": payButton]
//        let payButtonHorConst:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-gap-[payButton(130)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric, views: dictionary) as NSArray
//        view6.addConstraints(payButtonHorConst as! [NSLayoutConstraint])
//    }
//    var networkView  = UIView()
//    func networkStatus(_ notification: Notification){
//        let check = (notification as NSNotification).userInfo!["check"] as! String
//        
//        print(check)
//        if(check == "0"){//server down
//            if(networkView.isDescendant(of: view)){
//                
//            }
//            else{
//                networkView = loadingPageClass.networkIssue(view1: view, width: width!)
//                view.addSubview(networkView)
//                animateViewMoving1(false, moveValue: 100)
//            }
//        }
//        else if(check == "1"){// server running
////            if(networkView.isDescendant(of: view)){
//                animateViewMoving1(true, moveValue: 100)
//                networkView.removeFromSuperview()
////            }
//        }
//    }
//    func animateViewMoving1 (_ up:Bool, moveValue :CGFloat){
//        
//        let movementDuration:TimeInterval = 0.3
//        //        let movement:CGFloat = ( up ? -move1 : move1)
//        let movementForChatBox = (up ? -moveValue : moveValue)
//        UIView.beginAnimations( "animateView", context: nil)
//        UIView.setAnimationBeginsFromCurrentState(true)
//        UIView.setAnimationDuration(movementDuration )
//        
//        self.networkView.frame = self.networkView.frame.offsetBy(dx: 0,  dy: movementForChatBox)
//        
//        
//        //        self.chatBox.frame = self.chatBox.frame.offsetBy(dx: 0, dy: movementForChatBox)
//        UIView.commitAnimations()
//    }
//    var buttonOrigin:CGFloat = 1
//    var buttonCheck = 0
//    func payButtonClicked(){
//        passData.clickTrack(dataString: "42")
//        let newVC = viewFileWithLink()
//        newVC.linkData = self
//        newVC.link = "http://m.21north.in/PaytmKit/pgRedirect.php?id=" + (DataCreator.sharedInstance.refreshData[safe: 0]!)
//        self.present(newVC, animated: true, completion: nil)
//
////        buttonCheck = 1
////       
////        let link = "http://m.21north.in/notify/proofinvoice.php?id=" + (self.delegate.refreshData[0])
////        self.viewEstimatePage.loadRequest(URLRequest(url: URL(string: link)!))
////        buttonOrigin = payButton.frame.origin.x
////        UIView.animate(withDuration: 0.20, animations: {
////            self.headingLabel.frame.origin.x = -self.width
////            self.view1.frame.origin.x = -self.width
////            self.view2.frame.origin.x = -self.width
////            self.view3.frame.origin.x = -self.width
////            self.payButton.frame.origin.x = -self.width
////            self.viewEstimatePage.frame.origin.x = 0
////            }, completion: nil)
//    }
//
//    var topView = UIView()
//    var topIconView = UIView()
//    let topViewShape = topViewShapes()
//    var space:CGFloat!
//    var profileImageView = UIImageView()
//    var chauffeurNameLabel: UILabel!
//    var chauffeurRating: UIImageView!
//    var dropOffLocationLabel = UILabel()
//    var hoursLabel: UILabel!
//    var view4 = UIView()
//    var etaLabel = UILabel()
//    var expectedTimeLabel = UILabel()
//    let cancelButton = UIButton()
//    var serviceStartedTimeLabel = UILabel()
//    let scrollView = UIScrollView()
//    var mainView = UIView()
//    
//    func enrouteChauffer(check:CGFloat){
//        
//        scrollView.frame = CGRect(x: check, y: 98, width: width, height: height-100)
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.showsVerticalScrollIndicator = false
//        view.addSubview(scrollView)
//
//        mainView = drawservicing.addView(1)
//        scrollView.addSubview(mainView)
//        scrollView.addConstraintsWithFormat("H:|[v0(\(width!))]", views: mainView)
//        scrollView.addConstraintsWithFormat("V:|[v0(800)]|", views: mainView)
//        
//        topView = drawservicing.addView(1)
//        mainView.addSubview(topView)
//        mainView.addConstraintsWithFormat("H:|[v0]|", views: topView)
//        
//        headingLabel = drawservicing.makeLabel(delegate.refreshData[safe: 3]!, screenWidth: width!, heading: "subHeading")
//        headingLabel!.font = UIFont(name:"HelveticaNeue-Bold", size: 14)
//        headingLabel!.textColor = UIColor(red: 242/255.0, green: 103.0/255.0, blue: 33.0/255.0, alpha: 1.0)
//        topView.addSubview(headingLabel!)
//        topView.addConstraintsWithFormat("H:|-23-[v0]", views: headingLabel)
//        
//        if(delegate.currentScreenNo == 21){
//            topIconView = topViewShape.chauffeurTopView(0)
//        }
//        else if(delegate.currentScreenNo == 22){
//            topIconView = topViewShape.chauffeurTopView(1)
//        }
//        else if(delegate.currentScreenNo == 23){
//            topIconView = topViewShape.chauffeurTopView(2)
//        }
//        topView.addSubview(topIconView)
//        
//        space = (width-164)/2
//        topView.addConstraintsWithFormat("H:|-\(space!)-[v0(164)]", views: topIconView)
//        
//        
//        topView.addConstraintsWithFormat("V:|-20-[v0]-32-[v1(50)]", views: headingLabel, topIconView)
//        
//        let line1 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        headingLabel!.layer.addSublayer(line1)
//        
//        let view1 = drawservicing.addView(2)
//        mainView.addSubview(view1)
//        
//        profileImageView.layer.cornerRadius = 40
//        profileImageView.clipsToBounds = true
//        profileImageView.backgroundColor = UIColor.gray
//        profileImageView.translatesAutoresizingMaskIntoConstraints = false
//        let str = "http://m.21north.in/ambassadors/ambassadors-" + (delegate.refreshData[safe: 21]!) + ".png"
//        let url = URL(string: str)
//        //        let url = NSURL(string: "http://m.21north.in/ambassadors/ambassadors-1020.png")
//        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
//        if(data != nil){
//            profileImageView.image = UIImage(data: data!)
//        }
//        else{
//            profileImageView.image = UIImage(named: "Home-Insurance")
//        }
//        //        profileImageView.image = UIImage(data: data!)
//        view1.addSubview(profileImageView)
//        
//        chauffeurNameLabel = drawservicing.makeLabel(delegate.refreshData[safe: 13]!, screenWidth: width, heading: "heading")
//        view1.addSubview(chauffeurNameLabel)
//        chauffeurNameLabel.textAlignment = .center
//        view1.addConstraintsWithFormat("H:|[v0]|", views: chauffeurNameLabel)
//        
//        
//        chauffeurRating = UIImageView()
//        //        chauffeurRating.image = shapes.drawRatingStars(Int(delegate.refreshData[22])!)
//        view1.addSubview(chauffeurRating)
//        
//        let locationIcon = shapes.drawShapes(view1, type: "ambLocation")
//        locationIcon.isUserInteractionEnabled = true
//        let tapOnShowChauffer = UITapGestureRecognizer(target: self, action: #selector(showChaufferLoc))
//        locationIcon.addGestureRecognizer(tapOnShowChauffer)
//        view1.addSubview(locationIcon)
//        
//        let callChauffeurIcon = shapes.drawShapes(view1, type: "ambCall")
//        callChauffeurIcon.isUserInteractionEnabled = true
//        let tapOnCallChauffeur = UITapGestureRecognizer(target: self, action: #selector(callAmb))
//        callChauffeurIcon.addGestureRecognizer(tapOnCallChauffeur)
//        view1.addSubview(callChauffeurIcon)
//        
//        let profileGap = (width-80)/2
//        view1.addConstraintsWithFormat("H:|-45-[v0]", views: callChauffeurIcon)
//        view1.addConstraintsWithFormat("H:|-\(profileGap)-[v0(80)]", views: profileImageView)
//        view1.addConstraintsWithFormat("H:[v0]-45-|", views: locationIcon)
//        view1.addConstraintsWithFormat("V:|-46-[v0]", views: callChauffeurIcon)
//        view1.addConstraintsWithFormat("V:|-46-[v0]", views: locationIcon)
//        view1.addConstraintsWithFormat("V:|-20-[v0(80)]-5-[v1]", views: profileImageView, chauffeurNameLabel)
//        
//        let view2 = drawservicing.addView(1)
//        mainView.addSubview(view2)
//        
//        let pickUpLabel = drawservicing.makeLabel("Pickup Location", screenWidth: width, heading: "heading")
//        view2.addSubview(pickUpLabel)
//        view2.addConstraintsWithFormat("H:|-21-[v0]", views: pickUpLabel)
//        
//        let pickupLocationLabel = drawservicing.makeLabel(delegate.refreshData[safe: 6]!, screenWidth: width, heading: "subHeading")
//        view2.addSubview(pickupLocationLabel)
//        view2.addConstraintsWithFormat("H:|-21-[v0]-40-|", views: pickupLocationLabel)
//        
//        let line2 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        pickupLocationLabel.layer.addSublayer(line2)
//        
//        let dropoffLabel = drawservicing.makeLabel("Dropoff Location", screenWidth: width, heading: "heading")
//        view2.addSubview(dropoffLabel)
//        view2.addConstraintsWithFormat("H:|-21-[v0]", views: dropoffLabel)
//        
//        dropOffLocationLabel = drawservicing.makeLabel(delegate.refreshData[safe: 9]!, screenWidth: width, heading: "subHeading")
//        view2.addSubview(dropOffLocationLabel)
//        view2.addConstraintsWithFormat("H:|-21-[v0]-40-|", views: dropOffLocationLabel)
//        
//        let dropIcon = shapes.drawShapes(view2, type: "locationIcon")
//        view2.addSubview(dropIcon)
//        view2.addConstraintsWithFormat("H:[v0]|", views: dropIcon)
//        view2.addConstraintsWithFormat("V:|-80-[v0]", views: dropIcon)
//        
//        let touchView1 = drawservicing.touchView()
//        let tapOnDrop = UITapGestureRecognizer(target: self, action: #selector(dropOff))
//        touchView1.addGestureRecognizer(tapOnDrop)
//        view2.addSubview(touchView1)
//        view2.addConstraintsWithFormat("H:|[v0]|", views: touchView1)
//        view2.addConstraintsWithFormat("V:|-70-[v0(70)]", views: touchView1)
//        
//        let line3 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        dropOffLocationLabel.layer.addSublayer(line3)
//        
//        view2.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]-22-[v2]-9-[v3]", views: pickUpLabel, pickupLocationLabel, dropoffLabel, dropOffLocationLabel)
//        
//        let view3 = drawservicing.addView(2)
//        mainView.addSubview(view3)
//        mainView.addConstraintsWithFormat("H:|[v0]|", views: view3)
//        
//        let approxNoLabel = drawservicing.makeLabel("Approximate Hours", screenWidth: width, heading: "heading")
//        view3.addSubview(approxNoLabel)
//        view3.addConstraintsWithFormat("H:|-21-[v0]", views: approxNoLabel)
//        
//        hoursLabel = drawservicing.makeLabel(delegate.refreshData[safe: 25]! + " Hours", screenWidth: width, heading: "subHeading")
//        view3.addSubview(hoursLabel)
//        view3.addConstraintsWithFormat("H:|-21-[v0]", views: hoursLabel)
//        
//        let line4 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        hoursLabel.layer.addSublayer(line4)
//        
//        let convFeeLabel = drawservicing.makeLabel("Chauffeur Cost", screenWidth: width, heading: "heading")
//        view3.addSubview(convFeeLabel)
//        view3.addConstraintsWithFormat("H:|-21-[v0]", views: convFeeLabel)
//        
//        let convFeeRateLabel = drawservicing.makeLabel("\u{20B9} " + delegate.refreshData[safe: 32]! + " per minute", screenWidth: width, heading: "subHeading")
//        view3.addSubview(convFeeRateLabel)
//        view3.addConstraintsWithFormat("H:|-21-[v0]", views: convFeeRateLabel)
//        
//        let line5 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        convFeeRateLabel.layer.addSublayer(line5)
//        
//        let convAmountLabel = drawservicing.makeLabel("\u{20B9} " + delegate.refreshData[safe: 28]!, screenWidth: width, heading: "heading")
//        view3.addSubview(convAmountLabel)
//        view3.addConstraintsWithFormat("H:[v0]-16-|", views: convAmountLabel)
//        view3.addConstraintsWithFormat("V:|-80-[v0]", views: convAmountLabel)
//        
//        view3.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]-22-[v2]-9-[v3]", views: approxNoLabel, hoursLabel, convFeeLabel, convFeeRateLabel)
//        
//        view4 = drawservicing.addView(1)
//        mainView.addSubview(view4)
//        mainView.addConstraintsWithFormat("H:|[v0]|", views: view4)
//        
//        if(delegate.currentScreenNo == 21){
//            etaLabel = drawservicing.makeLabel("ETA", screenWidth: width, heading: "heading")
//            etaLabel.textAlignment = .center
//            view4.addSubview(etaLabel)
//            view4.addConstraintsWithFormat("H:|[v0]|", views: etaLabel)
//            
//            expectedTimeLabel = drawservicing.makeLabel(delegate.refreshData[safe: 37]! + " minutes", screenWidth: width, heading: "subHeading")
//            view4.addSubview(expectedTimeLabel)
//            expectedTimeLabel.textAlignment = .center
//            view4.addConstraintsWithFormat("H:|[v0]|", views: expectedTimeLabel)
//            
//            cancelButton.backgroundColor = style.editCarButtonFontColor
//            cancelButton.setTitle(NSLocalizedString("CANCEL", comment: ""), for: UIControlState())
//            cancelButton.addTarget(self, action: #selector(cancelFromEnroute), for: .touchUpInside)
//            cancelButton.titleLabel?.font = style.editCarButtonFont
//            view4.addSubview(cancelButton)
//            let gap = (width-108)/2
//            cancelButton.isHidden = false
//            view4.addConstraintsWithFormat("H:|-\(gap)-[v0(108)]", views: cancelButton)
//            
//            view4.addConstraintsWithFormat("V:|-14-[v0]-7-[v1]-15-[v2(40)]", views: etaLabel, expectedTimeLabel, cancelButton)
//            
//            if(delegate.refreshData.count>40 && delegate.refreshData[safe: 39]! != "|^"){
//                let reasons = delegate.refreshData[safe: 39]!.characters.split(separator: ",").map(String.init)
//                reasonsArray.removeAll()
//                for i in 0..<reasons.count{
//                    let reasonWithId = reasons[i].characters.split(separator: ":").map(String.init)
//                    reasonsArray.append([reasonWithId[safe: 0]!, reasonWithId[safe: 1]!])
//                }
//            }
//        }
//            
//        else if(delegate.currentScreenNo == 23){
//            let serviceStartedlabel = drawservicing.makeLabel("Service Started at", screenWidth: width, heading: "heading")
//            view4.addSubview(serviceStartedlabel)
//            view4.addConstraintsWithFormat("H:|-21-[v0]", views: serviceStartedlabel)
//            
//            let dateTime = delegate.refreshData[safe: 23]!.characters.split(separator: " ").map(String.init)
//            let dateToDisplay = loadingPageClass.dateFormateChange(dateTime[safe: 0]!)
//            let timeToDisplay = loadingPageClass.timeTo12(dateTime[safe: 1]!)
//            
//            serviceStartedTimeLabel = drawservicing.makeLabel(timeToDisplay + ", " + dateToDisplay, screenWidth: width, heading: "subHeading")
//            view4.addSubview(serviceStartedTimeLabel)
//            view4.addConstraintsWithFormat("H:|-21-[v0]", views: serviceStartedTimeLabel)
//            
//            let line6 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//            serviceStartedTimeLabel.layer.addSublayer(line6)
//            
//            view4.addConstraintsWithFormat("V:|-20-[v0]-9-[v1]", views: serviceStartedlabel, serviceStartedTimeLabel)
//        }
//        hoursView.frame = CGRect(x: 0, y: height, width: width, height: height)
//        hoursView.backgroundColor = UIColor(white: 0, alpha: 0.7)
//        view.addSubview(hoursView)
//        
//        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: height-190, width: width, height: 40))
//        
//        navigationBar.backgroundColor = UIColor.white
//        navigationBar.delegate = self as? UINavigationBarDelegate
//        
//        
////        UIBarButtonItem.appearance().tintColor = UIColor.black
//        
//        navigationBar.backgroundColor = UIColor.brown
//        
//        let navigationItem = UINavigationItem()
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(hidePickerView))
////        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
//        let barbuttonFont = UIFont(name: "Ubuntu-Light", size: 20) ?? UIFont.systemFont(ofSize: 20)
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: barbuttonFont, NSForegroundColorAttributeName:UIColor.black], for: UIControlState.normal)
//        // Assign the navigation item to the navigation bar
//        navigationBar.items = [navigationItem]
//        hoursView.addSubview(navigationBar)
//        
//        hourPickerView.frame = CGRect(x: 0, y: height-150, width: width, height: 150)
//        hourPickerView.backgroundColor = UIColor.white
//        hourPickerView.delegate = self
//        hourPickerView.dataSource = self
//        hoursView.addSubview(hourPickerView)
//        hourPickerView.selectRow(1, inComponent: 0, animated: true)
//        
//        mainView.addConstraintsWithFormat("V:|[v0(140)]-10-[v1(140)][v2(140)][v3(140)][v4(140)]", views: topView, view1, view2, view3, view4)
//        mainView.addConstraintsWithFormat("H:|[v0]|", views: view1)
//        mainView.addConstraintsWithFormat("H:|[v0]|", views: view2)
//        
//        
//        ambContactNo = delegate.refreshData[safe: 14]!
//
//    }
//    var headingLabel2: UILabel!
//    var commentTextView = UITextView()
//    var doneButton = UIButton()
//    var rating = 0
//    var ratingButtons = [UIButton]()
//    var spacing = 5
//    var stars = 5
//    var ht = 0
//    var chauffeurLabel: UILabel!
//    var labelText = NSLocalizedString("Chauffeur", comment: "")
//    var mainView3 = UIView()
//    func hideKeyBoard1(){
//        view.endEditing(true)
//    }
//    func chauffeurFeedback(check:CGFloat){
//        
//        mainView3.frame = CGRect(x: check, y: 100, width: width, height: height-100)
//        mainView3.isUserInteractionEnabled = true
//        let tapOnView3 = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard1))
//        mainView3.addGestureRecognizer(tapOnView3)
//        view.addSubview(mainView3)
//        
//        headingLabel2 = drawservicing.makeLabel("FEEDBACK", screenWidth: width!, heading: "subHeading")
//        headingLabel2!.font = UIFont(name:"HelveticaNeue-Bold", size: 14)
//        headingLabel2!.textColor = UIColor(red: 242/255.0, green: 103.0/255.0, blue: 33.0/255.0, alpha: 1.0)
//        mainView3.addSubview(headingLabel2!)
//        
//        let line1 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        headingLabel2!.layer.addSublayer(line1)
//        
//        chauffeurLabel = drawservicing.makeLabel("Chauffeur", screenWidth: width, heading: "subHeading")
//        chauffeurLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
//        chauffeurLabel.textColor = UIColor(white: 0, alpha: 0.7)
//        chauffeurLabel.text = labelText
//        headingLabel2.addSubview(chauffeurLabel)
//        
//        let ratingView = UIView()
//        ratingView.translatesAutoresizingMaskIntoConstraints = false
//        mainView3.addSubview(ratingView)
//        
//        commentTextView.backgroundColor = UIColor(red: 236.0/255.0, green: 236.0/255.0, blue: 236.0/255.0, alpha: 1.0)
//        commentTextView.translatesAutoresizingMaskIntoConstraints = false
//        commentTextView.isHidden = true
//        commentTextView.delegate = self
//        mainView3.addSubview(commentTextView)
//        
//        doneButton.backgroundColor = style.editCarButtonFontColor
//        doneButton.translatesAutoresizingMaskIntoConstraints = false
//        doneButton.setTitle(NSLocalizedString("DONE", comment: ""), for: UIControlState())
//        doneButton.titleLabel?.font = style.editCarButtonFont
//        doneButton.isUserInteractionEnabled = false
//        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
//        mainView3.addSubview(doneButton)
//        
//        let viewsDictionary = ["ratingView": ratingView, "commentTextView": commentTextView, "doneButton": doneButton]
//        let gap = 23
//        let doneButtonGap = Int((width-80))/2
//        let viewsMetric = ["gap": gap, "ht": ht, "doneButtonGap": doneButtonGap]
//        
//        mainView3.addConstraintsWithFormat("V:|-15-[v0]-30-[v1]-20-[v2(40)]-10-[v3(100)]-10-[v4(40)]", views: headingLabel2, chauffeurLabel, ratingView, commentTextView, doneButton)
//        mainView3.addConstraintsWithFormat("H:|-23-[v0]", views: headingLabel2)
//        headingLabel2.addConstraintsWithFormat("H:|[v0]", views: chauffeurLabel)
//        let ratingViewHorConst: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-gap-[ratingView(200)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: viewsMetric, views: viewsDictionary) as NSArray
//        mainView3.addConstraints(ratingViewHorConst as! [NSLayoutConstraint])
//        
//        let commentTextViewHorConst: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[commentTextView]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: viewsMetric, views: viewsDictionary) as NSArray
//        mainView3.addConstraints(commentTextViewHorConst as! [NSLayoutConstraint])
//        
//        let doneButtonHorConst: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-doneButtonGap-[doneButton(80)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: viewsMetric, views: viewsDictionary) as NSArray
//        mainView3.addConstraints(doneButtonHorConst as! [NSLayoutConstraint])
//        
//        
//        let filledStarImage = shapes.ratingStar("filled")
//        let emptyStarImage = shapes.ratingStar("emptyStar")
//        
//        for _ in 0..<5 {
//            let button = UIButton()
//            button.frame = CGRect(x: CGFloat(ht), y: 20, width: 40, height: 40)
//            button.translatesAutoresizingMaskIntoConstraints = false
//            button.setImage(emptyStarImage, for: UIControlState())
//            button.setImage(filledStarImage, for: .selected)
//            button.setImage(filledStarImage, for: [.highlighted, .selected])
//            
//            button.adjustsImageWhenHighlighted = false
//            
//            button.addTarget(self, action: #selector(ratingButtonTapped(_:)), for: .touchDown)
//            ratingButtons += [button]
//            ratingView.addSubview(button)
//            
//            let dictionary = ["button": button]
//            let metric = ["ht": ht]
//            
//            let horConst:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-ht-[button(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric, views: dictionary) as NSArray
//            ratingView.addConstraints(horConst as! [NSLayoutConstraint])
//            let verConst:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|[button(40)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictionary) as NSArray
//            ratingView.addConstraints(verConst as! [NSLayoutConstraint])
//            ht += 40
//        }
//    }
//    func textViewDidChange(_ textView: UITextView) {
//        print(commentTextView.text.characters.count)
//        if(commentTextView.text.characters.count == 0){
//            doneButton.isUserInteractionEnabled = false
//        }
//        else{
//            doneButton.isUserInteractionEnabled = true
//        }
//        
//    }
//    func ratingUpdate(_ notification: Notification){
//        var index:Int!
//        for i in 0..<delegate.bookedCars.count{
//            if(delegate.selectedCarID == delegate.bookedCars[i][safe: 1]!){
//                index = i
//                break
//            }
//            
//        }
//        delegate.bookedCars.remove(at: index)
//        
//        self.dismiss(animated: true, completion: {
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "refreshColl"), object: nil)
//        })
////        self.present(ViewController(), animated: true, completion: nil)
//    }
//    func doneButtonClicked(){
//        var comment = "Null"
//        if(commentTextView.text.characters.count > 0){
//            comment = commentTextView.text
//        }
//        
//        let passData = PassData()
//        let str1 = "RATING!" + delegate.refreshData[safe: 0]! + "|0|"
//        let str2 = "0|" + String(rating) + "|" + comment + "|"
//        let str = str1 + str2
//        passData.dataCheck(str)
//    }
//    
//    func ratingButtonTapped(_ button: UIButton) {
//        rating = ratingButtons.index(of: button)! + 1
//        print(ratingButtons.index(of: button)!+1)
//        if(ratingButtons.index(of: button)!+1 < 3){
//            commentTextView.isHidden = false
//            
//        }
//        else{
//            commentTextView.isHidden = true
//            doneButton.isUserInteractionEnabled = true
//        }
//        updateButtonSelectionStates()
//    }
//    func updateButtonSelectionStates() {
//        for (index, button) in ratingButtons.enumerated() {
//            // If the index of a button is less than the rating, that button should be selected.
//            button.isSelected = index < rating
//        }
//    }
//    var reason = "1"
//    var cancelCheck = 0
//    func cancelButtonClicked(){
//        let cancelBooking = "CANCELBOOKING!" + delegate.bookingID + "|" + reason + "|"
//        passData.dataCheck(cancelBooking)
//    }
//    func cancelFromEnroute(){
//        cancelCheck = 2
//        cancelFromButtonClicked1()
//    }
//    func cancelFromReqUestingView(){
//        cancelCheck = 1
//        cancelFromButtonClicked1()
//    }
//    func cancelFromButtonClicked(){
//        cancelCheck = 1
//        let cancelBooking = "CANCELBOOKING!" + delegate.bookingID + "|" + reason + "|"
//        passData.dataCheck(cancelBooking)
//        requestingTimer.isHidden = true
//    }
//    func cancelFromButtonClicked1(){
////        cancelCheck = 3
//        let alertController = UIAlertController(title: "21North", message: NSLocalizedString("What do you want to do?", comment: ""), preferredStyle: .actionSheet)
//        
//        for i in 0..<reasonsArray.count{
//            let takePhotoAction = UIAlertAction(title: reasonsArray[i][1], style: .default, handler: {
//                action in
//                self.reason = self.reasonsArray[i][0]
//                self.cancelButtonClicked()
////            self.openCamera()
//            })
//        alertController.addAction(takePhotoAction)
//        }
////        let choosePhotoAction = UIAlertAction(title: "Personal Reason", style: .default, handler: {
////            action in
//////            self.openGallary()
////            self.reason = "2"
////            self.cancelButtonClicked()
////        }
////        )
////        alertController.addAction(choosePhotoAction)
//        
//        let defaultAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: nil)
//        alertController.addAction(defaultAction)
//        present(alertController, animated: true, completion: nil)
////        let cancelBooking = "CANCELBOOKING!" + delegate.bookingID
////        passData.dataCheck(cancelBooking)
//    }
//    func cancelConfirm(notification: Notification){
//        let pin = notification.userInfo?["CANCELBOOKING"] as! String
//        let pinBrk = pin.characters.split(separator: "$").map(String.init)
//        for i in 0..<delegate.carArray.count{
//            if(delegate.carArray[i][0] == delegate.selectedCarID){
//                delegate.carArray[i][6] = pinBrk[safe: 0]!
//            }
//        }
//        if(cancelCheck == 1 || cancelCheck == 3){
//            passData.clickTrack(dataString: "40")
//            timer.invalidate()
//            timerUpdate.invalidate()
//            var index:Int!
//            for i in 0..<delegate.bookedCars.count{
//                if(delegate.bookingID == delegate.bookedCars[i][0]){
//                    index = i
//                    break
//                }
//            }
//            if(index != nil){
//                delegate.bookedCars.remove(at: index)
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshColl"), object: nil)
//            }
//            headingLabelReq.text = NSLocalizedString("Booking Cancelled", comment: "")
//            okButton.isHidden = false
//            cancelbutton1.isHidden = true
//            requestingTimer.isHidden = true
//            
//            let str = "CHAUFPULOC!" + latLong
//            passData.dataCheck(str)
////            UIView.animate(withDuration: 0.20, animations: {
////                self.requestingView.frame.origin.x = 2*self.width!
////            }, completion: nil)
////            timeOut = intialTimerValue
////            self.requestingView.removeFromSuperview()
//        }
//        else{
//            passData.clickTrack(dataString: "41")
//            var index:Int!
//            for i in 0..<delegate.bookedCars.count{
//                if(delegate.selectedCarID == delegate.bookedCars[i][1]){
//                    index = i
//                    break
//                }
//                
//            }
//            delegate.bookedCars.remove(at: index)
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshColl"), object: nil)
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
//    func hideRequestingView(){
//        UIView.animate(withDuration: 0.20, animations: {
//            self.requestingView.frame.origin.x = 2*self.width!
//        }, completion: nil)
//        timeOut = intialTimerValue
//        self.requestingView.removeFromSuperview()
//    }
//    func showChaufferLoc(){
//        self.present(LocateAmbassador(), animated: true, completion: nil)
//    }
//    var ambContactNo = "7828517647"
//    func callAmb(){
//        callNumber(ambContactNo)
//    }
//    fileprivate func callNumber(_ phoneNumber:String) {
//        if let phoneCallURL:URL = URL(string: "tel://\(phoneNumber)") {
//            let application:UIApplication = UIApplication.shared
//            if (application.canOpenURL(phoneCallURL)) {
//                application.openURL(phoneCallURL);
//            }
//        }
//    }
//    var multipleAmount: Float!
//    var loadingView = UIView()
//    var estimateLabelText = String()
//    var stopRefr = 0
//    var etaTimeInterval = "0"
//    var intialTimerValue:Int!
//    var reasonsArray = [[String]]()
//    
//    func onLoad(){
//        stopRefr = 1
//        self.loadingView.removeFromSuperview()
//        let pin = delegate.pickupData//(notification as NSNotification).userInfo!["PICKUPDATA"] as! String
//        let data = pin.characters.split(separator: "^").map(String.init)
//        let userData = data[safe: 0]!.characters.split(separator: "|").map(String.init)
//        
//        let finalData = userData[safe: 0]!.characters.split(separator: "$").map(String.init)
//        let numberOfHours = Int(finalData[safe: 4]!)!
//        hoursArray.removeAll()
//        for i in 0..<numberOfHours{
//            hoursArray.append(i+1)
//        }
//        let timebreak = data[safe: 1]!.characters.split(separator: "$").map(String.init)
//        timeOut = Int(timebreak[safe: 0]!)!
//        intialTimerValue = Int(timebreak[safe: 0]!)!
//        etaTimeInterval = timebreak[safe: 1]!
//        if(timebreak[safe: 1]! == "-1"){
//            etaTimeLabel.text = "0"
//            reqChauffeurButton.isEnabled = false
//            reqChauffeurButton.setTitle("Chauffeur Not Available", for: .normal)
//        }
//        else{
//            etaTimeLabel.text = timebreak[safe: 1]! + " minutes"
////            reqChauffeurButton.isEnabled = true
//            reqChauffeurButton.setTitle("REQUEST CHAUFFEUR", for: .normal)
//        }
//        hourPickerView.reloadAllComponents()
//        multipleAmount = Float(finalData[safe: 3]!)
//        estimateLabelText = finalData[safe: 3]!
//        estimateFeeLabel.text = "\u{20B9} " + finalData[safe: 3]!  + " per minute"
//        amountLabel.text = "\u{20B9} " + String(120*multipleAmount)
//        
//        let reasons = data[safe: 2]!.characters.split(separator: "|").map(String.init)
//        reasonsArray.removeAll()
//        for rs in 0..<reasons.count{
//            let reason = reasons[rs].characters.split(separator: "$").map(String.init)
//            reasonsArray.append([reason[safe: 0]!, reason[safe: 1]!])
//        }
//        
//        if(data.count>3){
//            timeOut = Int(data[safe: 3]!)!
//            requestingChauffer()
//            UIView.animate(withDuration: 0.20, animations: {
//                self.requestingView.frame.origin.x = 0
//                }, completion: nil)
//            
//        }
//        else{
//            let str = "CHAUFPULOC!" + latLong
//            passData.dataCheck(str)
//        }
//        if(timeOut<0){
//            cancelFromButtonClicked()
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "refreshColl"), object: nil)
//        }
//    }
//    func timerExp(){
//        print(delegate.bookingID)
//        if(delegate.bookingID != "0"){
//            cancelFromButtonClicked()
//        }
//        else{
//            UIView.animate(withDuration: 0.20, animations: {
//                self.requestingView.frame.origin.x = 2*self.width!
//                }, completion: nil)
//        }
//    }
//    var timer = Timer()
//    var timeOut = Int()
//    func reqChauffeurClicked(){
//        let pickupLocaWithLat = "ADDBOOKING!" + pickupLocLabel.text! + "|" + latLong!
//        let dropLocWithLat = dropLocLabel.text! + "|" + dropLatLong!
//        let createBooking1 = "00 00" + "|"
//        let complainlabel =   String(hoursArray[hourPickerView.selectedRow(inComponent: 0)]) + "|0|"
//        let createBooking2 = (delegate.selectedCarID) + "|2|"
//        let createBooking3 = cityName! + "|0"
//        let createBooking4 = "|0$0|" + promoSuccess + "|"
////                    let createBooking4 = "|" + selectedTimeID! + "|"
//        let CBooking1 = pickupLocaWithLat + dropLocWithLat + createBooking1 + complainlabel + createBooking2 + createBooking3 + createBooking4
//        print(CBooking1)
//        passData.dataCheck(CBooking1)
//    }
//    func anmiateChangehour(){
//        passData.clickTrack(dataString: "38")
//        UIView.animate(withDuration: 0.20, animations: {
//                self.hoursView.frame.origin.y = 0
//            }, completion: nil)
//    
//    }
//    func pickupDataOnLocationChange(notification: NSNotification){
//        let pin = notification.userInfo?["PICKUPDATA"] as! String
//        delegate.pickupData = pin
//        onLoad()
//        let str = "CHAUFPULOC!" + latLong
//        passData.dataCheck(str)
//    }
//    func mapLocationSet(_ notification: Notification){
//        let pin = (notification as NSNotification).userInfo!["Location"] as! String
//        
//        let check = (notification as NSNotification).userInfo!["check"] as! String
//        let latFromMap = (notification as NSNotification).userInfo!["lat"] as! String
//        let longFromMap = (notification as NSNotification).userInfo!["long"] as! String
//        switch delegate.currentScreenNo {
//        case -1:
//            if(check == "1"){
//                pickupLocLabel.text = pin
//                dropLocLabel.text = pin
//                pickupLocLabel.reloadInputViews()
//                dropLocLabel.reloadInputViews()
//                latLong = latFromMap + "|" + longFromMap + "|"
//                pickupLat = Double(latFromMap)
//                pickupLong = Double(longFromMap)
//                dropLat = Double(latFromMap)
//                dropLong = Double(longFromMap)
//                let str = "CHAUFPULOC!" + latLong
//                passData.dataCheck(str)
//                dropLatLong = latLong
//                let completeString1 = "PICKUPVIEW!" + "2|" + latLong!
//                let completeString2 = self.delegate.selectedBrandID + "|"
//                let completeString = completeString1 + completeString2
//                print(completeString)
//                self.passData.dataCheck(completeString)
//                
//                NotificationCenter.default.addObserver(self, selector: #selector(pickupDataOnLocationChange), name: NSNotification.Name(rawValue: "PICKUPDATA"), object: nil)
//            }
//            else{
//                dropLocLabel.text = pin
//                dropLocLabel.reloadInputViews()
//                dropLatLong = latFromMap + "|" + longFromMap + "|"
//                dropLat = Double(latFromMap)
//                dropLong = Double(longFromMap)
//            }
//            break
//        case 20:
//            if(check == "1"){
//                pickupLocLabel.text = pin
//                dropLocLabel.text = pin
//                pickupLocLabel.reloadInputViews()
//                dropLocLabel.reloadInputViews()
//                latLong = latFromMap + "|" + longFromMap + "|"
//                dropLatLong = latLong
//                pickupLat = Double(latFromMap)
//                pickupLong = Double(longFromMap)
//                dropLat = Double(latFromMap)
//                dropLong = Double(longFromMap)
////                let str = "CHAUFPULOC!" + latLong
////                passData.dataCheck(str)
//                
//                let completeString1 = "PICKUPVIEW!" + "2|" + latLong!
//                let completeString2 = self.delegate.selectedBrandID + "|"
//                let completeString = completeString1 + completeString2
//                print(completeString)
//                self.passData.dataCheck(completeString)
//                
//                NotificationCenter.default.addObserver(self, selector: #selector(pickupDataOnLocationChange), name: NSNotification.Name(rawValue: "PICKUPDATA"), object: nil)
//            }
//            else{
//                dropLocLabel.text = pin
//                dropLocLabel.reloadInputViews()
//                dropLatLong = latFromMap + "|" + longFromMap + "|"
//                dropLat = Double(latFromMap)
//                dropLong = Double(longFromMap)
//            }
//            break
//        default:
//            dropOffLocationLabel.text = pin
//        }
//        
//    }
//    func back_btn_clicked(){
//        
//        if(delegate.currentScreenNo == 24){
//            if(buttonCheck == 0){
//                //            self.present(ViewController(), animated: true, completion: nil)
//                passData.clickTrack(dataString: "59")
//                self.dismiss(animated: true, completion: nil)
//            }
//            else if(buttonCheck == 1){
//                UIView.animate(withDuration: 0.20, animations: {
//                    self.headingLabel.frame.origin.x = 21
//                    self.view1.frame.origin.x = 0
//                    self.view2.frame.origin.x = 0
//                    self.view3.frame.origin.x = 0
//                    self.payButton.frame.origin.x = self.buttonOrigin
//                    self.viewEstimatePage.frame.origin.x = self.width
//                    }, completion: nil)
//                buttonCheck = 0
//            }
//        }
//        else{
//            if(stopRefr == 1){
//                passData.dataCheck("STOPCHAUFPULOC!")
//            }
//            passData.clickTrack(dataString: "59")
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
//    func dropOff(){
//        passData.clickTrack(dataString: "37")
//        let newVC = MapView()
//        newVC.from = 2
//        newVC.latitude = dropLat
//        newVC.longitude = dropLong
//        self.present(newVC, animated: true, completion: nil)
//    }
//    func pickLoc(){
//        passData.clickTrack(dataString: "36")
//        let newVC = MapView()
//        newVC.latitude = pickupLat
//        newVC.longitude = pickupLong
//        newVC.from = 1
//        self.present(newVC, animated: true, completion: nil)
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        
//        return String(hoursArray[row])
//        
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        
//        return hoursArray.count
//        
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if(hoursArray[row] == 1){
//            approxHourLabel.text = String(hoursArray[row]) + " Hour"
//        }
//        else{
//            approxHourLabel.text = String(hoursArray[row]) + " Hours"
//        }
//        let amount:Float = Float(hoursArray[row]) * 60 * multipleAmount
//        amountLabel.text = "\u{20B9} " + String(amount)
//    }
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    var cityName:String!
//    
//    func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D){
//        let geocoder = GMSGeocoder()
//        
//        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
//            if let address = response?.firstResult() {
//                let lines = address.lines as [String]!
//                let city = address.locality?.characters.split(separator: " ").map(String.init)
//                self.cityName = city![safe: 0]!
////                let cityName = placeMark.locality?.characters.split(" ").map(String.init)
//                self.pickupLocLabel.text = lines?.joined(separator: "")
//                self.dropLocLabel.text = lines?.joined(separator: "")
//                if(self.etaTimeLabel.text != "0"){
//                    self.reqChauffeurButton.isEnabled = true
//                }
//            }
//        }
//        
//    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            
//            reverseGeocodeCoordinate(location.coordinate)
//            locationManager.stopUpdatingLocation()
//        }
//        
//    }
//    func hidePickerView(){
//        UIView.animate(withDuration: 0.20, animations: {
//                self.hoursView.frame.origin.y = self.height
//            }, completion: nil)
//    }
//    let requestingView = UIView()
//    let awaitingAnimation = Awaiting()
//    let requestingTimer = UILabel()
//    var cancelbutton1 = UIButton()
//    var headingLabelReq = UILabel()
//    var okButton = UIButton()
//    var timerUpdate = Timer()
//    func requestingChauffer(){
//        
//        requestingView.frame = CGRect(x: width, y: 0, width: width, height: height)
//        requestingView.backgroundColor = UIColor(white: 0, alpha: 0.7)
//        view.addSubview(requestingView)
//        awaitingAnimation.frame = CGRect(x: 0, y: (height-2)/2, width: width, height: 2)
//        requestingView.addSubview(awaitingAnimation)
//        awaitingAnimation.addUntitled1Animation()
//        let homePageIcon = HomePageIcon()
//        
//        cancelbutton1.setImage(homePageIcon.editIcon("cancelButton"), for: .normal)
//        cancelbutton1.frame = CGRect(x: (width-42)/2, y: 321, width: 42, height: 42)
//        cancelbutton1.backgroundColor = UIColor.black
//        cancelbutton1.layer.cornerRadius = 21
//        cancelbutton1.clipsToBounds = true
//        cancelbutton1.isHidden = false
//        cancelbutton1.addTarget(self, action: #selector(cancelFromReqUestingView), for: .touchUpInside)
//        requestingView.addSubview(cancelbutton1)
//        
//        okButton.setTitle("OK", for: .normal)
//        okButton.frame = CGRect(x: (width-42)/2, y: 321, width: 42, height: 42)
//        okButton.backgroundColor = style.editCarButtonFontColor
//        okButton.layer.cornerRadius = 21
//        okButton.clipsToBounds = true
//        okButton.addTarget(self, action: #selector(hideRequestingView), for: .touchUpInside)
//        okButton.isHidden = true
//        requestingView.addSubview(okButton)
//        
//        requestingTimer.frame = CGRect(x: 0, y: 380, width: width, height: 18)
//        requestingTimer.text = "00:" + "\(timeOut)"
//        requestingTimer.textAlignment = .center
//        requestingTimer.textColor = UIColor.white
//        requestingTimer.isHidden = false
//        requestingView.addSubview(requestingTimer)
//        
//        timerUpdate = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
//        
//        
//        headingLabelReq.frame = CGRect(x: 0, y: (height-100)/2, width: width, height: 19)
//        headingLabelReq.textAlignment = .center
//        headingLabelReq.text = NSLocalizedString("Requesting Chauffer", comment: "")
//        headingLabelReq.font = UIFont(name: "HelveticaNeue", size: 15)
//        headingLabelReq.textColor = UIColor.white
//        requestingView.addSubview(headingLabelReq)
//        
////        animateBackground()
//    }
//    func countDown(){
//        timeOut = timeOut - 1
//        if(timeOut<10){
//            requestingTimer.text = "00:0" + "\(timeOut)"
//        }
//        else{
//            requestingTimer.text = "00:" + "\(timeOut)"
//        }
//        if(timeOut == 0){
//            timerUpdate.invalidate()
//            timerExp()
//        }
//    }
//    func animateBackground() {
//        
//        
//        // UIImageView 1
//        let backgroundImageView1 = UIView()//UIImageView(image: backgroundImage)
//        backgroundImageView1.frame = CGRect(x: self.requestingView.bounds.width, y: self.requestingView.frame.size.height/2, width: 140, height: 5)
//        backgroundImageView1.backgroundColor = UIColor.orange
//        self.requestingView.addSubview(backgroundImageView1)
//        
//        let backgroundImageView2 = UIView()//UIImageView(image: backgroundImage)
//        backgroundImageView2.frame = CGRect(x: self.requestingView.bounds.width, y: self.requestingView.frame.size.height/2, width: 140, height: 5)
//        backgroundImageView2.backgroundColor = UIColor.orange
//        self.requestingView.addSubview(backgroundImageView2)
//        
//        
//        // Animate background
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.repeat, .curveLinear], animations: {
//            backgroundImageView1.frame = backgroundImageView1.frame.offsetBy(dx: -3.5 * backgroundImageView1.frame.size.width, dy: 0.0)
//            
//            }, completion: nil)
//        UIView.animate(withDuration: 2.0, delay: 1.0, options: [.repeat, .curveLinear], animations: {
//            backgroundImageView2.frame = backgroundImageView2.frame.offsetBy(dx: -3.5 * backgroundImageView1.frame.size.width, dy: 0.0)
//            
//            }, completion: nil)
//    }
//}
//extension RequestChauffer: GMSMapViewDelegate {
//    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//        reverseGeocodeCoordinate(position.target)
//    }
//}
//extension RequestChauffer: sendDataFromDelegate{
//    func updateLink(data: String){
//        
//    }
//}

