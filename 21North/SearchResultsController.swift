//
//  SearchResultsController.swift
//  PlacesLookup
//
//  Created by Malek T. on 9/30/15.
//  Copyright © 2015 Medigarage Studios LTD. All rights reserved.
//

import UIKit

protocol LocateOnTheMap{
    func locateWithLongitude(_ lon:Double, andLatitude lat:Double, andTitle title: String)
    
}

class SearchResultsController: UITableViewController {
    
    var searchResults: [String]!
    var delegate: LocateOnTheMap!
    let shapes = Shapes()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchResults = Array()
        
        //        tableView.frame = CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 80)
        tableView.backgroundColor = UIColor.white
        tableView.contentInset = UIEdgeInsets(top: 100, left: 10, bottom: 0, right: 10)
        tableView = UITableView(frame: CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-90), style: UITableViewStyle.plain)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorStyle = .none
        
        //        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        self.tableView.register(cellForMap.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.searchResults.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cellForMap
        cell1.txtLabel.text = self.searchResults[(indexPath as NSIndexPath).row]
        
        cell1.layer.cornerRadius = 2
        
        return cell1
    }
    //    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 10
    //    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        // 1
        self.dismiss(animated: true, completion: nil)
        
        // 2
        let correctedAddress:String! = self.searchResults[(indexPath as NSIndexPath).row].addingPercentEncoding(withAllowedCharacters: CharacterSet.symbols)
        //            let str = "https://maps.googleapis.com/maps/api/geocode/json?address=\(correctedAddress!)&sensor=false"
        let url = URL(string: "https://maps.googleapis.com/maps/api/geocode/json?address=\(correctedAddress!)&sensor=false")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            // 3
            do {
                if data != nil{
                    let dic = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                    
                    let lat = ((((dic["results"] as AnyObject).value(forKey: "geometry") as AnyObject).value(forKey: "location") as AnyObject).value(forKey: "lat") as AnyObject).object(at: 0) as! Double
                    let lon = ((((dic["results"] as AnyObject).value(forKey: "geometry") as AnyObject).value(forKey: "location") as AnyObject).value(forKey: "lng") as AnyObject).object(at: 0) as! Double
                    // 4
                    self.delegate.locateWithLongitude(lon, andLatitude: lat, andTitle: self.searchResults[(indexPath as NSIndexPath).row])
                    
                }
                
            }catch {
                print("Error")
            }
        })
        // 5
        task.resume()
    }
    
    
    func reloadDataWithArray(_ array:[String]){
        self.searchResults = array
        self.tableView.reloadData()
    }
    
}

class cellForMap: UITableViewCell{
    
    //    var profileImageView = UIImageView()
    let shapes = Shapes()
    var txtLabel = UILabel()
    var viewForCell = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let styleFile = Style()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewForCell.translatesAutoresizingMaskIntoConstraints = false
        viewForCell.layer.borderWidth = 1
        viewForCell.layer.borderColor = styleFile.mapViewBorderColor.cgColor
        viewForCell.layer.cornerRadius = 5
        contentView.addSubview(viewForCell)
        contentView.addConstraintsWithFormat("H:|-10-[v0]-10-|", views: viewForCell)
        contentView.addConstraintsWithFormat("V:|[v0]|", views: viewForCell)
        
        let locationIcon = shapes.drawShapes(contentView, type: "locationIcon")
        viewForCell.addSubview(locationIcon)
        
        
        txtLabel.textColor = styleFile.mapViewFontColor
        txtLabel.font = styleFile.mapViewLabelFont
        txtLabel.translatesAutoresizingMaskIntoConstraints = false
        txtLabel.numberOfLines = 0
        viewForCell.addSubview(txtLabel)
        viewForCell.addConstraintsWithFormat("H:|-10-[v0][v1]-(>=10)-|", views: locationIcon, txtLabel)
        viewForCell.addConstraintsWithFormat("V:|[v0]|", views: txtLabel)
        viewForCell.addConstraintsWithFormat("V:|-20-[v0]", views: locationIcon)
        
        
    }
}

