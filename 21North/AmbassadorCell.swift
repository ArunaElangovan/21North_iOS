//
//  AmbassadorCell.swift
//  21North
//
//  Created by Aruna Elangovan on 31/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

class AmbassadorCell: UITableViewCell {
    var nameLabel = UILabel()
    var callImageView = UIImageView()
    var locationImageView = UIImageView()
    var ambassadorImageView = UIImageView()
    let style1 = Style()
    let drawServicing = DrawServicing()
    
    /// Set Navigation bar page title
    var name:String = "" {
        didSet{
            nameLabel.text = name
        }
    }
    
    /// Set Color for title label in Navigation bar
    var nameColor: UIColor = UIColor.blue {
        didSet {
            nameLabel.textColor = nameColor
        }
    }
    
    /// Set titleLabel font in Navigation bar
    var nameFont: UIFont = UIFont.systemFont(ofSize: 18.0){
        didSet {
            nameLabel.font = nameFont
        }
    }
    
    /// Set background image for page
    var callImage: UIImage? {
        didSet{
            callImageView.image = callImage
        }
    }
    
    var locationImage: UIImage? {
        didSet{
            locationImageView.image = locationImage
        }
    }
    
    var ambassadorImage: UIImage? {
        didSet{
            ambassadorImageView.image = ambassadorImage
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
        
        contentView.addSubview(ambassadorImageView)
        ambassadorImageView.autoSetDimension(.height, toSize:82)
        ambassadorImageView.autoSetDimension(.width, toSize: 82)
        ambassadorImageView.autoAlignAxis(toSuperviewAxis: .vertical)
        ambassadorImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        ambassadorImageView.layer.cornerRadius = 41
        ambassadorImageView.clipsToBounds = true
        ambassadorImageView.backgroundColor = UIColor.gray
        
        contentView.addSubview(callImageView)
        callImageView.translatesAutoresizingMaskIntoConstraints = false
        callImageView.autoSetDimension(.height, toSize: 35, relation: .greaterThanOrEqual)
        callImageView.autoSetDimension(.width, toSize: 35, relation: .greaterThanOrEqual)
        callImageView.autoAlignAxis(toSuperviewAxis: .horizontal)
        callImageView.autoPinEdge(toSuperviewEdge: .leading, withInset: 30)
        
        contentView.addSubview(locationImageView)
        locationImageView.autoSetDimension(.height, toSize: 0, relation: .greaterThanOrEqual)
        locationImageView.autoSetDimension(.width, toSize: 0, relation: .greaterThanOrEqual)
        locationImageView.autoAlignAxis(toSuperviewAxis: .horizontal)
        locationImageView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30)
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.autoAlignAxis(.vertical, toSameAxisOf: ambassadorImageView)
        nameLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        nameLabel.autoSetDimension(.height, toSize: 0, relation: .greaterThanOrEqual)
        nameLabel.autoSetDimension(.width, toSize: 0, relation: .greaterThanOrEqual)
        nameLabel.autoPinEdge(.top, to: .bottom, of: ambassadorImageView, withOffset: 10)
    }
}
