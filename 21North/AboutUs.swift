//
//  AboutUs.swift
//  21North
//
//  Created by Sachin Tomar on 11/01/17.
//  Copyright © 2017 Sachin Tomar. All rights reserved.
//

import Foundation

class AboutUs: BaseViewController{
    
    let logo = Companylogo()
    let shapes = Shapes()
    let style = Style()
    
    let scrollView = UIScrollView.newAutoLayout()
    let contentView = UIView.newAutoLayout()
    var superViewWidth: CGFloat!
    var superViewHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = UIColor.white
        
        superViewWidth = UIScreen.main.bounds.width
        superViewHeight = UIScreen.main.bounds.height
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.autoPinEdgesToSuperviewEdges(with: (UIEdgeInsetsMake(navigationHeight, 0.0, 0.0, 0.0)))
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.autoPinEdgesToSuperviewEdges()
        contentView.autoMatch(.width, to: .width, of: view)
        
        let cross = shapes.drawShapes(type: "cross")
        let closeButtonItem = NavigationItemModel(title: nil, image: cross, highlitedImage: nil, action: #selector(backButtonClicked), type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        let compLogo = logo.coloredLogo()
        let imGap = (superViewWidth - 170)/2
        compLogo.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(compLogo)
        compLogo.autoPinEdge(toSuperviewEdge: .leading, withInset: imGap)
        compLogo.autoPinEdge(toSuperviewEdge: .top, withInset: 40.0)
        compLogo.autoSetDimension(.width, toSize: 170.0)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority(rawValue: 1000.0)) {
            compLogo.contentCompressionResistancePriority(for: .vertical)
        }
        
        let headingLabel = UILabel()
        headingLabel.numberOfLines = 0
        headingLabel.lineBreakMode = .byWordWrapping
        headingLabel.text = NSLocalizedString("DISCOVER CONVIENCE", comment: "")
        headingLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        headingLabel.textColor = UIColor.orange//(red: 242/255, green: 103, blue: 33, alpha: 1)
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(headingLabel)
        headingLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16.0)
        headingLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16.0)
        
        headingLabel.autoPinEdge(.top, to: .bottom, of: compLogo, withOffset: 33.0)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority(rawValue: 1000.0)) {
            headingLabel.contentCompressionResistancePriority(for: .vertical)
        }
        
        let textLabel = UILabel()
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.text = NSLocalizedString("AboutUsText", comment: "")
        textLabel.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        textLabel.textColor = UIColor(red: 144/255.0, green: 144/255.0, blue: 144/255.0, alpha: 1.0)
        contentView.addSubview(textLabel)
        textLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16.0)
        textLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16.0)
        textLabel.autoPinEdge(.top, to: .bottom, of: headingLabel, withOffset: 20.0)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority(rawValue: 1000.0)) {
            textLabel.contentCompressionResistancePriority(for: .vertical)
        }
        
        let termsAndCondLabel = UILabel()
        termsAndCondLabel.numberOfLines = 0
        termsAndCondLabel.lineBreakMode = .byWordWrapping
        termsAndCondLabel.text = NSLocalizedString("Terms and Conditions", comment: "")
        termsAndCondLabel.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        termsAndCondLabel.translatesAutoresizingMaskIntoConstraints = false
        termsAndCondLabel.textColor = style.editCarButtonFontColor
        termsAndCondLabel.isUserInteractionEnabled = true
        let tapOnTerms = UITapGestureRecognizer(target: self, action: #selector(tapOnTermsFunc))
        termsAndCondLabel.addGestureRecognizer(tapOnTerms)
        contentView.addSubview(termsAndCondLabel)
        termsAndCondLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16.0)
        termsAndCondLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16.0)
        termsAndCondLabel.autoPinEdge(.top, to: .bottom, of: textLabel, withOffset: 20.0)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority(rawValue: 1000.0)) {
            termsAndCondLabel.contentCompressionResistancePriority(for: .vertical)
        }
        
        let compLinkLabel = UILabel()
        compLinkLabel.numberOfLines = 0
        compLinkLabel.lineBreakMode = .byWordWrapping
        compLinkLabel.text = "www.21north.in"
        compLinkLabel.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        compLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        compLinkLabel.textColor = style.editCarButtonFontColor
        compLinkLabel.isUserInteractionEnabled = true
        let tapOnComp = UITapGestureRecognizer(target: self, action: #selector(compLink))
        compLinkLabel.addGestureRecognizer(tapOnComp)
        contentView.addSubview(compLinkLabel)
        compLinkLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 16.0)
        compLinkLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 16.0)
        compLinkLabel.autoPinEdge(.top, to: .bottom, of: termsAndCondLabel, withOffset: 10.0)
        NSLayoutConstraint.autoSetPriority(UILayoutPriority(rawValue: 1000.0)) {
            compLinkLabel.contentCompressionResistancePriority(for: .vertical)
        }
        compLinkLabel.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -20)
    }
    
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
    @objc func tapOnTermsFunc(){
        let webVC = WebViewController()
        webVC.hidesBottomBarWhenPushed = true
        webVC.urlString = "http://www.21north.in/legal.php"
        webVC.pagetitle = NSLocalizedString("TermsAndConditionsText", comment: "")
        Helper.topMostController().present(webVC, animated: true, completion: nil)
    }
    @objc func compLink(){
        let webVC = WebViewController()
        webVC.hidesBottomBarWhenPushed = true
        webVC.urlString = "http://www.21north.in"
        webVC.pagetitle = NSLocalizedString("About21NorthText", comment: "")
        Helper.topMostController().present(webVC, animated: true, completion: nil)
    }
}

