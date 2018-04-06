//
//  ServiceCentreListCell.swift
//  21North
//
//  Created by Aruna Elangovan on 22/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

class ServiceCentreListCell: UITableViewCell {
    let nameLabel = UILabel()
    let ratingImageView = UIImageView()
    let distanceLabel = UILabel()
    let style = Style()
    
    var name: String! = ""{
        didSet{
            nameLabel.text = name
        }
    }
    
    var distance: String! = ""{
        didSet{
            distanceLabel.text = distance
        }
    }
    
    var rating: UIImage? {
        didSet{
            ratingImageView.image = rating
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
        backgroundColor = UIColor.clear
        nameLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        nameLabel.textColor = UIColor.black
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10.0, 10.0, 0.0, 10.0),  excludingEdge: .bottom)
        nameLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(ratingImageView)
        ratingImageView.translatesAutoresizingMaskIntoConstraints = false
        ratingImageView.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        ratingImageView.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 1)
        ratingImageView.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        ratingImageView.autoSetDimension(.width, toSize: 20.0, relation: .greaterThanOrEqual)
        
        contentView.addSubview(distanceLabel)
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.numberOfLines = 0
        distanceLabel.lineBreakMode = .byWordWrapping
        distanceLabel.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 1)
        distanceLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        distanceLabel.autoPinEdge(.left, to: .right, of: ratingImageView, withOffset: 10)
    }
}
