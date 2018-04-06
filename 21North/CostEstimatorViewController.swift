//
//  CostEstimatorViewController.swift
//  21North
//
//  Created by Sachin Tomar on 18/09/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation
@objc protocol UpdateFormWithComplaintsDelegate{
    func updateComplaintsCount(complaintsList: [SubComplaintData])
}
class CostEstimatorViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    let drawservicing = DrawServicing()
    let shapes = Shapes()
    let constraints = Constraints()
    let style = Style()
    var triggeredFrom: String!
    var header: UIImageView!
    var vehicleNumberValue:String!
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var updateFormWithComplaintsDelegate: UpdateFormWithComplaintsDelegate?
    var width: CGFloat!
    var height: CGFloat!
    var addCompArray = [SubComplaintData]()
    var previousList: [SubComplaintData]!
    let scrollView = UIScrollView()
    var tableView = YUTableView()
    var closeOtherNodes: Bool! = true
    var insertRowAnimation: UITableViewRowAnimation! = .middle
    var deleteRowAnimation: UITableViewRowAnimation! = .middle
    var allNodes : [YUTableViewNode]!
    var addComplainTable = UITableView()
    let specialComplaintLabel = UILabel()
    var addComplainHeight = CGFloat(0)
    var totalLabelView = UIView()
    var totalLabel = UILabel()
    var complainCatString:String!
    var complainSubCatString:String!
    var complainFromUser:String!
    var mainView = UIView()
    var tableViewConst:NSArray!
    var dic = [String: UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if previousList != nil{
            addCompArray.append(contentsOf: previousList)
        }
        
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        
        let backButton = shapes.drawShapes(type: "backButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        let nextButtonItem = NavigationItemModel(title: "SELECT", image: nil, highlitedImage: nil, action: #selector(selectButtonClicked), type: NavigationItemType.titleOnly)
        setRightButtonItems(nextButtonItem)
        headerImage = UIImage(named: "servicing")
        pageTitle = DataCreator.sharedInstance.selectedVehicleNumber
        titleFont = style.titleFont!
        titleColor = UIColor.white
        subTitleFont = style.firstLineFont!
        subTitleColor = UIColor.white
        
        view.backgroundColor = UIColor(red: 215.0/255.0, green: 213.0/255.0, blue: 213.0/255.0, alpha: 1.0)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        totalLabelView.backgroundColor = style.costMoneyColor
        view.addSubview(totalLabelView)
        totalLabelView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake((headerImage?.size.height)!, 0, 0, 0), excludingEdge: .bottom)
        totalLabelView.autoSetDimension(.height, toSize: 20, relation: .greaterThanOrEqual)
        
        let viewForTables = UIView()
        scrollView.addSubview(viewForTables)
        scrollView.addConstraintsWithFormat("H:|[v0]|", views: viewForTables)
        scrollView.addConstraintsWithFormat("V:|[v0]|", views: viewForTables)
        
        mainView = drawservicing.addView(2)
        scrollView.addSubview(mainView)
        scrollView.addConstraintsWithFormat("H:|[v0(\(width!))]", views: mainView)
        scrollView.addConstraintsWithFormat("V:|[v0(1500)]|", views: mainView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(mainViewFrame), name: NSNotification.Name(rawValue: "MainViewFrame"), object: nil)
        
        
        tableView = YUTableView(frame: CGRect(x: 0, y: addComplainHeight+CGFloat((self.specialComplaintLabel.calculateMaxLines())*20), width: width, height: 1500), style: UITableViewStyle.plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BasicCell")
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "ComplexCell")
        tableView.separatorColor = UIColor.white
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tableView.isScrollEnabled = false
        mainView.addSubview(tableView)
        tableView.backgroundColor = style.cellBackColor1
        tableView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addConstraintsWithFormat("H:|[v0]|", views: tableView)
        
        dic = ["tableView": tableView]
        
        tableViewConst = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(addComplainHeight+CGFloat((self.specialComplaintLabel.calculateMaxLines())*20)))-[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic) as NSArray!
        mainView.addConstraints(tableViewConst as! [NSLayoutConstraint])
        
        addComplainTable.frame = CGRect(x: 0, y: 0, width: width, height: addComplainHeight)
        addComplainTable.delegate = self
        addComplainTable.dataSource = self
        addComplainTable.setEditing(true, animated: true)
        addComplainTable.allowsSelectionDuringEditing = true
        addComplainTable.isScrollEnabled = false
        mainView.addSubview(addComplainTable)
        
        mainView.addSubview(specialComplaintLabel)
        specialComplaintLabel.autoPinEdge(.top, to: .bottom, of: addComplainTable, withOffset: 0)
        specialComplaintLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 0)
        specialComplaintLabel.autoSetDimension(.width, toSize: width)
        specialComplaintLabel.autoSetDimension(.height, toSize: 0, relation: .greaterThanOrEqual)
        specialComplaintLabel.numberOfLines = 0
        specialComplaintLabel.backgroundColor = UIColor.blue
        specialComplaintLabel.lineBreakMode = .byWordWrapping
        
        totalLabel = drawservicing.makeLabel("\u{20B9} 0", screenWidth: width, heading: "heading")
        totalLabel.textAlignment = .center
        totalLabel.font = style.moneyLabelFont
        
        totalLabel.textColor = UIColor.white
        totalLabelView.addSubview(totalLabel)
        
        totalLabelView.addConstraintsWithFormat("H:|[v0]|", views: totalLabel)
        totalLabelView.addConstraintsWithFormat("V:|[v0]|", views: totalLabel)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: totalLabelView)
        view.addConstraintsWithFormat("H:|[v0]|", views: scrollView)
        
        if triggeredFrom == "BookingForm"{
            totalLabelView.removeFromSuperview()
            view.addConstraintsWithFormat("V:|-100-[v0]|", views: scrollView)
            subTitle = NSLocalizedString("ServicingHeader", comment: "")
        }
        else{
            view.addConstraintsWithFormat("V:|-100-[v0(51)]-1-[v1]|", views: totalLabelView, scrollView)
            subTitle = NSLocalizedString("CostEstimatorHeader", comment: "")
        }
        
        onLoad()
    }
    @objc func mainViewFrame(notification: Notification){
        let pin = notification.userInfo?["rowCount"] as! Int
        mainView.translatesAutoresizingMaskIntoConstraints = true
        mainView.frame = CGRect(x: 0, y: 0, width: width, height: CGFloat(40*pin)+100 + addComplainHeight)
    }
    var complain = String()
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func selectButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        updateFormWithComplaintsDelegate?.updateComplaintsCount(complaintsList: addCompArray)
        self.dismiss(animated: true, completion: nil)
    }
    
    var complainCatArray = [ComplaintData]()
    
    var complainSubCatArray = [SubComplaintData]()
    func onLoad(){
        
        if(complainCatArray.count != DataCreator.sharedInstance.complaintList.count ) {
            for i in 0..<DataCreator.sharedInstance.complaintList.count{
                let complain = DataCreator.sharedInstance.complaintList[i]
                complainCatArray.append(complain)
            }
        }
        
        if(complainSubCatArray.count != DataCreator.sharedInstance.subComplaintList.count) {
            for i in 0..<DataCreator.sharedInstance.subComplaintList.count{
                let subCat = DataCreator.sharedInstance.subComplaintList[i]
                //                if !addCompArray.contains(where: { $0 == subCat }){
                complainSubCatArray.append(subCat)
                //                }
            }
        }
        
        setTableProperties()
        
        self.mainView.removeConstraints(tableViewConst as! [NSLayoutConstraint])
        self.tableViewConst = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(addComplainHeight))-[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic) as NSArray!
        self.mainView.addConstraints(tableViewConst as! [NSLayoutConstraint])
        
        UIView.animate(withDuration: 0.20, animations: {
            self.addComplainTable.frame = CGRect(x: 0, y: 0, width: self.width, height: self.addComplainHeight)
        }, completion: nil)
    }
    func setTableProperties () {
        allNodes = createNodes()
        tableView.setNodes(allNodes)
        tableView.setDelegate(self)
        tableView.allowOnlyOneActiveNodeInSameLevel = true
        
    }
    func createNodes () -> [YUTableViewNode] {
        var nodes = [YUTableViewNode] ()
        for i in 0..<complainCatArray.count {
            var grandChildNodes = [YUTableViewNode] ()
            for k in 0...complainSubCatArray.count-1 {
                var labelText = ""
                if("\(i+1)" == complainSubCatArray[k].headId){
                    labelText = complainSubCatArray[k].desc
                    if triggeredFrom != "BookingForm"{
                        labelText += "(" + complainSubCatArray[k].cost + ")"
                    }
                    let profile: [String: AnyObject?] = ["img": "cat" as AnyObject, "label": labelText as AnyObject]
                    let node = YUTableViewNode(childNodes: grandChildNodes, data: profile as AnyObject?, cellIdentifier: "ComplexCell")
                    grandChildNodes.append(node)
                }
            }
            let node = YUTableViewNode(childNodes: grandChildNodes, data: ["label" : complainCatArray[i].desc] as AnyObject?, cellIdentifier: "BasicCell")
            nodes.append (node)
        }
        let node = YUTableViewNode(childNodes: nil, data: ["label" : "Others"] as AnyObject?, cellIdentifier: "BasicCell")
        nodes.append (node)
        return nodes
    }
    var estimateAmount = 0
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "myIdentifier")
        var labelText = addCompArray[indexPath.row].desc
        if triggeredFrom != "BookingForm"{
            labelText += "(" + addCompArray[indexPath.row].cost + ")"
        }
        cell.myLabel1.text =  labelText
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addCompArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            complainSubCatArray.append(addCompArray[indexPath.row])
            if triggeredFrom != "BookingForm"{
                estimateAmount -= Int(addCompArray[indexPath.row].cost)!
                totalLabel.text = "\u{20B9} " + String(estimateAmount)
            }
            addCompArray.remove(at: indexPath.row)
            addComplainTable.reloadData()
            setTableProperties()
            self.addComplainHeight -= 40
            self.mainView.removeConstraints(tableViewConst as! [NSLayoutConstraint])
            self.tableViewConst = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(addComplainHeight+CGFloat((self.specialComplaintLabel.calculateMaxLines())*20)))-[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic) as NSArray!
            self.mainView.addConstraints(tableViewConst as! [NSLayoutConstraint])
            UIView.animate(withDuration: 0.20, animations: {
                self.addComplainTable.frame = CGRect(x: 0, y: 0, width: self.width, height: self.addComplainHeight)
            }, completion: nil)
        }
    }
    
    func showAlert(){
        //        let alert = UIAlertController(title: "Special complaints", message: nil, preferredStyle:
        //            UIAlertControllerStyle.alert)
        //
        //        alert.addTextField(configurationHandler: textFieldHandler)
        //
        //        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
        //
        //            self.specialComplaintLabel.text = alert.textFields?.first?.text
        //            print(self.specialComplaintLabel.numberOfLines)
        //        }))
        //
        //        self.present(alert, animated: true, completion:nil)
        
        
        
        let alert = UIAlertController(title: "Special complaints", message: nil, preferredStyle: .alert)
        let textView = UITextView()
        textView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let controller = UIViewController()
        
        textView.frame = controller.view.frame
        controller.view.addSubview(textView)
        
        alert.setValue(controller, forKey: "contentViewController")
        
        let height: NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: view.frame.height * 0.4)
        alert.view.addConstraint(height)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            self.specialComplaintLabel.text = textView.text
            //            print(self.specialComplaintLabel.frame.size.height)
            if !(self.specialComplaintLabel.text?.isEmpty)!{
                self.specialComplaintLabel.autoSetDimension(.height, toSize: CGFloat((self.specialComplaintLabel.calculateMaxLines())*20))
                
                self.mainView.removeConstraints(self.tableViewConst as! [NSLayoutConstraint])
                self.tableViewConst = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(self.addComplainHeight+CGFloat((self.specialComplaintLabel.calculateMaxLines())*20)))-[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: self.dic) as NSArray!
                self.mainView.addConstraints(self.self.tableViewConst as! [NSLayoutConstraint])
            }
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldHandler(textField: UITextField!)
    {
        let textView = UITextView()
        textField.addSubview(textView)
        textView.autoSetDimension(.height, toSize: 50, relation: .greaterThanOrEqual)
        textView.autoPinEdgesToSuperviewEdges()
        textField.placeholder = "Add your special complaints here."
        //       textField.frame.height = 50
        specialComplaintLabel.text = textField.text
        
        
    }
    
}
extension CostEstimatorViewController: YUTableViewDelegate {
    func setContentsOfCell(_ cell: UITableViewCell, node: YUTableViewNode) {
        if let customCell = cell as? CustomTableViewCell, let cellDic = node.data as? [String:AnyObject] {
            customCell.label.text = cellDic["label"] as! String?
            customCell.backgroundColor = style.cellBackColor2
        } else {
            cell.textLabel!.text = (node.data as? [String: AnyObject])?["label"] as? String
            cell.backgroundColor = style.cellBackColor1
        }
    }
    func heightForNode(_ node: YUTableViewNode) -> CGFloat? {
        if node.cellIdentifier == "ComplexCell" || node.cellIdentifier == "BasicCell"{
            
            return 40
        }
        return nil
    }
    
    func didSelectNode(_ node: YUTableViewNode, indexPath: IndexPath) {
        if !node.hasChildren() && indexPath.row == 23{
            showAlert()
        }
        else{
            let cellDic = node.data //as? [String: String]
            let labelData = (cellDic!["label"] as! String).split(separator: "(").map(String.init)[0]
            //        print(complainCatArray)
            if (!node.hasChildren() || complainCatArray[indexPath.row].desc != cellDic?["label"]! as! String){
                
                var i = -1
                for index in 0 ..< complainSubCatArray.count{
                    if complainSubCatArray[index].desc == labelData{
                        i = index
                        print(complainSubCatArray[index].desc)
                        break
                    }
                }
                if(i != -1){
                    addCompArray.append(complainSubCatArray[i])
                    if triggeredFrom != "BookingForm"{
                        estimateAmount += Int(complainSubCatArray[i].cost)!
                        totalLabel.text = "\u{20B9} " + String(estimateAmount)
                    }
                    complainSubCatArray.remove(at: i)
                    addComplainTable.reloadData()
                    
                    setTableProperties()
                    
                    self.addComplainHeight += 40
                    self.mainView.removeConstraints(tableViewConst as! [NSLayoutConstraint])
                    self.tableViewConst = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(addComplainHeight))-[tableView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dic) as NSArray!
                    self.mainView.addConstraints(tableViewConst as! [NSLayoutConstraint])
                    UIView.animate(withDuration: 0.20, animations: {
                        self.addComplainTable.frame = CGRect(x: 0, y: 0, width: self.width, height: self.addComplainHeight)
                    }, completion: nil)
                }
            }
        }
    }
}

