//
//  DocumentCustomCell.swift
//  21North
//
//  Created by Aruna Elangovan on 19/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

class DocumentCustomCell: UITableViewCell {
    
    let containerView = UIView()
    let checkImage = UIImageView()
    let contentLabel = UILabel()
    let style = Style()
    let shapes = Shapes()
    
    var cellTitle: String! = ""{
        didSet{
            contentLabel.text = cellTitle
        }
    }
    
    var cellImage: UIImage? {
        didSet{
            checkImage.image = cellImage
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
        contentLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        contentLabel.textColor = UIColor.black
        
        contentView.addSubview(containerView)
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = style.borderColor
        containerView.isUserInteractionEnabled = true
        containerView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10.0, 20.0, 10.0, 20.0))
        containerView.autoSetDimension(.height, toSize: 30.0, relation: .greaterThanOrEqual)
        
        containerView.addSubview(checkImage)
        checkImage.image = shapes.upload()
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        checkImage.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10.0, 0.0, 10.0, 10.0),  excludingEdge: .left)
        checkImage.autoSetDimension(.height, toSize: 30.0)
        checkImage.autoSetDimension(.width, toSize: 30.0)
        
        containerView.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 10.0)
        contentLabel.autoAlignAxis(toSuperviewMarginAxis: .horizontal)
        contentLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        contentLabel.autoPinEdge(.right, to: .left, of: checkImage)
    }
}

