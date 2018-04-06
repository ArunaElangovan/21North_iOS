//
//  EnterPromoCodeViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 09/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import PureLayout

@objc protocol VerifyPromoDelegate{
    func updatePromoField(promoCode: String, promoAmount: String)
}

class EnterPromoCodeViewController: BaseViewController, UITextFieldDelegate, SocketManagerDelegate5{
    let promoCodePromptLabel = UILabel()
    let promoCodeTextField = UITextFieldWithPadding()
    let validPromoLabel = UILabel()
    let verifyPromoButton = UIButtonWithPadding()
    let style = Style()
    var verifyPromoDelegate:VerifyPromoDelegate?
    let appdelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        appdelegate?.conn.delegate5 = self
    }
    
    //MARK: UI setup
    func setupUI(){
        view.isUserInteractionEnabled = true
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapOnView)
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        view.addSubview(promoCodePromptLabel)
        promoCodePromptLabel.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        promoCodePromptLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        promoCodePromptLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 150.0)
        promoCodePromptLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 10.0)
        promoCodePromptLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10.0)
        promoCodePromptLabel.text = NSLocalizedString("PromoCodePromptText", comment: "")
        promoCodePromptLabel.textColor = UIColor.white
        promoCodePromptLabel.textAlignment = .center
        promoCodePromptLabel.numberOfLines = 0
        promoCodePromptLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(promoCodeTextField)
        promoCodeTextField.autoSetDimension(.width, toSize: 200, relation: .greaterThanOrEqual)
        promoCodeTextField.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        promoCodeTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        promoCodeTextField.autoPinEdge(.top, to: .bottom, of: promoCodePromptLabel, withOffset: 10)
        promoCodeTextField.borderStyle = .line
        promoCodeTextField.textAlignment = .center
        promoCodeTextField.attributedPlaceholder = NSAttributedString(string:"21North",
                                                                      attributes:[NSAttributedStringKey.foregroundColor: UIColor.darkGray])
        promoCodeTextField.layer.borderColor = UIColor.orange.cgColor
        promoCodeTextField.layer.borderWidth = 1.0
        promoCodeTextField.textColor = UIColor.white
        promoCodeTextField.autocapitalizationType = .none
        promoCodeTextField.autocapitalizationType = .allCharacters
        
        view.addSubview(validPromoLabel)
        validPromoLabel.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        validPromoLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        validPromoLabel.autoPinEdge(.top, to: .bottom, of: promoCodeTextField, withOffset: 10)
        validPromoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 10.0)
        validPromoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10.0)
        validPromoLabel.textAlignment = .center
        validPromoLabel.text = "Verified"
        validPromoLabel.font = style.thirdLineAFont
        validPromoLabel.textColor = UIColor.gray
        
        view.addSubview(verifyPromoButton)
        verifyPromoButton.autoSetDimension(.width, toSize: 170, relation: .greaterThanOrEqual)
        verifyPromoButton.autoSetDimension(.height, toSize: 40, relation: .greaterThanOrEqual)
        verifyPromoButton.autoAlignAxis(toSuperviewAxis: .vertical)
        verifyPromoButton.autoPinEdge(.top, to: .bottom, of: validPromoLabel, withOffset: 20)
        verifyPromoButton.setTitle("ADD", for: UIControlState())
        verifyPromoButton.backgroundColor = UIColor.orange
        verifyPromoButton.addTarget(self, action: #selector(verifyPromoClicked), for: .touchUpInside)
        verifyPromoButton.layer.cornerRadius = 5
        verifyPromoButton.clipsToBounds = true
    }
    
    //MARK: Action handling
    @objc func verifyPromoClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        appdelegate?.conn.send("\(Constants.RequestStates.VerifyPromo)|\(promoCodeTextField.text!)|")
    }
    
    //MARK: Textfield delegate and keyboard
    @objc func hideKeyboard(){
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func promoNotValid(){
        validPromoLabel.text = "Not verified"
    }
    
    func dismissPromoScreen(promoAmount: String){
        view.endEditing(true)
        verifyPromoDelegate?.updatePromoField(promoCode: promoCodeTextField.text!, promoAmount: promoAmount)
        self.dismiss(animated: true, completion: nil)
    }
}

