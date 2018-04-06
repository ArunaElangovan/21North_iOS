//
//  VehicleHistory.swift
//  21North
//
//  Created by Sachin Tomar on 05/10/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation

class VehicleHistory: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    
    var superViewWidth: CGFloat!
    var superViewHeight: CGFloat!
    let shapes = Shapes()
    let drawservicing = DrawServicing()
    let style = Style()
    let delegate = UIApplication.shared.delegate as? AppDelegate
    
    let brandImageView = UIImageView()
    let vehicleNoLabel = UILabel()
    
    var historyTableView = UITableView()
    
    let bookingFormVC = BookingFormViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewWidth = UIScreen.main.bounds.width
        superViewHeight = UIScreen.main.bounds.height
        
        view.backgroundColor = UIColor.white
        
        let cross = shapes.drawShapes(type: "cross")
        let closeButtonItem = NavigationItemModel(title: nil, image: cross, highlitedImage: nil, action: #selector(backButtonClicked), type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        
        let imageName:String = "BrandImages/Logo" + DataCreator.sharedInstance.fullVehicleData.vehiclemake_id + ".png"
        var brandImage = UIImage()
        if(UIImage(named: imageName)!.size.height > UIImage(named: imageName)!.size.width){
            brandImage = ResizeImage(UIImage(named: imageName)!, targetHeight: 64)
        }
        else{
            brandImage = ResizeImage1(UIImage(named: imageName)!, targetWidth: 94)
        }
        brandImageView.image = brandImage
        view.addSubview(brandImageView)
        brandImageView.autoAlignAxis(.vertical, toSameAxisOf: self.view, withOffset: 0.0)
        brandImageView.autoSetDimension(.width, toSize: 75)
        brandImageView.autoSetDimension(.height, toSize: 75)
        brandImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 30.0)
        brandImageView.autoAlignAxis(.vertical, toSameAxisOf: view)
        
        vehicleNoLabel.backgroundColor = UIColor.white
        vehicleNoLabel.isUserInteractionEnabled = true
        vehicleNoLabel.numberOfLines = 0
        vehicleNoLabel.lineBreakMode = .byWordWrapping
        vehicleNoLabel.translatesAutoresizingMaskIntoConstraints = false
        vehicleNoLabel.text = DataCreator.sharedInstance.selectedVehicleNumber
        vehicleNoLabel.font = style.numberPlateFont
        vehicleNoLabel.textColor = style.labelFontColor
        vehicleNoLabel.textAlignment = .center
        view.addSubview(vehicleNoLabel)
        vehicleNoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        vehicleNoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        vehicleNoLabel.autoPinEdge(.top, to: .bottom, of: brandImageView, withOffset: 30)
        vehicleNoLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        
        view.addSubview(historyTableView)
        historyTableView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(navigationHeight+30+82+30, 20, 20, 20))
        
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.separatorStyle = .none
        historyTableView.showsVerticalScrollIndicator = false
        
        historyTableView.register(HistoryCustomCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
    
    func ResizeImage1(_ image: UIImage, targetWidth: CGFloat) -> UIImage {
        let size = image.size
        
        let heightRatio = targetWidth / image.size.width
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    func ResizeImage(_ image: UIImage, targetHeight: CGFloat) -> UIImage {
        let size = image.size
        let heightRatio = targetHeight / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    //MARK: tableView delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCreator.sharedInstance.historyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryCustomCell
        let splitDateFromSlot = DataCreator.sharedInstance.historyData[indexPath.row].qtime.split(separator: " ").map(String.init)[0]
        
        var splitDate = (splitDateFromSlot.split(separator: "-").map(String.init))
        splitDate[1] = Helper.getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
        cell.date = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
        cell.serviceType = DataCreator.sharedInstance.historyData[indexPath.row].stage
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        openHistoryDetails(index: indexPath.row)
    }
    
    //MARK: Action handling
    func openHistoryDetails(index: Int){
        DataCreator.sharedInstance.bookingFormData.removeAll()
        DataCreator.sharedInstance.serviceType = DataCreator.sharedInstance.historyData[index].typesvc
        
        DataCreator.sharedInstance.bookingFormTitle = NSLocalizedString("QueueIdText", comment: "") +  DataCreator.sharedInstance.historyData[index].queueid
        
        //        //Convert date and time to required format before displaying
        //        let splitSlot = DataCreator.sharedInstance.historyData[index].qtime.split(separator: " ").map(String.init)
        //        var splitDate = (splitSlot[0].split(separator: "-").map(String.init))
        //        splitDate[1] = Helper.getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
        //        let selectedDate = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
        //        let selectedSlot = splitSlot[1].convert24To12HoursFormat()+", "
        
        if DataCreator.sharedInstance.historyData[index].typesvc == "1"{
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ServiceCentreText", comment: ""),DataCreator.sharedInstance.historyData[index].svcname,"2","","serviceCentre"])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("TimeSlotText", comment: ""),Helper.convertSlotToDisplayFormat(slot: DataCreator.sharedInstance.historyData[index].qtime),"","",""])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PickupLocationText", comment: ""),DataCreator.sharedInstance.historyData[index].paddy,"2","",""])//1 = switch req, 2 = button image, 3 = button text
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("DropoffLocationText", comment: ""),DataCreator.sharedInstance.historyData[index].daddy,"2","",""])
            if DataCreator.sharedInstance.historyData[index].idcomplaint != "0"{
                bookingFormVC.complaintsList = DataCreator.sharedInstance.historyData[index].idcomplaint.split(separator: ",").map(String.init)
                DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ViewComplaintsText", comment: ""),String(describing: (DataCreator.sharedInstance.historyData[index].idcomplaint.split(separator: "-").map(String.init).count)) + " " + NSLocalizedString("ComplaintsAddedText", comment: ""),"2","addComp","ViewComplaint"])
            }
            else{
                DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ViewComplaintsText", comment: ""),NSLocalizedString("0ComplaintsText", comment: ""),"2","addComp","ViewComplaint"])
            }
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("AmountSavedText", comment: ""),"","3",DataCreator.sharedInstance.historyData[index].amountsaved,""])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("InvoiceAmountText", comment: ""),"","3",DataCreator.sharedInstance.historyData[index].invamount,""])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("AdvisoryFeeText", comment: ""),"","3",DataCreator.sharedInstance.historyData[index].cfee,""])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PromoDiscountText", comment: ""),"","3",DataCreator.sharedInstance.historyData[index].promoamount,""])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("AmountPayableText", comment: ""),"","3",DataCreator.sharedInstance.historyData[index].totalamount,""])
        }
        
        if DataCreator.sharedInstance.historyData[index].typesvc == "2"{
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PickupLocationText", comment: ""),DataCreator.sharedInstance.historyData[index].paddy,"2","",""])//1 = switch req, 2 = button image, 3 = button text
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("DropoffLocationText", comment: ""),DataCreator.sharedInstance.historyData[index].daddy,"2","",""])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ApproxHoursText", comment: ""),DataCreator.sharedInstance.historyData[index].chafappxhours+" "+NSLocalizedString("HoursText", comment: ""),"","",""])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ChauffeurCostText", comment: ""),"\u{20B9} "+DataCreator.sharedInstance.historyData[index].costofchaf,"3",String(Float(DataCreator.sharedInstance.historyData[index].costofchaf)!*60*Float(DataCreator.sharedInstance.historyData[index].chafappxhours)!),""])
            //            var splitSlot = DataCreator.sharedInstance.historyData[index].chafstarttime.split(separator: " ").map(String.init)
            //            var splitDate = (splitSlot[0].split(separator: "-").map(String.init))
            //            splitDate[1] = DataCreator.sharedInstance.getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
            //            var selectedDate = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
            //            var selectedSlot = splitSlot[1].convert24To12HoursFormat()+", "
            
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("StartedAtText", comment: ""),Helper.convertSlotToDisplayFormat(slot: DataCreator.sharedInstance.historyData[index].chafstarttime),"","",""])
            
            //            splitSlot = DataCreator.sharedInstance.historyData[index].chafendtime.split(separator: " ").map(String.init)
            //            splitDate = (splitSlot[0].split(separator: "-").map(String.init))
            //            splitDate[1] = DataCreator.sharedInstance.getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
            //            selectedDate = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
            //            selectedSlot = splitSlot[1].convert24To12HoursFormat()+", "
            
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("EndedAtText", comment: ""),Helper.convertSlotToDisplayFormat(slot: DataCreator.sharedInstance.historyData[index].chafendtime),"","",""])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PromoDiscountText", comment: ""),"","3",DataCreator.sharedInstance.historyData[index].promoamount,""])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("AmountPayableText", comment: ""),"","3",DataCreator.sharedInstance.historyData[index].totalamount,""])
        }
        if DataCreator.sharedInstance.historyData[index].typesvc == "3"{
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PickupLocationText", comment: ""),DataCreator.sharedInstance.historyData[index].paddy,"2","",""])//1 = switch req, 2 = button image, 3 = button text
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ServiceCentreText", comment: ""),DataCreator.sharedInstance.historyData[index].svcname,"2","","serviceCentre"])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("TypeOfServiceText", comment: ""),DataCreator.sharedInstance.historyData[index].rsadesc,"","",""])
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ConvenienceFeeText", comment: ""),NSLocalizedString("ServiceChargesText", comment: ""),"3", DataCreator.sharedInstance.historyData[index].cfee,""])
        }
        bookingFormVC.triggeredFrom = "History"
        bookingFormVC.historyServiceRating = DataCreator.sharedInstance.historyData[index].svcrating
        
        Helper.topMostController().present(bookingFormVC, animated: true, completion: nil)
    }
}

