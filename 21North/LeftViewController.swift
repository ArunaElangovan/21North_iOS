//
//  LeftViewController.swift
//  SlideMenuControllerSwift
//
//  Created  on 24-06-2016
//

import UIKit

enum LeftMenu: Int {
    case main = 0
    case swift
    case java
    case go
    case nonMenu
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

@objc protocol MenuVCDelegate{
    func populateProfileScreen()
}

class LeftViewController : BaseViewController, LeftMenuProtocol, UITableViewDataSource, UITableViewDelegate, SocketManagerDelegate1 {
    
    var superViewWidth: CGFloat!
    var superViewHeight: CGFloat!
    let shapes = Shapes()
    let styleFile = Style()
    let appdelegate = UIApplication.shared.delegate as? AppDelegate
    var delegate: MenuVCDelegate?
    let menuTableView = UITableView()
    let profileVC = ProfileViewController()
    var check = 0
    var menus = ["Main", "Swift"]
    var vehicleArray = [String]()
    var mainViewController: UIViewController!
    var swiftViewController: UIViewController!
    let addVehicle = NSLocalizedString("AddVehicleText", comment: "")
    var menuItemsList = [String]()
    let menuArray = [NSLocalizedString("Driving Licence", comment: ""),NSLocalizedString("Settings", comment: ""),NSLocalizedString("Help", comment: ""), NSLocalizedString("Sharing", comment: ""), NSLocalizedString("Partner", comment: ""), NSLocalizedString("About Us", comment: "") ]
    
    func updateCheckForTableCell() {
        if vehicleArray.count > 0{
            check = vehicleArray.count + 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
        menuTableView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    func setupUI(){
        superViewWidth = UIScreen.main.bounds.width
        superViewHeight = UIScreen.main.bounds.height
        
        
        appdelegate?.conn.delegate1 = self
        
        self.view.backgroundColor = UIColor(red: 9/255.0, green: 9/255.0, blue: 26/255.0, alpha: 1.0)
        
        vehicleArray.removeAll()
        
        for index in 0..<DataCreator.sharedInstance.vehicleArray.count {
            vehicleArray.append(DataCreator.sharedInstance.vehicleArray[index].number)
        }
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = UIColor(red: 9/255.0, green: 9/255.0, blue: 26/255.0, alpha: 1.0)
        menuTableView.alwaysBounceVertical = false
        menuTableView.separatorStyle = .none
        view.addSubview(menuTableView)
        
        menuTableView.autoPinEdgesToSuperviewEdges()
        menuItemsList.removeAll()
        menuItemsList.append(addVehicle)
        if(vehicleArray.count != 0){
            menuItemsList.append(contentsOf: vehicleArray)
            menuItemsList.append("")
        }
        check = 0
        updateCheckForTableCell()
        menuItemsList.append(contentsOf: menuArray)
        menuTableView.reloadData()
        menuTableView.register(UINib(nibName: "CustomMenuCell", bundle: nil), forCellReuseIdentifier: "CustomMenuCell")
    }
    
    @objc func reloadVehicleArray(notification: NSNotification){
        menuItemsList.removeAll()
        menuItemsList.append(addVehicle)
        vehicleArray.removeAll()
        for index in 0..<appdelegate!.vehicleArray.count{
            vehicleArray[index] = (appdelegate?.vehicleArray[index][1])!
        }
        
        if(vehicleArray.count != 0){
            menuItemsList.append(contentsOf: vehicleArray)
            menuItemsList.append(" ")
        }
        updateCheckForTableCell()
        menuItemsList.append(contentsOf: menuArray)
        menuTableView.reloadData()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshColl"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "REFCOL"), object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
    }
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .swift:
            self.slideMenuController()?.changeMainViewController(self.swiftViewController, close: true)
        default:
            print();
        }
    }
    
    @objc func openProfile() {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        //If userid is not nil getuserdetails
        guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
            Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
            return
        }
        if DataCreator.sharedInstance.networkCheck == "1"{
            appdelegate?.conn.send("\(Constants.RequestStates.UserDetails)|\(DataCreator.sharedInstance.loginResponse.userId)|")
            profileVC.populate = true
        }
        else{
            ToastManager.internetError()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 34/255.0, green: 34/255.0, blue: 49/255.0, alpha: 1.0)
        
        let profileImageView = UIImageView()
        headerView.addSubview(profileImageView)
        profileImageView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0), excludingEdge: .right)
        profileImageView.autoSetDimension(.height, toSize: 82.0)
        profileImageView.autoSetDimension(.width, toSize: 82.0)
        profileImageView.layer.cornerRadius = 40
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = UIColor.gray
        profileImageView.image = UIImage(named: "Home-Insurance")
        profileImageView.image = Helper.loadImageFromPath()
        
        let nameLabel = UILabel()
        headerView.addSubview(nameLabel)
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        nameLabel.textColor = UIColor.white
        if DataCreator.sharedInstance.loginResponse.fname.isEmpty{
            nameLabel.text = ""
        }
        else{
            nameLabel.text = DataCreator.sharedInstance.loginResponse.fname
        }
        nameLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        nameLabel.autoPinEdge(.left, to: .right, of: profileImageView, withOffset: 10.0)
        nameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10.0)
        nameLabel.autoAlignAxis(.horizontal, toSameAxisOf: profileImageView)
        
        let onTap = UITapGestureRecognizer(target: self, action: #selector(openProfile))
        headerView.addGestureRecognizer(onTap)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomMenuCell") as? CustomMenuCell
        cell?.selectionStyle = .none
        cell?.contentLabel.text = menuItemsList[(indexPath as NSIndexPath).item]
        
        cell?.backgroundColor = UIColor(red: 9/255.0, green: 9/255.0, blue: 26/255.0, alpha: 1.0)
        
        if indexPath.row > check || indexPath.row == 0{
            cell?.contentImageView.image = shapes.drawShapes(type: menuItemsList[(indexPath as NSIndexPath).item])
        }
        else if indexPath.row == check{
            cell?.contentImageView.image = nil
        }
        else if indexPath.row <= vehicleArray.count{
            cell?.contentImageView.image = shapes.drawShapes(type: "car")
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        DataCreator.sharedInstance.currentScreenNo = 1
        var row = indexPath.row
        if vehicleArray.count > 0{
            row = row - vehicleArray.count-1
        }
        if indexPath.row == 0{
            //            passData.clickTrack(dataString: "16")
            guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
                Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
                return
            }
            Helper.topMostController().present(AddVehicleNoViewController(), animated: true, completion: nil)
        }
        else if row == 1{
            //            passData.clickTrack(dataString: "16")
            guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
                Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
                return
            }
            let document = Documents()
            document.triggeredFrom = "DL"
            Helper.topMostController().present(document, animated: true, completion: nil)
        }
        else if row == 2{
            guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
                Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
                return
            }
            openProfile()
        }
        else if row == 3{
            //            passData.clickTrack(dataString: "18")
            guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
                Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
                return
            }
            Helper.topMostController().present(FeedBack(), animated: true, completion: nil)
        }
        else if row == 4{
            //            passData.clickTrack(dataString: "19")
            guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
                Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
                return
            }
            
            Helper.topMostController().present(Sharing(), animated: false, completion: nil)
        }
        else if row == 5{
            //            passData.clickTrack(dataString: "20")
            guard let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) else{
                Helper.topMostController().present(SignUpViewController(), animated: true, completion: nil)
                return
            }
            Helper.topMostController().present(Partner(), animated: true, completion: nil)
        }
        else if row == 6{
            Helper.topMostController().present(AboutUs(), animated: true, completion: nil)
        }
            
        else if row < 0{
            DataCreator.sharedInstance.fullVehicleData.vehiclemake_id = DataCreator.sharedInstance.vehicleArray[row+vehicleArray.count].brandid
            
            let value = ["SCROLL": String(row+vehicleArray.count)]
            NotificationCenter.default.post(name: Notification.Name(rawValue: "SCROLL"), object: nil, userInfo: value)
        }
    }
    
    func presentEditVehicle(){
        Helper.topMostController().present(EditVehicle(), animated: true, completion: nil)
    }
    func presentProfileVC(){
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromRight
        self.view.window!.layer.add(transition, forKey: nil)
        //        self.dismiss(animated: false, completion: nil)
        Helper.topMostController().present(profileVC, animated: false, completion: nil)
    }
    func reloadLeftVC(){
        menuTableView.reloadData()
    }
}
class cellFortable: UITableViewCell{
    
    var txtLabel = UILabel()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let styleFile = Style()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        txtLabel.textColor = styleFile.menuLabelColor
        txtLabel.font = UIFont(name: "HelveticaNeue-Light", size: 15)
        txtLabel.numberOfLines = 0
        contentView.addSubview(txtLabel)
    }
}

