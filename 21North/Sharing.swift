//
//  Sharing.swift
//  21North
//
//  Created by Sachin Tomar on 05/10/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation

class Sharing: BaseViewController {
    
    let style = Style()
    let drawservicing = DrawServicing()
    let shapes = Shapes()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let homePageIcon = HomePageIcon()
    
    var width: CGFloat!
    var height: CGFloat!
    
    let profileImageView = UIImageView()
    let creditLabel = UILabel()
    var promoCodeLabel = UILabel()
    let yourPromoLabel = UILabel()
    var getRsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataCreator.sharedInstance.currentScreen = ""
        
        view.backgroundColor = UIColor.white
        
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        
        let cross = shapes.drawShapes(type: "cross")
        let closeButtonItem = NavigationItemModel(title: nil, image: cross, highlitedImage: nil, action: #selector(backButtonClicked), type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        profileImageView.layer.cornerRadius = 41
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = UIColor.gray
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.image = Helper.loadImageFromPath()
        profileImageView.autoSetDimension(.width, toSize: 82.0)
        profileImageView.autoSetDimension(.height, toSize: 82.0)
        profileImageView.autoPinEdge(toSuperviewEdge: .top, withInset: navigationHeight+50.0)
        profileImageView.autoAlignAxis(.vertical, toSameAxisOf: self.view, withOffset: 0.0)
        
        view.addSubview(creditLabel)
        creditLabel.text = NSLocalizedString("Your Credits ", comment: "") + "\u{20B9} " + DataCreator.sharedInstance.loginResponse.userCredits
        creditLabel.font = style.editCarTextFieldFont
        creditLabel.textColor = style.labelFontColor
        creditLabel.textAlignment = .center
        creditLabel.autoPinEdge(.top, to: .bottom, of: profileImageView, withOffset: 30)
        creditLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        creditLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority(rawValue: 1000.0)) {
            creditLabel.contentCompressionResistancePriority(for: .vertical)
        }
        
        getRsLabel.text = DataCreator.sharedInstance.loginResponse.pcodeText
        getRsLabel.font = style.editCarTextFieldFont
        getRsLabel.textColor = style.labelFontColor
        getRsLabel.textAlignment = .center
        view.addSubview(getRsLabel)
        getRsLabel.autoPinEdge(.top, to: .bottom, of: creditLabel, withOffset: 10)
        getRsLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        getRsLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority(rawValue: 1000.0)) {
            getRsLabel.contentCompressionResistancePriority(for: .vertical)
        }
        
        yourPromoLabel.text = "Your Promo Code"
        yourPromoLabel.font = style.promoLabelFont
        yourPromoLabel.textColor = style.promoLabelColor
        yourPromoLabel.textAlignment = .center
        view.addSubview(yourPromoLabel)
        yourPromoLabel.autoPinEdge(.top, to: .bottom, of: getRsLabel, withOffset: 10)
        yourPromoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        yourPromoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority(rawValue: 1000.0)) {
            yourPromoLabel.contentCompressionResistancePriority(for: .vertical)
        }
        
        promoCodeLabel.text = DataCreator.sharedInstance.loginResponse.pcode
        promoCodeLabel.font = style.promoCodeFont
        promoCodeLabel.textColor = style.labelFontColor
        promoCodeLabel.textAlignment = .center
        view.addSubview(promoCodeLabel)
        promoCodeLabel.autoPinEdge(.top, to: .bottom, of: yourPromoLabel, withOffset: 10)
        promoCodeLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        promoCodeLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority(rawValue: 1000.0)) {
            promoCodeLabel.contentCompressionResistancePriority(for: .vertical)
        }
        
        let shareButton = UIButtonWithPadding()
        shareButton.setTitle(NSLocalizedString("SHARE PROMO CODE", comment: ""), for: UIControlState())
        shareButton.setTitleColor(style.labelFontColor, for: UIControlState())
        shareButton.layer.borderWidth = 1
        shareButton.layer.borderColor = style.borderColor
        shareButton.titleLabel?.font = style.editCarTextFieldFont
        view.addSubview(shareButton)
        shareButton.addTarget(self, action: #selector(sharePromoCode), for: .touchUpInside)
        shareButton.autoPinEdge(.top, to: .bottom, of: promoCodeLabel, withOffset: 10)
        shareButton.autoAlignAxis(.vertical, toSameAxisOf: self.view, withOffset: 0.0)
        shareButton.autoSetDimension(.height, toSize: 30.0)
        shareButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        shareButton.autoSetDimension(.width, toSize: 30.0, relation: .greaterThanOrEqual)
    }
    
    @objc func sharePromoCode(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        let shareText = "Please use this \(DataCreator.sharedInstance.loginResponse.pcode) promo code while registering for the 21North App. \n Download 21North app http://www.21north.in/app/"
        let title = "Check this out - Really good App for your Vehicle Needs - 21North"
        
        //Use UIActivityViewController to share
        let shareViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        shareViewController.setValue(title, forKey: "Subject")
        Helper.topMostController().present(shareViewController, animated: true, completion: nil)
    }
    
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        //        passData.clickTrack(dataString: "59")
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromBottom
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
}

