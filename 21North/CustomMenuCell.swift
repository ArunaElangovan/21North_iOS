//
//  CustomMenuCell.swift
//  21North
//
//  Created by Aruna Elangovan on 03/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

class CustomMenuCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    //    var cellTitle: String! = ""{
    //        didSet{
    //            contentLabel.text = cellTitle
    //        }
    //    }
    //
    //    var cellImage: UIImage? {
    //        didSet{
    //            contentImageView.image = cellImage
    //        }
    //    }
    
    // MARK: - Inits
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        setupUI()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        contentView.backgroundColor = UIColor.clear
        contentLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        contentLabel.textColor = UIColor.white
    }
}

