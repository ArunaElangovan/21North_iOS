//
//  MyTableViewCell.swift
//  TableView
//
//  Created by Sachin Tomar on 14/07/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    var myLabel1: UILabel!
    var ratingStars: UIImageView!
    var distLabel : UILabel!
    var estimateAmount: UILabel!
    var chat : UILabel!
    let style1 = Style()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let gap : CGFloat = 10
        let labelHeight: CGFloat = 30
        let labelWidth: CGFloat = 150
        let lineGap : CGFloat = 5
        //        let label2Y : CGFloat = gap + labelHeight + lineGap
        //        let imageSize : CGFloat = 60
        
        myLabel1 = UILabel()
        myLabel1.frame = CGRect(x: gap, y: 10, width: UIScreen.main.bounds.width - gap - 5, height: labelHeight)
        myLabel1.textColor = UIColor.black
        myLabel1.font = style1.serviceCentreLabelFont
        contentView.addSubview(myLabel1)
        
        estimateAmount = UILabel()
        estimateAmount.frame = CGRect(x: bounds.width-labelWidth - gap, y: 10, width: labelWidth, height: labelHeight)
        estimateAmount.textColor = UIColor.black
        contentView.addSubview(estimateAmount)
        
        ratingStars = UIImageView()
        ratingStars.frame = CGRect(x: gap, y: labelHeight + lineGap, width: 120, height: labelHeight)
        contentView.addSubview(ratingStars)
        
        
        distLabel = UILabel()
        distLabel.frame = CGRect(x: gap + 100, y: labelHeight + lineGap, width: 100, height: 20)
        distLabel.font = style1.promoLabelFont
        distLabel.textColor = style1.distanceLabelColor
        contentView.addSubview(distLabel)
    }
    
    
}

