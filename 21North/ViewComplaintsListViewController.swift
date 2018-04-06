//
//  ViewComplaintsListViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 30/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import PureLayout

class ViewComplaintsListViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate{
    let complaintsListTable = UITableView()
    let style = Style()
    var complaintList: [String]!
    let appdelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: UI setup
    func setupUI(){
        view.isUserInteractionEnabled = true
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(backbuttonClicked))
        view.addGestureRecognizer(tapOnView)
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        view.addSubview(complaintsListTable)
        complaintsListTable.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(150, 20, 0, 20))
        complaintsListTable.delegate = self
        complaintsListTable.dataSource = self
        complaintsListTable.backgroundColor = UIColor.clear
        complaintsListTable.separatorStyle = .none
        
        self.complaintsListTable.register(complaintTableCell.self, forCellReuseIdentifier: "cell")
    }
    
    //MARK: Action handling
    @objc func backbuttonClicked(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Tableview delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = complaintList{
            return complaintList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! complaintTableCell
        cell.complaintLabel.text = String(indexPath.row+1) + ". " + complaintList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel()
        headerLabel.text = "List of complaints"
        let styleFile = Style()
        headerLabel.font = styleFile.firstLineRegular
        headerLabel.textColor = UIColor.white
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.textAlignment = .center
        return headerLabel
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

class complaintTableCell: UITableViewCell{
    var complaintLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let styleFile = Style()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
        contentView.addSubview(complaintLabel)
        complaintLabel.textColor = UIColor.white
        complaintLabel.font = styleFile.mapViewLabelFont
        complaintLabel.translatesAutoresizingMaskIntoConstraints = false
        complaintLabel.numberOfLines = 0
        complaintLabel.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        complaintLabel.autoPinEdgesToSuperviewEdges()
    }
}

