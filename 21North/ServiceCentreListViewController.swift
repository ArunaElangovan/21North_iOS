//
//  ServiceCentreListViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 22/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import PureLayout

@objc protocol UpdateFormWithServiceCentreDelegate{
    func updateServiceCentre(serviceCentreName: String, serviceCentreId: String)
}

class ServiceCentreListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    let allTable = UITableView()
    let authorizedTable = UITableView()
    let multibrandTable = UITableView()
    let shapes = Shapes()
    var serviceCentreSegmentControl: UISegmentedControl!
    var updateFormWithServiceCentreDelegate: UpdateFormWithServiceCentreDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
    }
    
    //MARK: UI setup
    func setupUI(){
        view.backgroundColor = UIColor.white
        
        let backButton = shapes.drawShapes(type: "blackBackButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        let viewList = ["All", "Authorized", "Multibrand"]
        serviceCentreSegmentControl = UISegmentedControl(items: viewList)
        
        // Set up Frame and SegmentedControl
        let frame = UIScreen.main.bounds
        serviceCentreSegmentControl.frame = CGRect(x: frame.minX + 90, y: frame.minY + 20,
                                                   width: frame.width - 100, height: 30)
        
        // Style the Segmented Control
        serviceCentreSegmentControl.layer.cornerRadius = 5.0
        serviceCentreSegmentControl.backgroundColor = UIColor.white
        serviceCentreSegmentControl.tintColor = UIColor.blue
        
        // Add target action method
        serviceCentreSegmentControl.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        
        // Add this custom Segmented Control to our view
        self.view.addSubview(serviceCentreSegmentControl)
        
        view.addSubview(allTable)
        allTable.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(60, 20, 10, 20))
        
        allTable.delegate = self
        allTable.dataSource = self
        allTable.separatorStyle = .none
        allTable.showsVerticalScrollIndicator = false
        
        allTable.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(authorizedTable)
        authorizedTable.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(60, 20, 10, 20))
        
        authorizedTable.delegate = self
        authorizedTable.dataSource = self
        authorizedTable.separatorStyle = .none
        authorizedTable.showsVerticalScrollIndicator = false
        
        authorizedTable.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(multibrandTable)
        multibrandTable.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(60, 20, 10, 20))
        
        multibrandTable.delegate = self
        multibrandTable.dataSource = self
        multibrandTable.separatorStyle = .none
        multibrandTable.showsVerticalScrollIndicator = false
        
        multibrandTable.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        
        serviceCentreSegmentControl.selectedSegmentIndex = 0
        allTable.isHidden = false
        authorizedTable.isHidden = true
        multibrandTable.isHidden = true
    }
    
    //MARK: Action handling
    @objc func indexChanged(_ sender: UISegmentedControl) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        switch sender.selectedSegmentIndex {
        case 0:
            allTable.isHidden = false
            authorizedTable.isHidden = true
            multibrandTable.isHidden = true
        case 1:
            allTable.isHidden = true
            authorizedTable.isHidden = false
            multibrandTable.isHidden = true
        case 2:
            allTable.isHidden = true
            authorizedTable.isHidden = true
            multibrandTable.isHidden = false
        default:
            break;
        }
    }
    
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Textfield delegate and keyboard
    func hideKeyboard(){
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == authorizedTable{
            return DataCreator.sharedInstance.serviceCentreList.count
        }
        else if tableView == allTable {
            return DataCreator.sharedInstance.serviceCentreList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.myLabel1.text = DataCreator.sharedInstance.serviceCentreList[indexPath.row].name
        cell.ratingStars.image = shapes.drawRatingStars(Int(DataCreator.sharedInstance.serviceCentreList[indexPath.row].rating)!)
        cell.distLabel.text = DataCreator.sharedInstance.serviceCentreList[indexPath.row].distance+" "+NSLocalizedString("KMtext", comment: "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        updateFormWithServiceCentreDelegate?.updateServiceCentre(serviceCentreName: DataCreator.sharedInstance.serviceCentreList[indexPath.row].name, serviceCentreId: DataCreator.sharedInstance.serviceCentreList[indexPath.row].id)
        backButtonClicked()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
