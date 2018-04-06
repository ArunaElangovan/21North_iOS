//
//  BaseViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 29/12/17.
//  Copyright © 2017 Sachin Tomar. All rights reserved.
//

import UIKit
import PureLayout

open class BaseViewController: UIViewController {
    let headerImageView:UIImageView = UIImageView(forAutoLayout: ())
    fileprivate let navigationView:UIView = UIView(forAutoLayout: ())
    fileprivate let pageTitleLabel:UILabel = UILabel(forAutoLayout: ())
    fileprivate let subTitleLabel:UILabel = UILabel(forAutoLayout: ())
    var visible: Bool = false
    var shouldShowLoading = true
    var loadingView = UIView()
    var leftButton = UIButton()
    var rightButton = UIButton()
    
    /// Set Navigation bar page title
    var pageTitle:String = "" {
        didSet{
            pageTitleLabel.text = pageTitle
        }
    }
    
    var subTitle:String = "" {
        didSet{
            subTitleLabel.text = subTitle
        }
    }
    
    var bringBackButtonToFront: Bool = false{
        didSet {
            if bringBackButtonToFront {
                view.bringSubview(toFront: navigationView)
            }
        }
    }
    
    /// Set Color for title label in Navigation bar
    var titleColor: UIColor = UIColor.blue {
        didSet {
            pageTitleLabel.textColor = titleColor
        }
    }
    
    /// Set Color for title label in Navigation bar
    var subTitleColor: UIColor = UIColor.blue {
        didSet {
            subTitleLabel.textColor = subTitleColor
        }
    }
    
    /// Set titleLabel font in Navigation bar
    var titleFont: UIFont = UIFont.systemFont(ofSize: 18.0){
        didSet {
            pageTitleLabel.font = titleFont
        }
    }
    
    /// Set titleLabel font in Navigation bar
    var subTitleFont: UIFont = UIFont.systemFont(ofSize: 18.0){
        didSet {
            subTitleLabel.font = subTitleFont
        }
    }
    
    /// Set background image for page
    var headerImage: UIImage? {
        didSet{
            headerImageView.image = headerImage
        }
    }
    
    /// Set background color for navigationView
    var navigationBackgroundColor: UIColor = UIColor.clear {
        didSet {
            navigationView.backgroundColor = navigationBackgroundColor
        }
    }
    
    /// Returns navigation bar height depends on device type
    var navigationHeight: CGFloat {
        return (Constants.DeviceType.IS_IPHONE_X) ? Constants.Sizes.NavigationViewHeight_iPhoneX : Constants.Sizes.NavigationViewHeight;
    }
    
    /// Returns status bar height depends on device type
    var statusBarHeight: CGFloat {
        return (Constants.DeviceType.IS_IPHONE_X) ? Constants.Sizes.StatusBarSpacing_iPhoneX : Constants.Sizes.StatusBarSpacing
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(networkStatus), name: NSNotification.Name(rawValue: "NetworkStatus"), object: nil)
        
        self.view.backgroundColor = UIColor.clear
        
        setUpNavigationBar()
        registerForNotification()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSpinner), name: NSNotification.Name(rawValue: "SHOWLOADINGPAGE"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideSpinner), name: NSNotification.Name(rawValue: "HIDELOADINGPAGE"), object: nil)
    }
    
    @objc func showSpinner(){
        if shouldShowLoading{
            loadingView = UIViewController.displaySpinner(onView: self.view)
            shouldShowLoading = false
        }
    }
    @objc func hideSpinner(){
        UIViewController.removeSpinner(spinner: loadingView)
        shouldShowLoading = true
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        visible = true
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        visible = false
    }
    
    @objc func networkStatus(_ notification: Notification){
        let prevStatus = DataCreator.sharedInstance.networkCheck
        DataCreator.sharedInstance.networkCheck = (notification as NSNotification).userInfo!["check"] as! String
        if prevStatus == "1" && DataCreator.sharedInstance.networkCheck == "0"{
            ToastManager.internetError()
        }
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // Register for Notifications
    
    func registerForNotification() {
        //        // Register for Language change notification
        //        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.localizeUI), name: NSNotification.Name(rawValue: Constants.Notifications.DidChangeLanguageKey), object: nil)
    }
    
    /**
     Setup navigation bar
     */
    func setUpNavigationBar() {
        
        let padding: CGFloat = 30.0
        
        view.backgroundColor = UIColor.clear
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        view.addSubview(headerImageView)
        view.sendSubview(toBack: headerImageView)
        headerImageView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero, excludingEdge: .bottom)
        headerImageView.autoSetDimension(.height, toSize: 100.0, relation: .greaterThanOrEqual)
        
        view.addSubview(navigationView)
        navigationView.backgroundColor = UIColor.clear
        navigationView.autoSetDimension(.height, toSize: navigationHeight)
        navigationView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero, excludingEdge: .bottom)
        
        
        navigationView.addSubview(pageTitleLabel)
        pageTitleLabel.backgroundColor = UIColor.clear
        pageTitleLabel.font = titleFont
        pageTitleLabel.textAlignment = .center
        pageTitleLabel.textColor = titleColor
        pageTitleLabel.numberOfLines = 0
        pageTitleLabel.lineBreakMode = .byWordWrapping
        //        pageTitleLabel.adjustsFontSizeToFitWidth = true
        pageTitleLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(15, padding, 0, padding), excludingEdge: .bottom)
        pageTitleLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        headerImageView.addSubview(subTitleLabel)
        subTitleLabel.backgroundColor = UIColor.clear
        subTitleLabel.font = subTitleFont
        subTitleLabel.textAlignment = .center
        subTitleLabel.textColor = subTitleColor
        subTitleLabel.adjustsFontSizeToFitWidth = true
        subTitleLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(0, padding, 15, padding), excludingEdge: .top)
        subTitleLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
    }
    
    /** Adds Button(s) from Left Edge to Navgiation View */
    func setLeftButtonItems(_ item: NavigationItemModel, withMargin: CGFloat = Constants.Margins.NavigationButtonLeadingSpace) {
        // Add new button item
        leftButton = UIButton(type: .custom)
        navigationView.addSubview(leftButton)
        
        leftButton.titleLabel?.font = UIFont(name: "HelveticaNeue-bold", size:14)!
        leftButton.setTitleColor(UIColor.orange, for: .normal)
        
        if item.itemType == NavigationItemType.imageAndTitle {
            leftButton.setTitle(item.title!, for: UIControlState())
            leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, Constants.Margins.BackButtonImageTitlePadding, 0, -Constants.Margins.BackButtonImageTitlePadding)
            leftButton.contentEdgeInsets = UIEdgeInsetsMake(0,0,0,Constants.Margins.BackButtonImageTitlePadding);
            leftButton.setImage(item.image, for: UIControlState())
        }
        else if item.itemType == NavigationItemType.imageOnly {
            leftButton.setImage(item.image, for: UIControlState())
            leftButton.contentEdgeInsets = UIEdgeInsetsMake(0,0,0,Constants.Margins.BackButtonImageTitlePadding)
            if let _ = item.highlitedImage {
                leftButton.setImage(item.highlitedImage, for: .highlighted)
            }
        }
            
        else if item.itemType == NavigationItemType.titleOnly {
            leftButton.setTitle(item.title!, for: UIControlState())
            leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, Constants.Margins.BackButtonImageTitlePadding, 0, -Constants.Margins.BackButtonImageTitlePadding)
            leftButton.contentEdgeInsets = UIEdgeInsetsMake(0,0,0,Constants.Margins.BackButtonImageTitlePadding)
        }
        
        leftButton.autoPinEdge(toSuperviewEdge: .top)
        leftButton.autoPinEdge(toSuperviewEdge: .bottom)
        
        // Add leading space with Superview
        leftButton.autoPinEdge(toSuperviewEdge: .left, withInset: withMargin)
        leftButton.addTarget(self, action: item.action!, for: UIControlEvents.touchUpInside)
    }
    
    //    /** Adds Button(s) from Right Edge to Navgiation View */
    func setRightButtonItems(_ item: NavigationItemModel, withMargin: CGFloat = Constants.Margins.NavigationButtonTrailingSpace) {
        
        rightButton = UIButton(type: .custom)
        navigationView.addSubview(rightButton)
        rightButton.titleLabel?.font = UIFont(name: "HelveticaNeue-bold", size:14)!
        rightButton.setTitleColor(UIColor.orange, for: .normal)
        
        if item.itemType == NavigationItemType.imageAndTitle {
            rightButton.setTitle(item.title!, for: UIControlState())
            rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, Constants.Margins.BackButtonImageTitlePadding, 0, -Constants.Margins.BackButtonImageTitlePadding)
            rightButton.contentEdgeInsets = UIEdgeInsetsMake(0,0,0,Constants.Margins.BackButtonImageTitlePadding);
            rightButton.setImage(item.image, for: UIControlState())
        }
        else if item.itemType == NavigationItemType.imageOnly {
            rightButton.setImage(item.image, for: UIControlState())
            if let _ = item.highlitedImage {
                rightButton.setImage(item.highlitedImage, for: .highlighted)
            }
        }
            
        else if item.itemType == NavigationItemType.titleOnly {
            rightButton.setTitle(item.title!, for: UIControlState())
            rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, Constants.Margins.BackButtonImageTitlePadding, 0, -Constants.Margins.BackButtonImageTitlePadding)
            rightButton.contentEdgeInsets = UIEdgeInsetsMake(0,0,0,Constants.Margins.BackButtonImageTitlePadding)
            rightButton.titleLabel?.font = UIFont(name: "HelveticaNeue-bold", size:14)!
            rightButton.setTitleColor(UIColor.orange, for: .normal)
        }
        
        rightButton.autoPinEdge(toSuperviewEdge: .top)
        rightButton.autoPinEdge(toSuperviewEdge: .bottom)
        
        // Add trailing space with Superview
        rightButton.autoPinEdge(toSuperviewEdge: .right, withInset: withMargin)
        rightButton.addTarget(self, action: item.action!, for: UIControlEvents.touchUpInside)
    }
    
    /**
     Pops current view controller
     */
    func popViewController() {
        //        self.popViewController()
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    /**
     Dismiss this view controller
     */
    @objc func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
}

