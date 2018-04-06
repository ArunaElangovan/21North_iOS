//
//  LocationService.swift
//  21North
//
//  Created by Sachin Tomar on 13/12/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation

class LocationService: BaseViewController{
    
    let companyLogo = Companylogo()
    let drawservicing = DrawServicing()
    let style = Style()
    var width: CGFloat!
    var height: CGFloat!
    var logoImageView = UIImageView()
    var mainView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        view.backgroundColor = UIColor.black
        
        mainView.backgroundColor = UIColor.black
        view.addSubview(mainView)
        view.addConstraintsWithFormat("H:|[v0]|", views: mainView)
        view.addConstraintsWithFormat("V:|[v0]|", views: mainView)
        
        logoImageView = companyLogo.coloredLogo()
        mainView.addSubview(logoImageView)
        
        let logoFromLeft = (width - 170)/2
        mainView.addConstraintsWithFormat("H:|-(\(logoFromLeft))-[v0]", views: logoImageView)
        
        let contentLabel1 = drawservicing.makeLabel("21North needs your", screenWidth: width, heading: "heading")
        contentLabel1.textAlignment = .center
        contentLabel1.textColor = style.enableLocationFontColor
        contentLabel1.font = style.enableLocationFont
        mainView.addSubview(contentLabel1)
        mainView.addConstraintsWithFormat("H:|[v0]|", views: contentLabel1)
        
        let contentLabel2 = drawservicing.makeLabel("location to continue", screenWidth: width, heading: "heading")
        mainView.addSubview(contentLabel2)
        contentLabel2.textAlignment = .center
        contentLabel2.textColor = style.enableLocationFontColor
        contentLabel2.font = style.enableLocationFont
        mainView.addConstraintsWithFormat("H:|[v0]|", views: contentLabel2)
        
        let contentLabel3 = drawservicing.makeLabel("We use this to set your pickup location", screenWidth: width, heading: "heading")
        mainView.addSubview(contentLabel3)
        contentLabel3.textAlignment = .center
        contentLabel3.textColor = style.enableLocationFontColor1
        contentLabel3.font = style.promoLabelFont
        mainView.addConstraintsWithFormat("H:|[v0]|", views: contentLabel3)
        
        let contentLabel4 = drawservicing.makeLabel("and improve our services", screenWidth: width, heading: "heading")
        mainView.addSubview(contentLabel4)
        contentLabel4.textAlignment = .center
        contentLabel4.textColor = style.enableLocationFontColor1
        contentLabel4.font = style.promoLabelFont
        mainView.addConstraintsWithFormat("H:|[v0]|", views: contentLabel4)
        
        let enableButton = UIButton()
        enableButton.setTitle("ENABLE LOCATION SERVICE", for: .normal)
        enableButton.backgroundColor = style.cellBackColor1
        enableButton.titleLabel?.font = style.enableButtonFont
        enableButton.setTitleColor(UIColor.black, for: .normal)
        enableButton.addTarget(self, action: #selector(openSetting), for: .touchUpInside)
        mainView.addSubview(enableButton)
        let enableButtonFromLeft = (width-245)/2
        mainView.addConstraintsWithFormat("H:|-(\(enableButtonFromLeft))-[v0]-(\(enableButtonFromLeft))-|", views: enableButton)
        
        mainView.addConstraintsWithFormat("V:|-47-[v0]-58-[v1][v2]-30-[v3][v4]-91-[v5(40)]", views: logoImageView, contentLabel1, contentLabel2, contentLabel3, contentLabel4, enableButton)
        if(CLLocationManager.locationServicesEnabled()){
            
        }
        NotificationCenter.default.addObserver(self, selector: #selector(back), name: NSNotification.Name(rawValue: "dismiss"), object: nil)
    }
    
    @objc func back(){
        dismiss(animated: true, completion: nil)
    }
    @objc func openSetting(){
        let settingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
        if let url = settingsUrl {
            UIApplication.shared.openURL(url as URL)
        }
    }
}

