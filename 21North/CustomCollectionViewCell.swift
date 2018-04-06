//
//  CustomCollectionViewCell.swift
//  scrolltest
//
//  Created by Sree Kumar on 25/05/16.
//  Copyright © 2016 Norte Technologies India Pvt Ltd. All rights reserved.
//

import UIKit



class CustomCollectionViewCell: UICollectionViewCell {
    var customTableView: UITableView!
    weak var datasource: UITableViewDataSource!
    weak var delegate: UITableViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.customTableView = UITableView(frame: frame, style: .plain)
        customTableView.backgroundColor = UIColor.white
        customTableView.separatorInset = UIEdgeInsets.zero
        customTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        //  self.tsekotTableView.dataSource = datasource
        // self.tsekotTableView.delegate = delegate
        
        self.contentView.addSubview(customTableView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDatasourceinfo(_ datasource: UITableViewDataSource) {
        
        self.customTableView.dataSource = datasource
        
    }
    
    func setDelegateinfo(_ delegate: UITableViewDelegate) {
        
        self.customTableView.delegate = delegate
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.customTableView.frame = CGRect(x: 0.0, y: 0.0, width: self.contentView.frame.size.width, height: self.contentView.frame.size.height)
    }
    
    class func reuseIdentifier() -> String {
        return NSStringFromClass(CustomCollectionViewCell.self)
    }
}

