//
//  ModifyBookingButtonCell.swift
//  21North
//
//  Created by Aruna Elangovan on 23/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import PureLayout

class ModifyBookingButtonCell: UITableViewCell {
    let promptLabel = UILabel()
    let promptLabel1 = UILabel()
    let firstButton = UIButtonWithPadding()
    let secondButton = UIButtonWithPadding()
    let thirdButton = UIButtonWithPadding()
    
    var promptText: String = "" {
        didSet{
            promptLabel.text = promptText
        }
    }
    
    var promptLabelFont: UIFont? {
        didSet{
            promptLabel.font = promptLabelFont
        }
    }
    
    var promptLabelColor: UIColor = UIColor.gray {
        didSet{
            promptLabel.textColor = promptLabelColor
        }
    }
    
    var promptText1: String = "" {
        didSet{
            promptLabel1.text = promptText1
        }
    }
    
    var promptLabelFont1: UIFont? {
        didSet{
            promptLabel1.font = promptLabelFont1
        }
    }
    
    var promptLabelColor1: UIColor = UIColor.black {
        didSet{
            promptLabel1.textColor = promptLabelColor1
        }
    }
    
    var firstButtonText: String = "" {
        didSet{
            firstButton.setTitle(firstButtonText, for: .normal)
        }
    }
    
    var secondButtonText: String = "" {
        didSet{
            secondButton.setTitle(secondButtonText, for: .normal)
        }
    }
    
    var thirdButtonText: String = "" {
        didSet{
            thirdButton.setTitle(thirdButtonText, for: .normal)
        }
    }
    
    var firstButtonTextColor: UIColor = UIColor.white {
        didSet{
            firstButton.setTitleColor(firstButtonTextColor, for: .normal)
            secondButton.setTitleColor(firstButtonTextColor, for: .normal)
            thirdButton.setTitleColor(firstButtonTextColor, for: .normal)
        }
    }
    
    var numberOfButtons: Int = 0 {
        didSet{
            if numberOfButtons == 3{
                thirdButton.isHidden = false
                firstButton.isHidden = false
                secondButton.isHidden = false
                firstButton.autoSetDimension(.width, toSize: 100.0, relation: .greaterThanOrEqual)
                thirdButton.autoPinEdge(.leading, to: .trailing, of: secondButton, withOffset: 20)
                secondButton.autoSetDimension(.width, toSize: 100.0, relation: .greaterThanOrEqual)
                secondButton.autoPinEdge(.leading, to: .trailing, of: firstButton, withOffset: 20)
                thirdButton.autoSetDimension(.width, toSize: 100.0, relation: .greaterThanOrEqual)
            }
            else if numberOfButtons == 2{
                firstButton.autoSetDimension(.width, toSize: 120.0, relation: .greaterThanOrEqual)
                thirdButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
                thirdButton.autoSetDimension(.width, toSize: 120.0, relation: .greaterThanOrEqual)
                secondButton.isHidden = true
                firstButton.isHidden = false
                thirdButton.isHidden = false
                
            }
            else if numberOfButtons == 4{
                //                thirdButton.autoSetDimension(.width, toSize: 0.0, relation: .greaterThanOrEqual)
                //                firstButton.autoSetDimension(.width, toSize: 0.0, relation: .greaterThanOrEqual)
                thirdButton.isHidden = true
                firstButton.isHidden = true
                secondButton.isHidden = false
                secondButton.autoSetDimension(.width, toSize: 120.0, relation: .greaterThanOrEqual)
                secondButton.autoAlignAxis(toSuperviewAxis: .vertical)
            }
            else{
                firstButton.autoSetDimension(.width, toSize: 120.0, relation: .greaterThanOrEqual)
                secondButton.autoPinEdge(.leading, to: .trailing, of: firstButton, withOffset: 20)
                secondButton.autoSetDimension(.width, toSize: 0.0, relation: .greaterThanOrEqual)
                thirdButton.autoSetDimension(.width, toSize: 0.0, relation: .greaterThanOrEqual)
            }
        }
    }
    
    var firstButtonTextFont: UIFont? {
        didSet{
            firstButton.titleLabel?.font = firstButtonTextFont
            secondButton.titleLabel?.font = firstButtonTextFont
            thirdButton.titleLabel?.font = firstButtonTextFont
        }
    }
    
    var buttonBackgroundColor: UIColor = UIColor.white {
        didSet{
            firstButton.backgroundColor = UIColor.orange
            secondButton.backgroundColor = UIColor.orange
            thirdButton.backgroundColor = UIColor.orange
        }
    }
    
    // MARK: - Inits
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Initialization code
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Custom UI setup
    private func setupUI() {
        selectionStyle = .none
        //        backgroundColor = UIColor.clear
        isUserInteractionEnabled = true
        
        contentView.addSubview(promptLabel)
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.numberOfLines = 0
        promptLabel.lineBreakMode = .byWordWrapping
        promptLabel.textAlignment = .center
        promptLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10, 20, 0, 20),  excludingEdge: .bottom)
        promptLabel.autoSetDimension(.height, toSize: 0.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(promptLabel1)
        promptLabel1.translatesAutoresizingMaskIntoConstraints = false
        promptLabel1.numberOfLines = 0
        promptLabel1.lineBreakMode = .byWordWrapping
        promptLabel1.textAlignment = .center
        promptLabel1.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        promptLabel1.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        promptLabel1.autoPinEdge(.top, to: .bottom, of: promptLabel, withOffset: 2)
        promptLabel1.autoSetDimension(.height, toSize: 0.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(firstButton)
        firstButton.backgroundColor = UIColor.orange
        firstButton.titleLabel?.textAlignment = .center
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.autoPinEdge(.top, to: .bottom, of: promptLabel1, withOffset: 10)
        firstButton.autoSetDimension(.height, toSize: 0.0, relation: .greaterThanOrEqual)
        firstButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        firstButton.autoSetDimension(.width, toSize: 0.0, relation: .greaterThanOrEqual)
        firstButton.layer.cornerRadius = 5
        firstButton.clipsToBounds = true
        firstButton.titleLabel?.numberOfLines = 0
        firstButton.titleLabel?.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(secondButton)
        secondButton.backgroundColor = UIColor.orange
        secondButton.titleLabel?.textAlignment = .center
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.autoPinEdge(.top, to: .bottom, of: promptLabel1, withOffset: 10)
        secondButton.autoSetDimension(.height, toSize: 0.0, relation: .greaterThanOrEqual)
        secondButton.autoSetDimension(.width, toSize: 0.0, relation: .greaterThanOrEqual)
        secondButton.layer.cornerRadius = 5
        secondButton.clipsToBounds = true
        secondButton.titleLabel?.numberOfLines = 0
        secondButton.titleLabel?.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(thirdButton)
        thirdButton.backgroundColor = UIColor.orange
        thirdButton.titleLabel?.textAlignment = .center
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.autoPinEdge(.top, to: .bottom, of: promptLabel1, withOffset: 10)
        thirdButton.autoSetDimension(.height, toSize: 0.0, relation: .greaterThanOrEqual)
        thirdButton.autoSetDimension(.width, toSize: 0.0, relation: .greaterThanOrEqual)
        thirdButton.layer.cornerRadius = 5
        thirdButton.clipsToBounds = true
        thirdButton.titleLabel?.numberOfLines = 0
        thirdButton.titleLabel?.lineBreakMode = .byWordWrapping
    }
}
