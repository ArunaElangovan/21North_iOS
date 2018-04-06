//
//  LaunchScreen.swift
//  21North
//
//  Created by Sachin Tomar on 31/01/17.
//  Copyright © 2017 Sachin Tomar. All rights reserved.
//

import Foundation

class launchScreen: UIViewController{

    var width: CGFloat!
    var height: CGFloat!
    
    let homePageClass = HomePageIcon()
    let style = Style()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        
        view.backgroundColor = style.editCarButtonFontColor
        
        let logo = homePageClass.launchLogo()
        view.addSubview(logo)
        
        let firstLineMsgLabel = UILabel()
        firstLineMsgLabel.textAlignment = .center
        firstLineMsgLabel.textColor = UIColor.white
        let str = NSLocalizedString("Vehicle Servicing", comment: "") + " | " + NSLocalizedString("Chauffeur Service", comment: "")
        let attributedString = NSMutableAttributedString(string: str)
        attributedString.addAttribute(NSAttributedStringKey.kern, value: CGFloat(1.4), range: NSRange(location: 0, length: str.count))
        firstLineMsgLabel.attributedText = attributedString
        firstLineMsgLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLineMsgLabel.font = UIFont(name: "Roboto-Medium", size: 14)
        view.addSubview(firstLineMsgLabel)
        view.addConstraintsWithFormat("H:|[v0]|", views: firstLineMsgLabel)
        
        let secLineMsgLabel = UILabel()
        secLineMsgLabel.textAlignment = .center
        secLineMsgLabel.textColor = UIColor.white
        let str2 = NSLocalizedString("Roadside Assistance", comment: "")
        let attributedString1 = NSMutableAttributedString(string: str2)
        attributedString1.addAttribute(NSAttributedStringKey.kern, value: CGFloat(1.4), range: NSRange(location: 0, length: str2.count))
        secLineMsgLabel.attributedText = attributedString1
        secLineMsgLabel.translatesAutoresizingMaskIntoConstraints = false
        secLineMsgLabel.font = UIFont(name: "Roboto-Medium", size: 14)
        view.addSubview(secLineMsgLabel)
        view.addConstraintsWithFormat("H:|[v0]|", views: secLineMsgLabel)
        
        let horGap = (width-200)/2
        let verGap = (height/2) - 86
        view.addConstraintsWithFormat("H:|-(\(horGap))-[v0]", views: logo)
        view.addConstraintsWithFormat("V:|-(\(verGap))-[v0]-30-[v1]-3-[v2]", views: logo, firstLineMsgLabel, secLineMsgLabel)
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(dismissIt), userInfo: nil, repeats: false)
    }
    @objc func dismissIt(){
        self.dismiss(animated: true, completion: nil)
    }
}
