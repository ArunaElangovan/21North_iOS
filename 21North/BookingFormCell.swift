//
//  BookingFormCell.swift
//  TableView
//
//  Created by Sachin Tomar on 14/07/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit

class BookingFormCell: UITableViewCell {
    
    var headerLabel = UILabel()
    var ratingStars = UIImageView()
    var descLabel = UILabel()
    var separatorImageView = UIImageView()
    var actionButton = UIButton()
    let style1 = Style()
    
    let drawServicing = DrawServicing()
    
    /// Set Navigation bar page title
    var header:String = "" {
        didSet{
            headerLabel.text = header
        }
    }
    
    var desc:String = "" {
        didSet{
            descLabel.text = desc
        }
    }
    
    /// Set Color for title label in Navigation bar
    var headerColor: UIColor = UIColor.blue {
        didSet {
            headerLabel.textColor = headerColor
        }
    }
    
    /// Set Color for title label in Navigation bar
    var descColor: UIColor = UIColor.blue {
        didSet {
            descLabel.textColor = descColor
        }
    }
    
    /// Set titleLabel font in Navigation bar
    var headerFont: UIFont = UIFont.systemFont(ofSize: 18.0){
        didSet {
            headerLabel.font = headerFont
        }
    }
    
    /// Set titleLabel font in Navigation bar
    var descFont: UIFont = UIFont.systemFont(ofSize: 18.0){
        didSet {
            descLabel.font = descFont
        }
    }
    
    /// Set background image for page
    var buttonImage: UIImage? {
        didSet{
            actionButton.setImage(buttonImage, for: .normal)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    // MARK: - Custom UI setup
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = UIColor.clear
        
        let separatorLine = drawServicing.drawLine(20, y: 0, width: UIScreen.main.bounds.width-20, color: "service")
        separatorImageView.layer.addSublayer(separatorLine)
        actionButton.isUserInteractionEnabled = false
        
        contentView.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.autoSetDimension(.height, toSize: 0, relation: .greaterThanOrEqual)
        headerLabel.autoSetDimension(.width, toSize: 50, relation: .greaterThanOrEqual)
        headerLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        headerLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        
        contentView.addSubview(ratingStars)
        ratingStars.autoSetDimension(.height, toSize: 0, relation: .greaterThanOrEqual)
        ratingStars.autoSetDimension(.width, toSize: 0, relation: .greaterThanOrEqual)
        ratingStars.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        ratingStars.autoPinEdge(.leading, to: .trailing, of: headerLabel, withOffset: 10)
        
        contentView.addSubview(actionButton)
        actionButton.autoSetDimension(.height, toSize: 0, relation: .greaterThanOrEqual)
        actionButton.autoSetDimension(.width, toSize: 0, relation: .greaterThanOrEqual)
        actionButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        actionButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        
        contentView.addSubview(descLabel)
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.numberOfLines = 1
        descLabel.lineBreakMode = .byTruncatingTail
        descLabel.autoPinEdge(.trailing, to: .trailing, of: actionButton, withOffset: -50)
        descLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        descLabel.autoSetDimension(.height, toSize: 0, relation: .greaterThanOrEqual)
        descLabel.autoPinEdge(.top, to: .bottom, of: headerLabel, withOffset: 10)
        
        contentView.addSubview(separatorImageView)
        separatorImageView.autoSetDimension(.height, toSize: 2)
        separatorImageView.autoPinEdge(.top, to: .bottom, of: descLabel, withOffset: 10)
        separatorImageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        
    }
}

