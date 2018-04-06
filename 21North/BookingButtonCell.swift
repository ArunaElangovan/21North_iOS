//
//  BookingButtonCell.swift
//  21North
//
//  Created by Aruna Elangovan on 20/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import PureLayout

class BookingButtonCell: UITableViewCell {
    
    let etaHeaderLabel = UILabel()
    let etaDescLabel = UILabel()
    let submitButton = UIButtonWithPadding()
    
    var buttonTitle: String! = ""{
        didSet{
            submitButton.setTitle(buttonTitle, for: .normal)
        }
    }
    
    var etaHeaderText: String = "" {
        didSet{
            etaHeaderLabel.text = etaHeaderText
        }
    }
    
    var etaDescText: String = "" {
        didSet{
            etaDescLabel.text = etaDescText
        }
    }
    
    var etaHeaderFont: UIFont? {
        didSet{
            etaHeaderLabel.font = etaHeaderFont
        }
    }
    
    var etaDescFont: UIFont? {
        didSet{
            etaDescLabel.font = etaDescFont
        }
    }
    
    var etaHeaderColor: UIColor = UIColor.darkGray {
        didSet{
            etaHeaderLabel.textColor = etaHeaderColor
        }
    }
    
    var etaDescColor: UIColor = UIColor.darkGray {
        didSet{
            etaDescLabel.textColor = etaHeaderColor
        }
    }
    
    var buttonTextColor: UIColor = UIColor.white {
        didSet{
            submitButton.setTitleColor(buttonTextColor, for: .normal)
        }
    }
    
    var buttonTextFont: UIFont? {
        didSet{
            submitButton.titleLabel?.font = buttonTextFont
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
        
        contentView.addSubview(etaHeaderLabel)
        etaHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        etaHeaderLabel.numberOfLines = 0
        etaHeaderLabel.lineBreakMode = .byWordWrapping
        etaHeaderLabel.textAlignment = .center
        etaHeaderLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10, 20, 0, 20),  excludingEdge: .bottom)
        etaHeaderLabel.autoSetDimension(.height, toSize: 0.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(etaDescLabel)
        etaDescLabel.translatesAutoresizingMaskIntoConstraints = false
        etaDescLabel.numberOfLines = 0
        etaDescLabel.lineBreakMode = .byWordWrapping
        etaDescLabel.textAlignment = .center
        etaDescLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        etaDescLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        etaDescLabel.autoPinEdge(.top, to: .bottom, of: etaHeaderLabel, withOffset: 10)
        etaDescLabel.autoSetDimension(.height, toSize: 0.0, relation: .greaterThanOrEqual)
        
        
        contentView.addSubview(submitButton)
        submitButton.backgroundColor = UIColor.orange
        submitButton.titleLabel?.textAlignment = .center
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.autoAlignAxis(toSuperviewMarginAxis: .vertical)
        submitButton.autoPinEdge(.top, to: .bottom, of: etaDescLabel, withOffset: 10)
        submitButton.autoSetDimension(.height, toSize: 30.0, relation: .greaterThanOrEqual)
        submitButton.autoSetDimension(.width, toSize: 200.0, relation: .greaterThanOrEqual)
        submitButton.isUserInteractionEnabled = false
        submitButton.layer.cornerRadius = 5
        submitButton.clipsToBounds = true
    }
}
