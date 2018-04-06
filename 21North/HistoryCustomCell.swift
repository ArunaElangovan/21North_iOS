//
//  HistoryCustomCell.swift
//  21North
//
//  Created by Aruna Elangovan on 29/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

class HistoryCustomCell: UITableViewCell {
    let typeLabel = UILabel()
    let dateLabel = UILabelWithPadding()
    let style = Style()
    
    var date: String! = ""{
        didSet{
            dateLabel.text = date
        }
    }
    
    var serviceType: String! = ""{
        didSet{
            typeLabel.text = serviceType
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
        dateLabel.font = style.thirdLineInAFont
        dateLabel.textColor = UIColor.darkGray
        dateLabel.textAlignment = .center
        typeLabel.font = style.thirdLineAFont
        typeLabel.textColor = UIColor.gray
        
        contentView.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.numberOfLines = 0
        typeLabel.lineBreakMode = .byWordWrapping
        typeLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10, 20, 0, 20),  excludingEdge: .bottom)
        typeLabel.autoSetDimension(.height, toSize: 10, relation: .greaterThanOrEqual)
        
        contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.numberOfLines = 0
        dateLabel.layer.borderWidth = 1
        dateLabel.layer.borderColor = style.borderColor
        dateLabel.lineBreakMode = .byWordWrapping
        dateLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(0, 20, 10, 20),  excludingEdge: .top)
        dateLabel.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        dateLabel.autoPinEdge(.top, to: .bottom, of: typeLabel, withOffset: 10)
        
    }
}
