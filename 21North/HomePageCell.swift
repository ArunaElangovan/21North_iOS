//
//  HomePageCustomCell.swift
//  21North
//
//  Created by Aruna Elangovan on 09/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

class HomePageCell: UITableViewCell {
    
    @IBOutlet weak var serviceTypeLabel: UILabel!
    @IBOutlet weak var serviceDescLabel: UILabel!
    @IBOutlet weak var serviceActionLabel: UILabel!
    @IBOutlet weak var serviceImageView: UIImageView!
    @IBOutlet weak var separatorImageView: UIImageView!
    
    /// Set Navigation bar page title
    var serviceType:String = "" {
        didSet{
            serviceTypeLabel.text = serviceType
        }
    }
    
    var serviceDesc:String = "" {
        didSet{
            serviceDescLabel.text = serviceDesc
        }
    }
    
    var serviceAction:String = "" {
        didSet{
            serviceActionLabel.text = serviceAction
        }
    }
    
    /// Set Color for title label in Navigation bar
    var serviceTypeColor: UIColor = UIColor.blue {
        didSet {
            serviceTypeLabel.textColor = serviceTypeColor
        }
    }
    
    /// Set Color for title label in Navigation bar
    var serviceDescColor: UIColor = UIColor.blue {
        didSet {
            serviceDescLabel.textColor = serviceDescColor
        }
    }
    
    /// Set Color for title label in Navigation bar
    var serviceActionColor: UIColor = UIColor.blue {
        didSet {
            serviceActionLabel.textColor = serviceActionColor
        }
    }
    
    /// Set titleLabel font in Navigation bar
    var serviceTypeFont: UIFont = UIFont.systemFont(ofSize: 18.0){
        didSet {
            serviceTypeLabel.font = serviceTypeFont
        }
    }
    
    /// Set titleLabel font in Navigation bar
    var serviceDescFont: UIFont = UIFont.systemFont(ofSize: 18.0){
        didSet {
            serviceDescLabel.font = serviceDescFont
        }
    }
    
    /// Set titleLabel font in Navigation bar
    var serviceActionFont: UIFont = UIFont.systemFont(ofSize: 18.0){
        didSet {
            serviceActionLabel.font = serviceActionFont
        }
    }
    
    /// Set background image for page
    var serviceImage: UIImage? {
        didSet{
            serviceImageView.image = serviceImage
        }
    }
    
    /// Set background image for page
    var separatorImage: UIImage? {
        didSet{
            separatorImageView.image = separatorImage
        }
    }


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
    }
}

