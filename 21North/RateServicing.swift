//
//  RatingServicing.swift
//  21North
//
//  Created by Sachin Tomar on 24/09/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation

@objc protocol RateServicingDelegate {
    func dismissModifyPageFromRating()
}

class RateServicing: BaseViewController, SocketManagerDelegate10{
    let drawservicing = DrawServicing()
    let shapes = Shapes()
    let style = Style()
    var awaitingReviewLabel = UILabel()
    let scrollView = UIScrollView.newAutoLayout()
    let contentView = UIView.newAutoLayout()
    let servicingLabel = UILabel()
    let pickupAmbView = UIView()
    let dropoffAmbView = UIView()
    let serviceCenterView = UIView()
    let feedbackView = UIView()
    let feedbackLabel = UILabel()
    let feedbackTextView = UITextView()
    let pickupAmbLabel = UILabel()
    let dropoffAmbLabel = UILabel()
    let serviceCenterLabel = UILabel()
    let submitButton = UIButtonWithPadding()
    let buttonContainer1 = UIView()
    let buttonContainer2 = UIView()
    let buttonContainer3 = UIView()
    var ratingValue = [Int](repeatElement(0, count: 3))
    var ratingButtons = [[UIButton]](repeating: [UIButton](repeating: UIButton(), count: 5), count: 3)
    var rateServicingDelegate: RateServicingDelegate?
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var superViewWidth: CGFloat!
    var superViewHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate.conn.delegate10 = self
        setupUI()
    }
    
    //MARK: UI setup
    func setupUI(){
        view.backgroundColor = style.background2
        superViewWidth = UIScreen.main.bounds.width
        superViewHeight = UIScreen.main.bounds.height
        let backButton = shapes.drawShapes(type: "backButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        headerImage = UIImage(named: "servicing")
        pageTitle = DataCreator.sharedInstance.selectedVehicleNumber
        titleFont = style.titleFont!
        titleColor = UIColor.white
        if DataCreator.sharedInstance.currentScreenId == 8{
            subTitle = NSLocalizedString("ServicingHeader", comment: "")
        }
        else if DataCreator.sharedInstance.currentScreenId == 25{
            subTitle = NSLocalizedString("ChauffeurServiceText", comment: "")
        }
        else if DataCreator.sharedInstance.currentScreenId == 34{
            subTitle = NSLocalizedString("RSAHeader", comment: "")
        }
        subTitleFont = style.firstLineFont!
        subTitleColor = UIColor.white
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.autoPinEdgesToSuperviewEdges(with: (UIEdgeInsetsMake((headerImage?.size.height)!, 0.0, 0.0, 0.0)))
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.autoPinEdgesToSuperviewEdges()
        contentView.autoMatch(.width, to: .width, of: view)
        contentView.isUserInteractionEnabled = true
        
        contentView.addSubview(awaitingReviewLabel)
        awaitingReviewLabel.numberOfLines = 0
        awaitingReviewLabel.lineBreakMode = .byWordWrapping
        awaitingReviewLabel.autoSetDimension(.height, toSize: 40.0, relation: .greaterThanOrEqual)
        awaitingReviewLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(0.0, 20.0, 0.0, 20.0), excludingEdge: .bottom)
        awaitingReviewLabel.text = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].stage
        awaitingReviewLabel.font = style.firstLineMedium
        awaitingReviewLabel.textColor = UIColor(red: 242/255.0, green: 103.0/255.0, blue: 33.0/255.0, alpha: 1.0)
        let underLine = drawservicing.drawLine(0, y: awaitingReviewLabel.font.pointSize+20.0, width: superViewWidth-40, color: "service")
        awaitingReviewLabel.layer.addSublayer(underLine)
        
        contentView.addSubview(pickupAmbView)
        pickupAmbView.autoSetDimension(.height, toSize: 100.0, relation: .greaterThanOrEqual)
        pickupAmbView.autoPinEdge(.top, to: .bottom, of: awaitingReviewLabel, withOffset: 20.0)
        pickupAmbView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0.0)
        pickupAmbView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0.0)
        pickupAmbView.backgroundColor = style.background1
        
        pickupAmbView.addSubview(pickupAmbLabel)
        pickupAmbLabel.numberOfLines = 0
        pickupAmbLabel.lineBreakMode = .byWordWrapping
        pickupAmbLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        pickupAmbLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10.0, 20.0, 0.0, 20.0), excludingEdge: .bottom)
        pickupAmbLabel.font = style.firstLineRegular
        pickupAmbLabel.textColor = UIColor(white: 0, alpha: 1)
        pickupAmbLabel.text = NSLocalizedString("ChauffeurText", comment: "")
        if DataCreator.sharedInstance.currentScreenId == 34{
            pickupAmbLabel.text = NSLocalizedString("RSAText", comment: "")
        }
        else if DataCreator.sharedInstance.currentScreenId == 8{
            pickupAmbLabel.text = NSLocalizedString("PickupAmbassadorText", comment: "")
            
            contentView.addSubview(dropoffAmbView)
            dropoffAmbView.autoSetDimension(.height, toSize: 100.0, relation: .greaterThanOrEqual)
            dropoffAmbView.autoPinEdge(.top, to: .bottom, of: pickupAmbView, withOffset: 0.0)
            dropoffAmbView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0.0)
            dropoffAmbView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0.0)
            dropoffAmbView.backgroundColor = style.background2
            
            dropoffAmbView.addSubview(dropoffAmbLabel)
            dropoffAmbLabel.numberOfLines = 0
            dropoffAmbLabel.lineBreakMode = .byWordWrapping
            dropoffAmbLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
            dropoffAmbLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10.0, 20.0, 0.0, 20.0), excludingEdge: .bottom)
            dropoffAmbLabel.font = style.firstLineRegular
            dropoffAmbLabel.textColor = UIColor(white: 0, alpha: 1)
            dropoffAmbLabel.text = NSLocalizedString("DropoffAmbassadorText", comment: "")
            
            contentView.addSubview(serviceCenterView)
            serviceCenterView.autoSetDimension(.height, toSize: 100.0, relation: .greaterThanOrEqual)
            serviceCenterView.autoPinEdge(.top, to: .bottom, of: dropoffAmbView, withOffset: 0.0)
            serviceCenterView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0.0)
            serviceCenterView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0.0)
            serviceCenterView.backgroundColor = style.background1
            
            serviceCenterView.addSubview(serviceCenterLabel)
            serviceCenterLabel.numberOfLines = 0
            serviceCenterLabel.lineBreakMode = .byWordWrapping
            serviceCenterLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
            serviceCenterLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10.0, 20.0, 0.0, 20.0), excludingEdge: .bottom)
            serviceCenterLabel.font = style.firstLineRegular
            serviceCenterLabel.textColor = UIColor(white: 0, alpha: 1)
            serviceCenterLabel.text = NSLocalizedString("ServiceCentreText", comment: "")
        }
        contentView.addSubview(submitButton)
        submitButton.autoSetDimension(.width, toSize: 100.0, relation: .greaterThanOrEqual)
        
        if DataCreator.sharedInstance.currentScreenId == 8{
            submitButton.autoPinEdge(.top, to: .bottom, of: serviceCenterView, withOffset: 30.0)
        }
        else{
            contentView.addSubview(feedbackView)
            feedbackView.autoSetDimension(.height, toSize: 100.0, relation: .greaterThanOrEqual)
            feedbackView.autoPinEdge(.top, to: .bottom, of: pickupAmbView, withOffset: 0.0)
            feedbackView.autoPinEdge(toSuperviewEdge: .leading, withInset: 0.0)
            feedbackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 0.0)
            feedbackView.backgroundColor = style.background2
            feedbackView.isHidden = true
            
            feedbackView.addSubview(feedbackLabel)
            feedbackLabel.numberOfLines = 0
            feedbackLabel.lineBreakMode = .byWordWrapping
            feedbackLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
            feedbackLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10.0, 20.0, 0.0, 20.0), excludingEdge: .bottom)
            feedbackLabel.font = style.firstLineRegular
            feedbackLabel.textColor = UIColor(white: 0, alpha: 1)
            feedbackLabel.text = NSLocalizedString("FeedbackText", comment: "")
            
            feedbackView.addSubview(feedbackTextView)
            feedbackTextView.autoSetDimension(.height, toSize: 80.0, relation: .greaterThanOrEqual)
            feedbackTextView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(0.0, 20.0, 10.0, 20.0), excludingEdge: .top)
            feedbackTextView.autoPinEdge(.top, to: .bottom, of: feedbackLabel, withOffset: 5)
            feedbackTextView.font = style.firstLineRegular
            feedbackTextView.textColor = UIColor.black
            
            submitButton.autoPinEdge(.top, to: .bottom, of: feedbackView, withOffset: 30.0)
        }
        submitButton.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -20)
        submitButton.autoSetDimension(.height, toSize: 40.0)
        submitButton.autoAlignAxis(toSuperviewAxis: .vertical)
        submitButton.setTitle("SUBMIT", for: UIControlState())
        submitButton.titleLabel?.font = style.firstLineMedium
        submitButton.backgroundColor = UIColor.orange
        submitButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
        submitButton.layer.cornerRadius = 5
        submitButton.clipsToBounds = true
        
        let filledStarImage = shapes.ratingStar("filled")
        let emptyStarImage = shapes.ratingStar("emptyStar")
        
        pickupAmbView.addSubview(buttonContainer1)
        buttonContainer1.autoSetDimension(.width, toSize: 212)
        buttonContainer1.autoSetDimension(.height, toSize: 35)
        buttonContainer1.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        buttonContainer1.autoPinEdge(.top, to: .bottom, of: pickupAmbLabel, withOffset: 20.0)
        buttonContainer1.autoPinEdge(toSuperviewEdge: .bottom, withInset: 30.0)
        
        if DataCreator.sharedInstance.currentScreenId == 8{
            dropoffAmbView.addSubview(buttonContainer2)
            buttonContainer2.autoSetDimension(.width, toSize: 212)
            buttonContainer2.autoSetDimension(.height, toSize: 35)
            buttonContainer2.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
            buttonContainer2.autoPinEdge(.top, to: .bottom, of: dropoffAmbLabel, withOffset: 20.0)
            buttonContainer2.autoPinEdge(toSuperviewEdge: .bottom, withInset: 30.0)
            
            serviceCenterView.addSubview(buttonContainer3)
            buttonContainer3.autoSetDimension(.width, toSize: 212)
            buttonContainer3.autoSetDimension(.height, toSize: 35)
            buttonContainer3.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
            buttonContainer3.autoPinEdge(.top, to: .bottom, of: serviceCenterLabel, withOffset: 20.0)
            buttonContainer3.autoPinEdge(toSuperviewEdge: .bottom, withInset: 30.0)
        }
        
        for i in 0..<5 {
            let button1 = UIButton()
            button1.frame = CGRect(x: 20, y: 20, width: 40, height: 40)
            button1.setImage(emptyStarImage, for: UIControlState())
            button1.setImage(filledStarImage, for: .selected)
            button1.setImage(filledStarImage, for: [.highlighted, .selected])
            button1.adjustsImageWhenHighlighted = false
            button1.addTarget(self, action: #selector(ratingButtonTapped(_:)), for: .touchDown)
            buttonContainer1.addSubview(button1)
            button1.autoPinEdge(toSuperviewEdge: .top)
            button1.autoPinEdge(toSuperviewEdge: .bottom)
            ratingButtons[0][i] = button1
            
            if DataCreator.sharedInstance.currentScreenId == 8{
                let button2 = UIButton()
                button2.frame = CGRect(x: 20, y: 20, width: 40, height: 40)
                button2.setImage(emptyStarImage, for: UIControlState())
                button2.setImage(filledStarImage, for: .selected)
                button2.setImage(filledStarImage, for: [.highlighted, .selected])
                button2.adjustsImageWhenHighlighted = false
                button2.addTarget(self, action: #selector(ratingButtonTapped(_:)), for: .touchDown)
                buttonContainer2.addSubview(button2)
                button2.autoPinEdge(toSuperviewEdge: .top)
                button2.autoPinEdge(toSuperviewEdge: .bottom)
                ratingButtons[1][i] = button2
                
                let button3 = UIButton()
                button3.frame = CGRect(x: 20, y: 20, width: 40, height: 40)
                button3.setImage(emptyStarImage, for: UIControlState())
                button3.setImage(filledStarImage, for: .selected)
                button3.setImage(filledStarImage, for: [.highlighted, .selected])
                button3.adjustsImageWhenHighlighted = false
                button3.addTarget(self, action: #selector(ratingButtonTapped(_:)), for: .touchDown)
                buttonContainer3.addSubview(button3)
                button3.autoPinEdge(toSuperviewEdge: .top)
                button3.autoPinEdge(toSuperviewEdge: .bottom)
                ratingButtons[2][i] = button3
            }
        }
        //Horizontal alignment for the rating buttons
        var ratingButtonTemp: NSArray
        var buttonRowCount = 1
        if DataCreator.sharedInstance.currentScreenId == 8{
            buttonRowCount = 3
        }
        for i in 0..<buttonRowCount {
            ratingButtonTemp = ratingButtons[i].map { $0 } as NSArray
            ratingButtonTemp.autoDistributeViews(along: .horizontal, alignedTo: .horizontal, withFixedSpacing: 0.0, insetSpacing: false)
        }
    }
    
    //MARK: Action handling
    @objc func ratingButtonTapped(_ button: UIButton) {
        let position = ratingButtons.indices(of: button)
        let iPosition = (position?.0)!
        let jPosition = (position?.1)!
        ratingValue[iPosition] = jPosition+1
        print("Rating: \(iPosition+1) row = \(ratingValue[iPosition])")
        updateButtonSelectionStates(iPosition)
        if DataCreator.sharedInstance.currentScreenId != 8{
            if jPosition < 2{
                feedbackView.isHidden = false
            }
            else{
                feedbackView.isHidden = true
            }
        }
    }
    
    func updateButtonSelectionStates(_ row: Int) {
        for (index, button) in ratingButtons[row].enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < ratingValue[row]
        }
    }
    
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromBottom
        self.view.window!.layer.add(transition, forKey: nil)
        
        if DataCreator.sharedInstance.currentScreen == "HomeScreen"{
            self.dismiss(animated: false, completion: nil)
            return
        }
        self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    @objc func submitButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        if ratingValue[0] > 0{
            if DataCreator.sharedInstance.currentScreenId == 8 && ratingValue[1] > 0{
                if ratingValue[2] > 0{
                    appdelegate.conn.send("\(Constants.RequestStates.Rating)|\(DataCreator.sharedInstance.currentBookingId)|\(String(ratingValue[0]))|\(String(ratingValue[1]))|\(String(ratingValue[2]))| |")
                }
                else{
                    ToastManager.ratingEmpty()
                }
            }
            else if DataCreator.sharedInstance.currentScreenId == 8{
                ToastManager.ratingEmpty()
            }
            else{ //for chauff and rsa
                if !feedbackTextView.text.isEmpty {
                    appdelegate.conn.send("\(Constants.RequestStates.Rating)|\(DataCreator.sharedInstance.currentBookingId)|\(String(ratingValue[0]))|0|0|\(feedbackTextView.text!)|")
                }
                else{
                    appdelegate.conn.send("\(Constants.RequestStates.Rating)|\(DataCreator.sharedInstance.currentBookingId)|\(String(ratingValue[0]))|0|0| |")
                }
            }
        }
        else{
            ToastManager.ratingEmpty()
        }
    }
    
    func dismissRatingScreen(){
        if DataCreator.sharedInstance.currentScreen == "HomeScreen"{
            self.dismiss(animated: true, completion: nil)
            return
        }
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
