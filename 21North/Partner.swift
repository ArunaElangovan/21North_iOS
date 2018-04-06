//
//  Partner.swift
//  21North
//
//  Created by Sachin Tomar on 05/10/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation
import PureLayout

class Partner: BaseViewController, PartnerDetailsViewControllerDelegate{
    
    let shapes = Shapes()
    let style = Style()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let profileImageView = UIImageView()
    let driverLabel = UILabelWithPadding()
    let serviceLabel = UILabelWithPadding()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        
        //Cross button setup
        let cross: UIImage = shapes.drawShapes(type: "cross")
        //        cross.isUserInteractionEnabled = true
        //        let tapOnCross = UITapGestureRecognizer(target: self, action: #selector(cancelClicked))
        //        cross.addGestureRecognizer(tapOnCross)
        //        view.addSubview(cross)
        //        cross.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        //        cross.autoPinEdge(toSuperviewEdge: .top, withInset: 20.0)
        
        
        let closeButtonItem = NavigationItemModel(title: nil, image: cross, highlitedImage: nil, action: #selector(cancelClicked), type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        //Profile imageView setup
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
        
        //Driver label
        driverLabel.translatesAutoresizingMaskIntoConstraints = false
        driverLabel.layer.borderWidth = 1
        driverLabel.layer.borderColor = style.borderColor
        driverLabel.numberOfLines = 0
        driverLabel.lineBreakMode = .byWordWrapping
        driverLabel.isUserInteractionEnabled = true
        let tapOnDriver = UITapGestureRecognizer(target: self, action: #selector(driver))
        driverLabel.addGestureRecognizer(tapOnDriver)
        view.addSubview(driverLabel)
        
        var largeTextString = NSLocalizedString("Drive with 21North\n", comment: "")
        var smallTextString = NSLocalizedString("Do you have what it takes to drive with 21North. Meet us and find out.", comment: "")
        let largeFont = style.editCarTextFieldFont
        let smallFont = style.editCarTextFieldFont
        
        let attrib1 = [
            NSAttributedStringKey.font : largeFont,
            NSAttributedStringKey.foregroundColor : style.labelFontColor
        ]
        let attrib2 = [
            NSAttributedStringKey.font : smallFont,
            NSAttributedStringKey.foregroundColor : style.partnerTextViewColor
        ]
        var textString1 = NSMutableAttributedString()
        textString1.append(NSAttributedString(string: largeTextString, attributes: attrib1 as Any as? [NSAttributedStringKey : Any]))
        textString1.append(NSAttributedString(string: smallTextString, attributes: attrib2 as Any as? [NSAttributedStringKey : Any]))
        driverLabel.attributedText = textString1
        textString1 = NSMutableAttributedString()
        
        driverLabel.autoPinEdge(.top, to: .bottom, of: profileImageView, withOffset: 30)
        driverLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        driverLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        driverLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        //Partner label
        serviceLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceLabel.layer.borderWidth = 1
        serviceLabel.layer.borderColor = style.borderColor
        serviceLabel.numberOfLines = 0
        serviceLabel.lineBreakMode = .byWordWrapping
        serviceLabel.isUserInteractionEnabled = true
        let tapOnPartner = UITapGestureRecognizer(target: self, action: #selector(partner))
        serviceLabel.addGestureRecognizer(tapOnPartner)
        view.addSubview(serviceLabel)
        
        largeTextString = NSLocalizedString("Partner with 21North\n", comment: "")
        smallTextString = NSLocalizedString("Are you a service centre looking to bringing in more customers", comment: "")
        textString1.append(NSAttributedString(string: largeTextString, attributes: attrib1 as Any as? [NSAttributedStringKey : Any]))
        textString1.append(NSAttributedString(string: smallTextString, attributes: attrib2 as Any as? [NSAttributedStringKey : Any]))
        serviceLabel.attributedText = textString1
        
        serviceLabel.autoPinEdge(.top, to: .bottom, of: driverLabel, withOffset: 30)
        serviceLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        serviceLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        serviceLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
    }
    
    @objc func driver() {
        let partnerDetailsVC = PartnerDetailsViewController()
        partnerDetailsVC.partnerDetailsVCDelegate = self
        partnerDetailsVC.triggeredFrom = "Driver"
        Helper.topMostController().present(partnerDetailsVC, animated: true, completion: nil)
    }
    
    @objc func partner(){
        let partnerDetailsVC = PartnerDetailsViewController()
        partnerDetailsVC.partnerDetailsVCDelegate = self
        partnerDetailsVC.triggeredFrom = "Service"
        Helper.topMostController().present(partnerDetailsVC, animated: true, completion: nil)
    }
    
    @objc func cancelClicked(){
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
    
    //Problem here: not getting dismissed
    func dismissPartnerScreen() {
        self.dismiss(animated: true, completion: nil)
    }
}

