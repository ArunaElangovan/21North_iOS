//
//  CustomTableViewCell.swift
//  YUTableView-Swift
//
//  Created by yücel uzun on 24/07/15.
//  Copyright © 2015 Yücel Uzun. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var img = UIImageView()
    var label = UILabel()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label.frame = CGRect(x: 100, y: 10, width: 20, height: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        contentView.addConstraintsWithFormat("H:|-30-[v0]|", views: label)
        contentView.addConstraintsWithFormat("V:|[v0]|", views: label)
        img.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
        contentView.addSubview(img)
        // Initialization code
    }
    
    func setLabel (_ text: String, andImage imageName: String) {
        
        label.text = text
        img.image = UIImage(named: imageName)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

