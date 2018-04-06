//
//  HomePageViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 10/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import CoreLocation
import PureLayout

class HomePageViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    var drawservicing = DrawServicing()
    var shapes = Shapes()
    let locationManager = CLLocationManager()
    var numberPromptLabel = UILabel()
    var numberTextField = UITextField()
    var statusLabel = UILabel()
    var countryTextField = UITextField()
    var submitButton = UIButton()
    //    var conn = Socket()
    var latitude = " "
    var longitude = " "
    var pickOption = ["DE", "IN", "FR"]
    var pickFlag = [String]()
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    let serviceData = [[NSLocalizedString("ServicingHeader", comment: ""), NSLocalizedString("ServicingDesc", comment: ""), NSLocalizedString("BookNowText", comment: "")], [NSLocalizedString("CostEstimatorHeader", comment: ""), NSLocalizedString("CostEstimatorDesc", comment: ""), NSLocalizedString("BrowseText", comment: "")], [NSLocalizedString("ChauffeurHeader", comment: ""), NSLocalizedString("ChauffeurDesc", comment: ""), NSLocalizedString("BookNowText", comment: "")], [NSLocalizedString("RSAHeader", comment: ""), NSLocalizedString("RSADesc", comment: ""), NSLocalizedString("BookNowText", comment: "")], [NSLocalizedString("TrackExpenseHeader", comment: ""), NSLocalizedString("TrackExpenseDesc", comment: ""), NSLocalizedString("ComingSoonText", comment: "")], [NSLocalizedString("InsuranceHeader", comment: ""), NSLocalizedString("InsuranceDesc", comment: ""), NSLocalizedString("ComingSoonToYourCityText", comment: "")]]
    
    var arrImageName = ["Home-Expenses","Home-Servicing","Home-Chauffeur","Home-Insurance","Home-RSA", "Home-ESTIMATOR"]
    
    let serviceTableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceTableView.delegate = self
        serviceTableView.dataSource = self
        
    }
    
    //MARK: Tableview delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageCell") as? HomePageCell
        let row = (indexPath as NSIndexPath).item
        cell?.serviceType = serviceData[row][0]
        cell?.serviceDesc = serviceData[row][1]
        cell?.serviceAction = serviceData[row][2]
        cell?.serviceImage = UIImage(named: arrImageName[(indexPath as NSIndexPath).item])?.decompressedImage
        cell?.backgroundColor = UIColor(red: 9/255.0, green: 9/255.0, blue: 26/255.0, alpha: 1.0)
        return cell!
    }
}

