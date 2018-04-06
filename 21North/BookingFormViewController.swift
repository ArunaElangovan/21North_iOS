//
//  BookingFormViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 10/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import Foundation

@objc protocol BookingFormVCDelegate{
    func reloadHomeForRSAChauffeur()
}
@objc protocol BookingFormVCDelegate1{
    func reloadModifyScreen()
}

class BookingFormViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, MapViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, VerifyPromoDelegate, UpdateFormWithComplaintsDelegate,UpdateFormWithServiceCentreDelegate, ModifyBookingVCDelegate, SocketManagerDelegate6, RequestingScreenVCDelegate{
    let bookingTable = UITableView()
    var triggeredFrom: String!
    var style = Style()
    var shapes = Shapes()
    var bookingFormVCDelegate:BookingFormVCDelegate?
    var bookingFormVCDelegate1:BookingFormVCDelegate1?
    var complaintsIDList: String!
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var pickupLocCell =  BookingFormCell()
    var dropoffLocCell = BookingFormCell()
    var promoCell =  BookingFormCell()
    var slotCell = BookingFormCell()
    var serviceCentreCell = BookingFormCell()
    var rsaComplaintCell = BookingFormCell()
    var serviceComplaintCell = BookingFormCell()
    var buttonCell = BookingButtonCell()
    var hoursCell = BookingFormCell()
    var rsaCfeeCell = BookingFormCell()
    var chauffCfeeCell = BookingFormCell()
    var isLightBackground: Bool!
    let requestingScreen = RequestingScreen()
    var rsaComplaintPickedIndex = 1
    var qTime: String!
    var serviceCentId = ""
    var serviceCentName = ""
    var serviceCentPLat = ""
    var serviceCentPLong = ""
    var promo = ""
    var pickLat = ""
    var pickLong = ""
    var dropLat = ""
    var dropLong = ""
    var pickupLocLabel = UILabel()
    var dropoffLabel = UILabel()
    var showAllFields = true
    var yearArray = [String]()
    var monthArray = [[String]]()
    var separateDateArray = [[String]]()
    var datesArray = [String]()
    var isTowing = true
    var dateString = ""
    var complaintsList: [String]!
    var complaintsCellRow = 0
    var promoCellRow = 0
    var serviceCentreRow = 0
    let costEstimatorVC = CostEstimatorViewController()
    let pickerContainerView = UIView()
    var slotPicker = UIPickerView()
    var rsaComplaintPicker = UIPickerView()
    var chaufHoursPicker = UIPickerView()
    var chaufHoursArray = ["1","2","3","4"]
    var pickupRequiredText = ""
    var selectedSlot = ""
    var historyServiceRating: String!
    var isServiceCentreUpdated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appdelegate.conn.delegate6 = self
        setupUI()
        //        if !DataCreator.sharedInstance.postBookingData.isEmpty && (DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].typesvc == "2" || DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].typesvc == "3") {
        //        presentBookingConfirmedVC()
        //        }
    }
    
    //MARK: UI setup
    func setupUI(){
        isLightBackground = false
        DataCreator.sharedInstance.currentScreen = "BookingScreen"
        view.backgroundColor = style.background2
        let backButton = shapes.drawShapes(type: "backButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        if DataCreator.sharedInstance.serviceType == "1"{
            headerImage = UIImage(named: "Home-Servicing")
        }
        else if DataCreator.sharedInstance.serviceType == "2"{
            headerImage = UIImage(named: "Home-Chauffeur")
        }
        else if DataCreator.sharedInstance.serviceType == "3"{
            headerImage = UIImage(named: "Home-RSA")
        }
        pageTitle = DataCreator.sharedInstance.selectedVehicleNumber
        titleFont = style.titleFont!
        titleColor = UIColor.white
        subTitle = DataCreator.sharedInstance.bookingFormTitle
        subTitleFont = style.firstLineFont!
        subTitleColor = UIColor.white
        
        view.addSubview(bookingTable)
        bookingTable.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake((headerImage?.size.height)!, 0, 0, 0))
        bookingTable.delegate = self
        bookingTable.dataSource = self
        bookingTable.separatorStyle = .none
        bookingTable.showsVerticalScrollIndicator = false
        bookingTable.register(ModifyBookingButtonCell.self, forCellReuseIdentifier: "ModifyBookingButtonCell")
        bookingTable.register(BookingFormCell.self, forCellReuseIdentifier: "BookingFormCell")
        bookingTable.register(BookingFormSwitchCell.self, forCellReuseIdentifier: "BookingFormSwitchCell")
        bookingTable.register(BookingButtonCell.self, forCellReuseIdentifier: "BookingButtonCell")
        if DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 0 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 3 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 7 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 2 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 6{
            bookingTable.backgroundColor = style.background2
        }
        else{
            bookingTable.backgroundColor = style.background1
        }
        
        //        if (DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0") && triggeredFrom != "History"{
        //            if DataCreator.sharedInstance.serviceType == "1"{
        //                pickupRequiredText = NSLocalizedString("PickupDropRequiredText", comment: "")
        //            }
        //            else{
        //               pickupRequiredText = NSLocalizedString("PickupDropNotRequiredText", comment: "")
        //            }
        //        }
        if DataCreator.sharedInstance.serviceType == "3"  && triggeredFrom != "History"{
            DataCreator.sharedInstance.bookingFormData[0][1] = NSLocalizedString("VehicleNotMovingText", comment: "")
        }
        bookingTable.reloadData()
        setPickerData()
        
        bookingTable.setContentOffset(CGPoint.zero, animated: true)
        bookingTable.scrollToTop()
    }
    
    //MARK: Data handling
    func setPickerData(){
        var monthIndex = 0
        var yearIndex = 0
        separateDateArray.removeAll()
        yearArray.removeAll()
        monthArray.removeAll()
        for i in 0 ..< DataCreator.sharedInstance.dateList.count{
            separateDateArray.append(DataCreator.sharedInstance.dateList[i].split(separator: "-").map(String.init))
            if i>0 && separateDateArray[i][0] != yearArray[yearIndex-1]{
                yearArray.append(separateDateArray[i][0])
                yearIndex += 1
            }
            else if i == 0{
                yearArray.append(separateDateArray[i][0])
                yearIndex += 1
            }
            if i>0 && separateDateArray[i][1] != monthArray[monthIndex-1][1]{
                monthArray.append([separateDateArray[i][0], separateDateArray[i][1]])
                monthIndex += 1
            }
            else if i == 0{
                monthArray.append([separateDateArray[i][0], separateDateArray[i][1]])
                monthIndex += 1
            }
        }
        yearArray = yearArray.unique()
    }
    
    //MARK: Action handling
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        self.view.window!.layer.add(Helper.presentDismissTransition(), forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func switchStateAction(_ sender: UISwitch) {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        if sender.isOn{
            print("is on")
            if DataCreator.sharedInstance.serviceType == "3"{
                isTowing = true
                if DataCreator.sharedInstance.rsaBookingFormData.serviceCentreData.isEmpty{
                    DataCreator.sharedInstance.bookingFormData[4][1] = NSLocalizedString("NoServiceCentreText", comment: "")
                    DataCreator.sharedInstance.bookingFormData[4][3] = "0"
                }
                else{
                    DataCreator.sharedInstance.bookingFormData[4][1] = DataCreator.sharedInstance.rsaBookingFormData.rsaComplaintData[0].description
                    DataCreator.sharedInstance.bookingFormData[4][3] = DataCreator.sharedInstance.rsaBookingFormData.rsaCost
                }
                DataCreator.sharedInstance.bookingFormData[0][1] = NSLocalizedString("VehicleNotMovingText", comment: "")
            }
            showAllFields = true
            bookingTable.reloadData()
        }
        else{
            print("is off")
            if DataCreator.sharedInstance.serviceType == "3"{
                isTowing = false
                var complaint = ""
                if rsaComplaintCell.desc.isEmpty{
                    complaint = DataCreator.sharedInstance.rsaComplaintList[1].description
                    rsaComplaintCell.desc = DataCreator.sharedInstance.rsaComplaintList[1].description
                }
                else{
                    complaint = DataCreator.sharedInstance.rsaComplaintList[rsaComplaintPickedIndex].description
                    rsaComplaintCell.desc = DataCreator.sharedInstance.rsaComplaintList[rsaComplaintPickedIndex].description
                }
                for i in 0 ..< DataCreator.sharedInstance.rsaComplaintList.count{
                    if DataCreator.sharedInstance.rsaComplaintList[i].description == complaint{
                        DataCreator.sharedInstance.bookingFormData[4][3] = DataCreator.sharedInstance.rsaComplaintList[i].amount
                        break
                    }
                }
                DataCreator.sharedInstance.bookingFormData[4][1] = complaint
                DataCreator.sharedInstance.bookingFormData[2][1] = complaint
                DataCreator.sharedInstance.bookingFormData[0][1] = NSLocalizedString("VehicleMovingText", comment: "")
            }
            showAllFields = false
            bookingTable.reloadData()
        }
    }
    
    func openSlotPicker() {
        view.addSubview(pickerContainerView)
        pickerContainerView.frame = CGRect(x: 0,y: UIScreen.main.bounds.height-130,width: UIScreen.main.bounds.width,height: 130)
        pickerContainerView.backgroundColor = UIColor.lightGray
        let pickerFrame = CGRect(x: 0,y: 30,width: UIScreen.main.bounds.width,height: 100)
        if DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0"{
            pickerContainerView.addSubview(slotPicker)
            slotPicker.delegate = self
            slotPicker.dataSource = self
            slotPicker.frame = pickerFrame
            slotPicker.backgroundColor = style.background2
            slotPicker.selectRow(0, inComponent: 0, animated: true)
            slotPicker.selectRow(0, inComponent: 1, animated: true)
            slotPicker.selectRow(0, inComponent: 2, animated: true)
            slotPicker.selectRow(0, inComponent: 3, animated: true)
        }
        else if DataCreator.sharedInstance.serviceType == "3"{
            pickerContainerView.addSubview(rsaComplaintPicker)
            rsaComplaintPicker.delegate = self
            rsaComplaintPicker.dataSource = self
            rsaComplaintPicker.selectRow(0, inComponent: 0, animated: true)
            rsaComplaintPicker.frame = pickerFrame
            rsaComplaintPicker.backgroundColor = style.background2
            rsaComplaintPicker.selectRow(0, inComponent: 0, animated: true)
        }
        else if DataCreator.sharedInstance.serviceType == "2"{
            pickerContainerView.addSubview(chaufHoursPicker)
            chaufHoursPicker.delegate = self
            chaufHoursPicker.dataSource = self
            chaufHoursPicker.selectRow(0, inComponent: 0, animated: true)
            chaufHoursPicker.frame = pickerFrame
            chaufHoursPicker.backgroundColor = style.background2
            chaufHoursPicker.selectRow(0, inComponent: 0, animated: true)
        }
        let doneButton = UIButton()
        pickerContainerView.addSubview(doneButton)
        doneButton.frame = CGRect(x: UIScreen.main.bounds.width-100,y: 0,width: 100,height: 30)
        doneButton.setTitle("DONE", for: .normal)
        doneButton.setTitleColor(UIColor.black, for: .normal)
        doneButton.addTarget(self, action: #selector(doneDatePicker), for: .touchUpInside)
        
        let cancelButton = UIButton()
        pickerContainerView.addSubview(cancelButton)
        cancelButton.frame = CGRect(x: 10,y: 0,width: 100,height: 30)
        cancelButton.setTitle("CANCEL", for: .normal)
        cancelButton.setTitleColor(UIColor.black, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelDatePicker), for: .touchUpInside)
    }
    
    @objc func cancelDatePicker(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        pickerContainerView.removeFromSuperview()
    }
    
    @objc func doneDatePicker(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        //For date formate
        let formatter = DateFormatter()
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateFormat = "hh:mm a, MMMM dd, yyyy"
        if DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0"{
            if !dateString.isEmpty{
                var splitDate = (dateString.split(separator: "-").map(String.init))
                splitDate[1] = Helper.getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
                let defaultSelectedDate = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
                let defaultSelectedSlot = DataCreator.sharedInstance.slotList[slotPicker.selectedRow(inComponent: 3)].slottime.convert24To12HoursFormat()+", "
                slotCell.desc = defaultSelectedSlot+defaultSelectedDate
                DataCreator.sharedInstance.bookingFormData[0][1] = defaultSelectedSlot+defaultSelectedDate
            }
        }
        else if DataCreator.sharedInstance.serviceType == "3"{
            rsaComplaintCell.desc = DataCreator.sharedInstance.rsaComplaintList[rsaComplaintPicker.selectedRow(inComponent: 0)+1].description
            rsaCfeeCell.desc = DataCreator.sharedInstance.rsaComplaintList[rsaComplaintPicker.selectedRow(inComponent: 0)+1].description
            DataCreator.sharedInstance.bookingFormData[2][1] = DataCreator.sharedInstance.rsaComplaintList[rsaComplaintPicker.selectedRow(inComponent: 0)+1].description
            DataCreator.sharedInstance.bookingFormData[4][1] = DataCreator.sharedInstance.rsaComplaintList[rsaComplaintPicker.selectedRow(inComponent: 0)+1].description
        }
        else{
            hoursCell.desc = chaufHoursArray[chaufHoursPicker.selectedRow(inComponent: 0)]+" "+NSLocalizedString("HoursText", comment: "")
            DataCreator.sharedInstance.bookingFormData[2][1] = hoursCell.desc
            DataCreator.sharedInstance.bookingFormData[3][3] = String(Float(chaufHoursArray[chaufHoursPicker.selectedRow(inComponent: 0)])!*60*Float(DataCreator.sharedInstance.chauffeurBookingFormData.cost)!)
            
            chauffCfeeCell.actionButton.setTitle(String(Float(chaufHoursArray[chaufHoursPicker.selectedRow(inComponent: 0)])!*60*Float(DataCreator.sharedInstance.chauffeurBookingFormData.cost)!), for: .normal)
        }
        pickerContainerView.removeFromSuperview()
    }
    
    @objc func viewInvoice(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        let webVC = WebViewController()
        webVC.hidesBottomBarWhenPushed = true
        webVC.urlString = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].invoiceUrl
        webVC.pagetitle = NSLocalizedString("InvoiceText", comment: "")
        webVC.shouldShowHeaderImage = true
        Helper.topMostController().present(webVC, animated: true, completion: nil)
    }
    
    //MARK: TableView delegate and datasource
    let textColor = UIColor.darkGray
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0") && triggeredFrom == "History"{
            return DataCreator.sharedInstance.bookingFormData.count+1
        }
        return DataCreator.sharedInstance.bookingFormData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingFormCell") as? BookingFormCell
        cell?.ratingStars.image = nil
        cell?.actionButton.setTitle("", for: .normal)
        
        //button cell
        if  (DataCreator.sharedInstance.serviceType == "0" || DataCreator.sharedInstance.serviceType == "1") && triggeredFrom == "History" && row == DataCreator.sharedInstance.bookingFormData.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ModifyBookingButtonCell") as? ModifyBookingButtonCell
            cell?.secondButtonText = NSLocalizedString("ViewInvoiceText", comment: "")
            cell?.firstButtonTextFont = style.firstLineMedium
            cell?.firstButtonTextColor = UIColor.white
            cell?.secondButton.addTarget(self, action: #selector(viewInvoice), for: .touchUpInside)
            cell?.numberOfButtons = 4
            
            //            if !isLightBackground{
            //                cell?.backgroundColor = style.background1
            //            }
            //            else{
            //                cell?.backgroundColor = style.background2
            //            }
            if DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 0 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 3 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 7 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 2 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 6{
                cell?.backgroundColor = style.background2
            }
            else{
                cell?.backgroundColor = style.background1
            }
            
            return cell!
        }
            
        else if row == DataCreator.sharedInstance.bookingFormData.count - 1 && triggeredFrom != "History"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookingButtonCell", for: indexPath) as? BookingButtonCell
            cell?.etaHeaderText = DataCreator.sharedInstance.bookingFormData[row][0]
            cell?.etaDescText = DataCreator.sharedInstance.bookingFormData[row][1]
            cell?.buttonTitle = DataCreator.sharedInstance.bookingFormData[row][2]
            cell?.buttonTextColor = UIColor.white
            cell?.etaDescFont = style.secondLineRegular
            cell?.etaDescColor = UIColor.darkGray
            cell?.etaHeaderColor = UIColor.black
            cell?.etaHeaderFont = style.firstLineRegular
            cell?.buttonTextFont = style.firstLineMedium
            buttonCell = cell!
            
            //            if !isLightBackground{
            //                cell?.backgroundColor = style.background1
            //            }
            //            else{
            //                cell?.backgroundColor = style.background2
            //            }
            if DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 0 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 3 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 7 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 2 || DataCreator.sharedInstance.bookingFormData.count - 1 % 4 == 6{
                cell?.backgroundColor = style.background2
            }
            else{
                cell?.backgroundColor = style.background1
            }
            
            return cell!
        }
        else {
            if !showAllFields && DataCreator.sharedInstance.serviceType == "3" {
                if row == 1{
                    DataCreator.sharedInstance.bookingFormData[row][0] = NSLocalizedString("ServiceNeededAtText", comment: "")
                    //                if !dropoffLocCell.desc.isEmpty{
                    //                DataCreator.sharedInstance.bookingFormData[row][1] = dropoffLocCell.desc
                    //                }
                }
                if row == 2{
                    DataCreator.sharedInstance.bookingFormData[row][0] = NSLocalizedString("TypeOfServiceText", comment: "")
                    //                DataCreator.sharedInstance.bookingFormData[row][1] = DataCreator.sharedInstance.rsaComplaintList[1][0]
                    DataCreator.sharedInstance.bookingFormData[row][4] = "rsaComplaint"
                    cell?.ratingStars.image = nil
                }
            }
            else if showAllFields && DataCreator.sharedInstance.serviceType == "3" && triggeredFrom != "History"{
                if row == 1{
                    DataCreator.sharedInstance.bookingFormData[row][0] = NSLocalizedString("BreakdownLocText", comment: "")
                    //                if !dropoffLocCell.desc.isEmpty{
                    //                    DataCreator.sharedInstance.bookingFormData[row][1] = dropoffLocCell.desc
                    //                }
                }
                if row == 2{
                    DataCreator.sharedInstance.bookingFormData[row][0] = NSLocalizedString("ServiceCentreText", comment: "")
                    if DataCreator.sharedInstance.serviceCentreList.isEmpty{
                        DataCreator.sharedInstance.bookingFormData[row][1] = NSLocalizedString("NoServiceCentreText", comment: "")
                    }
                    else if !isServiceCentreUpdated{
                        DataCreator.sharedInstance.bookingFormData[row][1] = DataCreator.sharedInstance.serviceCentreList[0].name
                    }
                    else{
                        DataCreator.sharedInstance.bookingFormData[row][1] = serviceCentName
                    }
                    DataCreator.sharedInstance.bookingFormData[row][4] = "serviceCentre"
                }
            }
            //Other fields
            cell?.header = DataCreator.sharedInstance.bookingFormData[row][0]
            cell?.desc = DataCreator.sharedInstance.bookingFormData[row][1]
            cell?.headerColor = UIColor.black
            cell?.descColor = textColor
            cell?.descFont = style.secondLineFont!
            cell?.headerFont = style.firstLineRegular!
            if DataCreator.sharedInstance.bookingFormData[row][2] == "2"{
                cell?.buttonImage = shapes.drawShapes(type: DataCreator.sharedInstance.bookingFormData[row][3])
                
                if DataCreator.sharedInstance.bookingFormData[row][3] == "locationIcon"{
                    cell?.actionButton.tag = Int(DataCreator.sharedInstance.bookingFormData[row][4])!
                    if DataCreator.sharedInstance.bookingFormData[row][4] == "1"{
                        pickupLocCell = cell!
                    }
                    else{
                        dropoffLocCell = cell!
                    }
                }
            }
            else if DataCreator.sharedInstance.bookingFormData[row][2] == "1"{
                let cell = tableView.dequeueReusableCell(withIdentifier: "BookingFormSwitchCell") as? BookingFormSwitchCell
                //            let cell = BookingFormSwitchCell.init(style: .default, reuseIdentifier: "cell")
                cell?.header = DataCreator.sharedInstance.bookingFormData[row][0]
                cell?.desc = DataCreator.sharedInstance.bookingFormData[row][1]
                cell?.headerColor = UIColor.black
                cell?.descColor = textColor
                cell?.descFont = style.secondLineFont!
                cell?.headerFont = style.firstLineRegular!
                //            if DataCreator.sharedInstance.serviceType == "0"{
                //                cell?.pickupRequiredSwitch.isOn = false
                //            }
                //            else if DataCreator.sharedInstance.serviceType == "1"{
                //                cell?.pickupRequiredSwitch.isOn = true
                //            }
                cell?.backgroundColor = style.background1
                cell?.pickupRequiredSwitch.addTarget(self, action: #selector(switchStateAction), for: .valueChanged)
                cell?.pickupRequiredSwitch.isUserInteractionEnabled = true
                return cell!
            }
            else if DataCreator.sharedInstance.bookingFormData[row][2] == "3"{
                cell?.buttonImage = nil
                cell?.actionButton.setTitle("\u{20B9} "+DataCreator.sharedInstance.bookingFormData[row][3], for: .normal)
                cell?.actionButton.setTitleColor(UIColor.black, for: .normal)
                cell?.actionButton.titleLabel?.font = style.firstLineRegular
            }
            
            if DataCreator.sharedInstance.bookingFormData[row][4] == "promo"{
                promoCellRow = row
                promo = (cell?.desc)!
                promoCell = cell!
            }
            else if DataCreator.sharedInstance.bookingFormData[row][4] == "rsaCfee"{
                rsaCfeeCell = cell!
            }
            else if DataCreator.sharedInstance.bookingFormData[row][4] == "chauffeurCfee"{
                chauffCfeeCell = cell!
            }
            else if DataCreator.sharedInstance.bookingFormData[row][4] == "slot"{
                slotCell = cell!
            }
            else if DataCreator.sharedInstance.bookingFormData[row][4] == "hours"{
                hoursCell = cell!
            }
            else if DataCreator.sharedInstance.bookingFormData[row][4] == "rsaComplaint"{
                rsaComplaintCell = cell!
            }
            else if DataCreator.sharedInstance.bookingFormData[row][4] == "serviceCentre"{
                if let _ = historyServiceRating{
                    cell?.ratingStars.image = shapes.drawRatingStars(Int(historyServiceRating)!)
                }
                else{
                    cell?.ratingStars.image = nil
                    if !DataCreator.sharedInstance.serviceCentreList.isEmpty{
                        cell?.ratingStars.image = shapes.drawRatingStars(Int(DataCreator.sharedInstance.serviceCentreList[0].rating)!)
                    }
                }
                serviceCentreRow = row
                serviceCentreCell = cell!
            }
            else if DataCreator.sharedInstance.bookingFormData[row][4] == "AddComplaints"{
                complaintsCellRow = row
                serviceComplaintCell = cell!
            }
            if row == 0 || row == 1 || row == 4 || row == 5 || row == 8 || row == 9 || row == 12 || row == 13{
                cell?.backgroundColor = style.background1
            }
            else{
                cell?.backgroundColor = style.background2
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        let row = (indexPath as NSIndexPath).item
        if  (DataCreator.sharedInstance.serviceType == "0" || DataCreator.sharedInstance.serviceType == "1") && triggeredFrom == "History" && row == DataCreator.sharedInstance.bookingFormData.count{}
        else if row == DataCreator.sharedInstance.bookingFormData.count - 1{
            if DataCreator.sharedInstance.networkCheck == "1"{
                var cfee = ""
                if DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0"{
                    if DataCreator.sharedInstance.servicingBookingFormData.id.isEmpty{
                        ToastManager.serviceCentreError()
                    }
                    else{
                        if promo == "21North"{
                            promo = " "
                        }
                        if !DataCreator.sharedInstance.postBookingData.isEmpty{
                            cfee = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].cfee
                            if pickLat.isEmpty{
                                pickLat = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].plat
                                pickLong = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].plong
                            }
                            if dropLat.isEmpty{
                                dropLat = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].dlat
                                dropLong = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].dlong
                            }
                            if serviceCentId.isEmpty{
                                serviceCentId = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].svcId
                                serviceCentName = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].svcname
                            }
                        }
                        else{
                            cfee = DataCreator.sharedInstance.servicingBookingFormData.advFee
                            if pickLat.isEmpty{
                                pickLat = String(DataCreator.sharedInstance.latitude)
                                pickLong = String(DataCreator.sharedInstance.longitude)
                            }
                            if dropLat.isEmpty{
                                dropLat = String(DataCreator.sharedInstance.latitude)
                                dropLong = String(DataCreator.sharedInstance.longitude)
                            }
                            if serviceCentId.isEmpty{
                                serviceCentId = DataCreator.sharedInstance.servicingBookingFormData.id
                                serviceCentName = DataCreator.sharedInstance.servicingBookingFormData.name
                            }
                        }
                        if complaintsIDList == nil{
                            complaintsIDList = "0"
                        }
                        //First time datestring will be empty
                        if dateString.isEmpty && qTime.isEmpty{
                            dateString = [yearArray[slotPicker.selectedRow(inComponent: 0)], monthArray[slotPicker.selectedRow(inComponent: 1)][1], separateDateArray[slotPicker.selectedRow(inComponent: 2)][2]].flatMap({$0}).joined(separator:"-")
                        }
                        //When coming from modify page, and not changing the slot, datestring will be empty
                        if dateString.isEmpty{
                            selectedSlot = qTime
                        }
                        else {
                            selectedSlot = dateString+" "+DataCreator.sharedInstance.slotList[slotPicker.selectedRow(inComponent: 3)].slottime
                        }
                        if DataCreator.sharedInstance.bookingFormData[row][2] == NSLocalizedString("ScheduleServicingText", comment: ""){
                            appdelegate.conn.send("\(Constants.RequestStates.AddBooking)|\(pickupLocCell.desc)|\(pickLat)|\(pickLong)|\(dropoffLocCell.desc)|\(dropLat)|\(dropLong)|\(selectedSlot)|\(complaintsIDList!)|\(serviceCentId)|\(DataCreator.sharedInstance.selectedVehicleID)|\(DataCreator.sharedInstance.serviceType)|\(DataCreator.sharedInstance.city)|\(cfee)|\(DataCreator.sharedInstance.slotList[slotPicker.selectedRow(inComponent: 3)].slottime)|\(promo)|")
                        }
                        else{
                            appdelegate.conn.send("\(Constants.RequestStates.ModifyBooking)|\(DataCreator.sharedInstance.currentBookingId)|\(pickupLocCell.desc)|\(pickLat)|\(pickLong)|\(dropoffLocCell.desc)|\(dropLat)|\(dropLong)|\(selectedSlot)|\(complaintsIDList!)|\(serviceCentId)|\(DataCreator.sharedInstance.slotList[slotPicker.selectedRow(inComponent: 3)].id)|\(cfee)|\(DataCreator.sharedInstance.slotList[slotPicker.selectedRow(inComponent: 3)].slottime)|")
                        }
                    }
                }
                else if DataCreator.sharedInstance.serviceType == "3" {
                    if DataCreator.sharedInstance.rsaBookingFormData.serviceCentreData.isEmpty{
                        ToastManager.serviceCentreError()
                    }
                    else{
                        if promo == "21North"{
                            promo = "0"
                        }
                        if isTowing{
                            cfee = DataCreator.sharedInstance.rsaBookingFormData.rsaCost
                        }
                        else{
                            for i in 0 ..< DataCreator.sharedInstance.rsaBookingFormData.rsaComplaintData.count{
                                if DataCreator.sharedInstance.rsaBookingFormData.rsaComplaintData[i].description == rsaComplaintCell.desc{
                                    cfee = DataCreator.sharedInstance.rsaBookingFormData.rsaComplaintData[i].amount
                                }
                            }
                        }
                        if serviceCentId.isEmpty{
                            serviceCentId = DataCreator.sharedInstance.serviceCentreList[0].id
                        }
                        if serviceCentName.isEmpty{
                            serviceCentName = DataCreator.sharedInstance.serviceCentreList[0].name
                        }
                        if serviceCentPLat.isEmpty{
                            serviceCentPLat = DataCreator.sharedInstance.serviceCentreList[0].svclat
                            serviceCentPLong = DataCreator.sharedInstance.serviceCentreList[0].svclong
                        }
                        if pickLat.isEmpty{
                            pickLat = DataCreator.sharedInstance.rsaBookingFormData.latitude
                            pickLong = DataCreator.sharedInstance.rsaBookingFormData.longitude
                        }
                        var rsaComplaintsIDList = ""
                        for i in 0 ..< DataCreator.sharedInstance.rsaBookingFormData.rsaComplaintData.count{
                            if DataCreator.sharedInstance.rsaBookingFormData.rsaComplaintData[i].description == DataCreator.sharedInstance.bookingFormData[4][1]{
                                rsaComplaintsIDList = DataCreator.sharedInstance.rsaBookingFormData.rsaComplaintData[i].id
                                break
                            }
                        }
                        appdelegate.conn.send("\(Constants.RequestStates.AddBooking)|\(dropoffLocCell.desc)|\(pickLat)|\(pickLong)|\(serviceCentName)|\(serviceCentPLat)|\(serviceCentPLong)|00 00|\(rsaComplaintsIDList)|\(serviceCentId)|\(DataCreator.sharedInstance.selectedVehicleID)|\(DataCreator.sharedInstance.serviceType)|\(DataCreator.sharedInstance.city)|\(cfee)|0$0|\(promo)|")
                        
                        requestingScreen.labelText = NSLocalizedString("RequestingRSAText", comment: "")
                        requestingScreen.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                        requestingScreen.requestingScreenVCDelegate = self
                        Helper.topMostController().present(requestingScreen, animated: true, completion: nil)
                    }
                }
                else if DataCreator.sharedInstance.serviceType == "2"{
                    if promo == "21North"{
                        promo = "0"
                    }
                    if !DataCreator.sharedInstance.postBookingData.isEmpty{
                        if pickLat.isEmpty{
                            pickLat = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].plat
                            pickLong = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].plong
                        }
                        if dropLat.isEmpty{
                            dropLat = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].dlat
                            dropLong = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].dlong
                        }
                    }
                    else{
                        if pickLat.isEmpty{
                            pickLat = DataCreator.sharedInstance.chauffeurBookingFormData.latitude
                            pickLong = DataCreator.sharedInstance.chauffeurBookingFormData.longitude
                        }
                        if dropLat.isEmpty{
                            dropLat = DataCreator.sharedInstance.chauffeurBookingFormData.latitude
                            dropLong = DataCreator.sharedInstance.chauffeurBookingFormData.longitude
                        }
                    }
                    let hours = hoursCell.desc.split(separator: " ").map(String.init)[0]
                    appdelegate.conn.send("\(Constants.RequestStates.AddBooking)|\(pickupLocCell.desc)|\(pickLat)|\(pickLong)|\(dropoffLocCell.desc)|\(dropLat)|\(dropLong)|0|\(hours)|0|\(DataCreator.sharedInstance.selectedVehicleID)|\(DataCreator.sharedInstance.serviceType)|\(DataCreator.sharedInstance.city)|0|0$0|\(promo)|")
                    
                    requestingScreen.labelText = NSLocalizedString("RequestingChauffeurText", comment: "")
                    requestingScreen.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                    requestingScreen.requestingScreenVCDelegate = self
                    Helper.topMostController().present(requestingScreen, animated: true, completion: nil)
                }
            }
            else{
                ToastManager.internetError()
            }
        }
        else if DataCreator.sharedInstance.bookingFormData[row][3] == "locationIcon"{
            if DataCreator.sharedInstance.bookingFormData[row][4] == "1"{
                changeLocation(pickupLocCell.actionButton)
            }
            else {
                changeLocation(dropoffLocCell.actionButton)
            }
        }
        else if DataCreator.sharedInstance.bookingFormData[row][4] == "promo"{
            let promoVC = EnterPromoCodeViewController()
            promoVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            promoVC.verifyPromoDelegate = self
            Helper.topMostController().present(promoVC, animated: true, completion: nil)
        }
        else if DataCreator.sharedInstance.bookingFormData[row][4] == "serviceCentre"{
            if !DataCreator.sharedInstance.serviceCentreList.isEmpty{
                let serviceCentreListVC = ServiceCentreListViewController()
                serviceCentreListVC.updateFormWithServiceCentreDelegate = self
                Helper.topMostController().present(serviceCentreListVC, animated: true, completion: nil)
            }
        }
        else if DataCreator.sharedInstance.bookingFormData[row][4] == "ViewComplaint"{
            if let _ = complaintsList{
                let viewComplaintsListVC = ViewComplaintsListViewController()
                viewComplaintsListVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                viewComplaintsListVC.complaintList = complaintsList
                Helper.topMostController().present(viewComplaintsListVC, animated: true, completion: nil)
            }
        }
        else if DataCreator.sharedInstance.bookingFormData[row][4] == "AddComplaints"{
            if !DataCreator.sharedInstance.serviceCentreList.isEmpty{
                costEstimatorVC.updateFormWithComplaintsDelegate = self
                costEstimatorVC.triggeredFrom = "BookingForm"
                Helper.topMostController().present(costEstimatorVC, animated: true, completion: nil)
            }
        }
        else if (DataCreator.sharedInstance.bookingFormData[row][4] == "slot"  && !DataCreator.sharedInstance.serviceCentreList.isEmpty) || DataCreator.sharedInstance.bookingFormData[row][4] == "rsaComplaint" || DataCreator.sharedInstance.bookingFormData[row][4] == "hours"{
            openSlotPicker()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !showAllFields && (DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0") && (indexPath.row == 2 || indexPath.row == 3){
            pickupLocCell.buttonImage = nil
            dropoffLocCell.buttonImage = nil
            return 0
        }
        else if (indexPath.row == DataCreator.sharedInstance.bookingFormData.count - 1 && triggeredFrom != "History") || (indexPath.row == DataCreator.sharedInstance.bookingFormData.count && triggeredFrom == "History"){
            return 130
        }
        return UITableViewAutomaticDimension
    }
    
    //MARK: Map related
    func changeLocation(_ sender: UIButton) {
        let newVC = MapView()
        newVC.from = sender.tag
        newVC.delegate = self
        newVC.latitude = DataCreator.sharedInstance.latitude
        newVC.longitude = DataCreator.sharedInstance.longitude
        Helper.topMostController().present(newVC, animated: true, completion: nil)
    }
    
    //MARK: PickerView delegate
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == slotPicker{
            switch component{
            case 0:
                return yearArray.count
            case 1:
                return monthArray.count
            case 2:
                datesArray.removeAll()
                let selectedMonthString = monthArray[slotPicker.selectedRow(inComponent: 1)][1]
                for i in 0..<separateDateArray.count{
                    if separateDateArray[i][1] == selectedMonthString{
                        datesArray.append(separateDateArray[i][2])
                    }
                }
                return datesArray.count
            case 3:
                return DataCreator.sharedInstance.slotList.count
            default:
                return 0
            }
        }
        else if pickerView == rsaComplaintPicker{
            return DataCreator.sharedInstance.rsaComplaintList.count - 1
        }
        return chaufHoursArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        if DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0"{
            return 4
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == slotPicker){
            if(component==1){
                slotPicker.reloadComponent(2)
            }
            dateString = [yearArray[slotPicker.selectedRow(inComponent: 0)], monthArray[slotPicker.selectedRow(inComponent: 1)][1], datesArray[slotPicker.selectedRow(inComponent: 2)]].flatMap({$0}).joined(separator:"-")
            appdelegate.conn.send("\(Constants.RequestStates.SlotList)|\(dateString)|\(DataCreator.sharedInstance.latitude)|\(DataCreator.sharedInstance.longitude)|19|")
        }
        else if pickerView == rsaComplaintPicker{
            rsaComplaintPickedIndex = row+1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        let pickerLabel = UILabel()
        pickerLabel.adjustsFontSizeToFitWidth = true
        pickerLabel.textAlignment = .center
        
        if pickerView == rsaComplaintPicker{
            pickerLabel.text = DataCreator.sharedInstance.rsaComplaintList[row+1].description
        }
        if pickerView == chaufHoursPicker{
            pickerLabel.text = chaufHoursArray[row]
        }
        else if pickerView == slotPicker{
            switch component{
            case 0:
                pickerLabel.text = yearArray[row]
            case 1:
                pickerLabel.text = String(Helper.getMonthNameFromNumber(monthNumber: Int(monthArray[row][1])!).prefix(3))
            case 2:
                pickerLabel.text = datesArray[row]
            case 3:
                pickerLabel.text = DataCreator.sharedInstance.slotList[row].slottime.convert24To12HoursFormat()
            default:
                pickerLabel.text = ""
            }
        }
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if(component == 1){
            return 40
        }
        else if(component == 2){
            return 28
        }
        return 100
    }
    
    //MARK: MapView delegate
    func mapLocationSet(location: String, check: String, latitude: String, longitude: String){
        if(check == "1"){
            DataCreator.sharedInstance.latitude = CLLocationDegrees(latitude)!
            DataCreator.sharedInstance.longitude = CLLocationDegrees(longitude)!
            pickLat = latitude
            pickLong = longitude
            pickupLocCell.desc = location
            dropoffLocCell.desc = location
            if DataCreator.sharedInstance.serviceType == "2"{
                DataCreator.sharedInstance.bookingFormData[0][1] = location
                DataCreator.sharedInstance.bookingFormData[1][1] = location
            }
            else if DataCreator.sharedInstance.serviceType == "1"{
                DataCreator.sharedInstance.bookingFormData[2][1] = location
                DataCreator.sharedInstance.bookingFormData[1][1] = location
            }
            else {
                DataCreator.sharedInstance.bookingFormData[1][1] = location
            }
            pickupLocLabel.reloadInputViews()
            dropoffLabel.reloadInputViews()
            DataCreator.sharedInstance.currentLocation = location
            //            appdelegate.conn.send("\(Constants.RequestStates.BookingData)|\(DataCreator.sharedInstance.serviceType)|\(pickLat)|\(pickLong)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemake_id)|")
        }
        else{
            dropoffLocCell.desc = location
            if DataCreator.sharedInstance.serviceType == "2" || DataCreator.sharedInstance.serviceType == "3"{
                DataCreator.sharedInstance.bookingFormData[1][1] = location
            }
            else{
                DataCreator.sharedInstance.bookingFormData[2][1] = location
            }
            dropoffLabel.reloadInputViews()
        }
        dropLat = latitude
        dropLong = longitude
    }
    
    //MARK: EnterPromoCodeVC delegate
    func updatePromoField(promoCode: String, promoAmount: String) {
        DataCreator.sharedInstance.bookingFormData[promoCellRow][1] = promoCode + " " + promoAmount + " " + NSLocalizedString("DiscountAppliedText", comment: "")
        promoCell.desc = promoCode + " " + "\u{20B9} " + promoAmount + " " + NSLocalizedString("DiscountAppliedText", comment: "")
        
        //        DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].promocode = promoCode
        //        DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].promoamount = promoAmount
        promo = promoCode
    }
    
    //MARK: CostEstimator delegate
    func updateComplaintsCount(complaintsList: [SubComplaintData]){
        DataCreator.sharedInstance.bookingFormData[complaintsCellRow][1] = String(complaintsList.count) + " " + NSLocalizedString("ComplaintsAddedText", comment: "")
        var idsList = [String]()
        for i in 0 ..< complaintsList.count{
            idsList.append(complaintsList[i].headId)
        }
        complaintsIDList = idsList.flatMap({$0}).joined(separator: ",")
        costEstimatorVC.previousList = complaintsList
        serviceComplaintCell.desc = String(complaintsList.count) + " " + NSLocalizedString("ComplaintsAddedText", comment: "")
    }
    
    //MARK: ServiceCentreListVC delegate
    func updateServiceCentre(serviceCentreName: String, serviceCentreId: String){
        DataCreator.sharedInstance.bookingFormData[serviceCentreRow][1] = serviceCentreName
        serviceCentreCell.desc = serviceCentreName
        serviceCentName = serviceCentreName
        serviceCentId = serviceCentreId
        for i in 0 ..< DataCreator.sharedInstance.serviceCentreList.count{
            if DataCreator.sharedInstance.serviceCentreList[i].name == serviceCentreName{
                serviceCentPLat = DataCreator.sharedInstance.serviceCentreList[i].svclat
                serviceCentPLong = DataCreator.sharedInstance.serviceCentreList[i].svclong
            }
        }
        if DataCreator.sharedInstance.serviceType == "3"{
            DataCreator.sharedInstance.bookingFormData[2][1] = serviceCentreName
        }
        else{
            DataCreator.sharedInstance.bookingFormData[3][1] = serviceCentreName
        }
        isServiceCentreUpdated = true
    }
    
    //MARK: ModifyCancelBookingVC delegate
    func dismissBookingScreen(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func dismissBookingForm(){
        //        dataForModifyScreen()
        //        bookingFormVCDelegate1?.reloadModifyScreen()
        //        self.dismiss(animated: true, completion: nil)
    }
    
    func changeButtonText(){
        buttonCell.buttonTitle = NSLocalizedString("ModifyBookingText", comment: "")
        DataCreator.sharedInstance.bookingFormData[DataCreator.sharedInstance.bookingFormData.count - 1][2] = NSLocalizedString("ModifyBookingText", comment: "")
    }
    
    //MARK: SocketManager delegate
    func reloadSlot(){
        slotPicker.reloadComponent(3)
    }
    
    func presentModifyScreen(){
        presentBookingConfirmedVC()
    }
    
    func presentBookingConfirmedVC(){
        let bookingConfirmedVC = BookingConfirmedViewController()
        bookingConfirmedVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(bookingConfirmedVC, animated: true, completion: nil)
    }
    
    //    func presentModifyScreen(){
    //        if DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0"{
    //            //Populate data for modify page
    //            dataForModifyScreen()
    //            let modifyBookingVC = ModifyCancelBookingViewcontroller()
    //            modifyBookingVC.modifyBookingVCDelegate = self
    //            Helper.topMostController().present(modifyBookingVC, animated: true, completion: nil)
    //        }
    //    }
    //
    //    func dataForModifyScreen(){
    //        DataCreator.sharedInstance.postBookingFormData.removeAll()
    //        let postBooking = BookingData(stage1: NSLocalizedString("BookingCreatedSuccessText", comment: " "), screenid1: "1", svcrating1: DataCreator.sharedInstance.servicingBookingFormData.rating)
    //        DataCreator.sharedInstance.postBookingData.append(postBooking)
    //        DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("ServiceCentreText", comment: ""),serviceCentreCell.desc,"","","ServiceCentre"])
    //        DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("TimeSlotText", comment: ""),slotCell.desc,"","",""])//datepicker for slot
    //        if showAllFields && DataCreator.sharedInstance.serviceType == "1"{
    //        DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("PickupLocationText", comment: ""),pickupLocCell.desc,"","",""])//1 = switch req, 2 = button image, 3 = button text
    //        DataCreator.sharedInstance.postBookingFormData.append([NSLocalizedString("DropoffLocationText", comment: ""),dropoffLocCell.desc,"2","locationIcon","2"])
    //            let bookingIndex = Helper.getBookingIndex()
    //            DataCreator.sharedInstance.postBookingData[bookingIndex].qtime = selectedSlot
    //            DataCreator.sharedInstance.postBookingData[bookingIndex].paddy = pickupLocCell.desc
    //            DataCreator.sharedInstance.postBookingData[bookingIndex].daddy = dropoffLocCell.desc
    //            DataCreator.sharedInstance.postBookingData[bookingIndex].svcname = serviceCentreCell.desc
    //        }
    //    }
    
    //MARK: RequestingScreen delegate
    func dismissBookingFormVC(){
        presentBookingConfirmedVC()
        //        bookingFormVCDelegate?.reloadHomeForRSAChauffeur()
        //        self.dismiss(animated: true, completion: nil)
    }
    
    func reloadBookingForm(){
        bookingTable.reloadData()
    }
}

