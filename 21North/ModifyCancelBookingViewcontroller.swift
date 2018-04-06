//
//  ModifyCancelBookingViewcontroller.swift
//  21North
//
//  Created by Aruna Elangovan on 23/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit
import Foundation

@objc protocol ModifyBookingVCDelegate{
    func dismissBookingScreen()
    func changeButtonText()
}

@objc protocol RefreshHomeFromModifyDelegate {
    func reloadHome()
}

class ModifyCancelBookingViewcontroller: BaseViewController, UITableViewDataSource, UITableViewDelegate, MapViewDelegate, SocketManagerDelegate9, RateServicingDelegate, BookingFormVCDelegate1, WebVCDelegate{
    let bookingTable = UITableView()
    var triggeredFrom: String!
    var style = Style()
    var shapes = Shapes()
    var screenId: Int = 0
    var cancelReasonId = ""
    var refreshDelegate: RefreshHomeFromModifyDelegate?
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    var dropoffLocCell = BookingFormCell()
    var buttonCell = ModifyBookingButtonCell()
    var modifyBookingVCDelegate: ModifyBookingVCDelegate?
    var isCancelClicked = false
    var pickupLocation: String!
    var dropoffLocation: String!
    var selectedSlot: String!
    var selectedServiceCentre: String!
    var bookingIndex = 0
    var numberOfRows = 0
    var superViewWidth: CGFloat!
    var pickupRequiredText = ""
    var dropLocation = ""
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool){
        bookingTable.setContentOffset(CGPoint.zero, animated: true)
        bookingIndex = Helper.getBookingIndex()
        screenId = Int(DataCreator.sharedInstance.postBookingData[bookingIndex].screenid)!
        DataCreator.sharedInstance.currentScreen = "ModifyScreen"
        if DataCreator.sharedInstance.postBookingFormData.count > 0{
            numberOfRows = DataCreator.sharedInstance.postBookingFormData.count
            bookingTable.reloadData()
            //            moveTableToTop()
            bookingTable.scrollToTop()
        }
    }
    
    //MARK: UI setup
    func setupUI(){
        bookingTable.register(ModifyBookingButtonCell.self, forCellReuseIdentifier: "ModifyBookingButtonCell")
        bookingTable.register(BookingFormCell.self, forCellReuseIdentifier: "BookingFormCell")
        bookingTable.register(AmbassadorCell.self, forCellReuseIdentifier: "AmbassadorCell")
        bookingTable.register(BookingStatusCell.self, forCellReuseIdentifier: "BookingStatusCell")
        self.automaticallyAdjustsScrollViewInsets = false
        if DataCreator.sharedInstance.serviceType == "3"{
            DataCreator.sharedInstance.bookingFormTitle = NSLocalizedString("RSAHeader", comment: "")
        }
        else if DataCreator.sharedInstance.serviceType == "2"{
            DataCreator.sharedInstance.bookingFormTitle = NSLocalizedString("ChauffeurServiceText", comment: "")
        }
        else if DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0"{
            DataCreator.sharedInstance.bookingFormTitle = NSLocalizedString("ServicingHeader", comment: "")
        }
        appdelegate.conn.delegate9 = self
        numberOfRows = DataCreator.sharedInstance.postBookingFormData.count
        superViewWidth = UIScreen.main.bounds.width
        view.backgroundColor = style.background2
        
        let backButton = shapes.drawShapes(type: "backButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        headerImage = UIImage(named: "servicing")
        pageTitle = DataCreator.sharedInstance.selectedVehicleNumber
        titleFont = style.titleFont!
        titleColor = UIColor.white
        subTitle = DataCreator.sharedInstance.bookingFormTitle
        subTitleFont = style.firstLineFont!
        subTitleColor = UIColor.white
        
        view.addSubview(bookingTable)
        bookingTable.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake((headerImage?.size.height)!, 0, 0, 0))
        bookingTable.translatesAutoresizingMaskIntoConstraints = false
        bookingTable.delegate = self
        bookingTable.dataSource = self
        bookingTable.separatorStyle = .none
        bookingTable.showsVerticalScrollIndicator = false
        bookingTable.rowHeight = UITableViewAutomaticDimension
        bookingTable.estimatedRowHeight = 130.0
    }
    
    //MARK: Data handling
    
    //MARK: Action handling
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        DataCreator.sharedInstance.currentScreen = "HomeScreen"
        self.refreshDelegate?.reloadHome()
        if triggeredFrom == "Home"{
            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func modifyButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        DataCreator.sharedInstance.currentScreen = "BookingScreen"
        if triggeredFrom == "Home"{
            populateDataForBookingForm()
        }
        else{
            modifyBookingVCDelegate?.changeButtonText()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func cancelBooking(){
        appdelegate.conn.send("\(Constants.RequestStates.CancelBooking)|\(DataCreator.sharedInstance.currentBookingId)|\(cancelReasonId)|")
    }
    
    @objc func confirmCancelClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        let alertController = UIAlertController(title: "21North", message: NSLocalizedString("Are you sure you want to cancel?", comment: ""), preferredStyle: .actionSheet)
        for i in 0 ..< DataCreator.sharedInstance.cancelReasons.count {
            let reasonDesc = UIAlertAction(title: DataCreator.sharedInstance.cancelReasons[i].cancelreason, style: .default, handler: {
                action in
                self.cancelReasonId = DataCreator.sharedInstance.cancelReasons[i].id
                self.cancelBooking()
            })
            alertController.addAction(reasonDesc)
        }
        let defaultAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func viewEstimate(){
        let webVC = WebViewController()
        webVC.webVCDelegate = self
        webVC.hidesBottomBarWhenPushed = true
        webVC.urlString = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].estimateUrl
        webVC.pagetitle = NSLocalizedString("EstimateText", comment: "")
        webVC.shouldShowHeaderImage = true
        Helper.topMostController().present(webVC, animated: true, completion: nil)
    }
    
    @objc func callAmbassador(){
        Helper.callNumber(DataCreator.sharedInstance.postBookingData[bookingIndex].ambmob)
    }
    
    @objc func locateAmbassador(){
        Helper.topMostController().present(LocateAmbassador(), animated: true, completion: nil)
    }
    
    func openChatScreen(){
        let chatVC = ChatScreen()
        Helper.topMostController().present(chatVC, animated: true, completion: nil)
    }
    
    @objc func viewInvoice(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        let webVC = WebViewController()
        webVC.webVCDelegate = self
        webVC.hidesBottomBarWhenPushed = true
        webVC.urlString = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].invoiceUrl
        webVC.pagetitle = NSLocalizedString("InvoiceText", comment: "")
        webVC.shouldShowHeaderImage = true
        Helper.topMostController().present(webVC, animated: true, completion: nil)
    }
    
    @objc func payInvoice(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        let webVC = WebViewController()
        webVC.webVCDelegate = self
        webVC.hidesBottomBarWhenPushed = true
        webVC.urlString = "http://m.21north.in/PaytmKit/pgRedirect.php?id=" + DataCreator.sharedInstance.currentBookingId
        webVC.pagetitle = NSLocalizedString("PayBillText", comment: "")
        Helper.topMostController().present(webVC, animated: true, completion: nil)
    }
    
    //MARK: TableView delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if screenId == 0 || screenId == 1 || screenId == 6 || screenId == 7 || screenId == 20 || screenId == 21 || screenId == 24 || screenId == 30 || screenId == 31  || screenId == 32{
            return numberOfRows+2//top view and button
        }
        else if screenId == 8 || screenId == 25 || screenId == 34 {
            return 0
        }
        return numberOfRows+1
    }
    
    let textColor = UIColor.darkGray
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingFormCell") as? BookingFormCell
        
        //button cell
        if (screenId == 0 || screenId == 1 || screenId == 6 || screenId == 7 || screenId == 20 || screenId == 21 || screenId == 24 || screenId == 30 || screenId == 31  || screenId == 32) && row == numberOfRows+1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ModifyBookingButtonCell") as? ModifyBookingButtonCell
            cell?.promptText = ""
            cell?.promptText1 = ""
            
            if screenId == 1 || screenId == 0{
                cell?.firstButtonText = NSLocalizedString("ModifyText", comment: "")
                cell?.secondButtonText = NSLocalizedString("CancelText", comment: "")
                cell?.thirdButtonText = NSLocalizedString("DoneText", comment: "")
                cell?.firstButtonTextFont = style.firstLineMedium
                cell?.firstButtonTextColor = UIColor.white
                cell?.numberOfButtons = 3
                
                cell?.firstButton.removeTarget(self, action: #selector(viewInvoice), for: .touchUpInside)
                cell?.thirdButton.removeTarget(self, action: #selector(payInvoice), for: .touchUpInside)
                cell?.firstButton.addTarget(self, action: #selector(modifyButtonClicked), for: .touchUpInside)
                cell?.secondButton.addTarget(self, action: #selector(confirmCancelClicked), for: .touchUpInside)
                cell?.thirdButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
            }
            else if screenId == 6 || screenId == 7{
                
                cell?.buttonBackgroundColor = UIColor.orange
                if DataCreator.sharedInstance.postBookingData[bookingIndex].typesvc == "3" || DataCreator.sharedInstance.postBookingData[bookingIndex].paymentType == "3"{
                    cell?.numberOfButtons = 4
                    cell?.secondButtonText = NSLocalizedString("ViewInvoiceText", comment: "")
                    cell?.firstButtonTextFont = style.firstLineMedium
                    cell?.firstButtonTextColor = UIColor.white
                    cell?.secondButton.addTarget(self, action: #selector(viewInvoice), for: .touchUpInside)
                }
                else{
                    cell?.numberOfButtons = 2
                    cell?.firstButtonText = NSLocalizedString("ViewInvoiceText", comment: "")
                    cell?.firstButtonTextFont = style.firstLineMedium
                    cell?.firstButtonTextColor = UIColor.white
                    cell?.firstButton.removeTarget(self, action: #selector(modifyButtonClicked), for: .touchUpInside)
                    cell?.firstButton.addTarget(self, action: #selector(viewInvoice), for: .touchUpInside)
                    cell?.thirdButtonText = NSLocalizedString("PayInvoiceText", comment: "")
                    cell?.thirdButton.removeTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
                    cell?.thirdButton.addTarget(self, action: #selector(payInvoice), for: .touchUpInside)
                }
            }
            else if screenId == 20 || screenId == 21 || screenId == 30 || screenId == 31{
                
                cell?.numberOfButtons = 4
                cell?.secondButtonText = NSLocalizedString("CancelText", comment: "")
                cell?.firstButtonTextFont = style.firstLineMedium
                cell?.firstButtonTextColor = UIColor.white
                cell?.secondButton.removeTarget(self, action: #selector(payInvoice), for: .touchUpInside)
                cell?.secondButton.addTarget(self, action: #selector(confirmCancelClicked), for: .touchUpInside)
                cell?.promptText = NSLocalizedString("EtaText", comment: "")
                cell?.promptLabelFont = style.firstLineRegular
                cell?.promptLabelColor = UIColor.black
                cell?.promptText1 = DataCreator.sharedInstance.postBookingData[bookingIndex].etavar+" "+NSLocalizedString("MinutesText", comment: "")
                cell?.promptLabelFont1 = style.secondLineRegular
                cell?.promptLabelColor1 = UIColor.darkGray
                buttonCell = cell!
            }
            else if screenId == 24{
                
                cell?.numberOfButtons = 4
                cell?.secondButtonText = NSLocalizedString("PayInvoiceText", comment: "")
                cell?.firstButtonTextFont = style.firstLineMedium
                cell?.firstButtonTextColor = UIColor.white
                cell?.secondButton.removeTarget(self, action: #selector(confirmCancelClicked), for: .touchUpInside)
                cell?.secondButton.addTarget(self, action: #selector(payInvoice), for: .touchUpInside)
                cell?.promptText = ""
                cell?.promptText1 = ""
            }
            else if screenId == 32{
                
                cell?.numberOfButtons = 4
                cell?.secondButtonText = NSLocalizedString("PayInvoiceText", comment: "")
                cell?.firstButtonTextFont = style.firstLineMedium
                cell?.firstButtonTextColor = UIColor.white
                cell?.secondButton.removeTarget(self, action: #selector(confirmCancelClicked), for: .touchUpInside)
                cell?.secondButton.addTarget(self, action: #selector(payInvoice), for: .touchUpInside)
                cell?.promptText = ""
                cell?.promptText1 = ""
            }
            cell?.backgroundColor = style.background2
            return cell!
        }
        else if row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookingStatusCell") as? BookingStatusCell
            cell?.statusLabel.text = DataCreator.sharedInstance.postBookingData[bookingIndex].stage
            let topViewShape = topViewShapes()
            switch screenId{
            case 0,1:
                cell?.iconView = topViewShape.viewForTop(0)
            case 2:
                cell?.iconView = topViewShape.viewForTop(1)
            case 3:
                cell?.iconView = topViewShape.viewForTop(2)
            case 4:
                cell?.iconView = topViewShape.viewForTop(3)
            case 5:
                cell?.iconView = topViewShape.viewForTop(3)
            case 6:
                cell?.iconView = topViewShape.viewForTop(3)
            case 7:
                cell?.iconView = topViewShape.viewForTop(4)
            case 20,21,30,31:
                cell?.iconView = topViewShape.chauffeurTopView(0)
            case 22,32:
                cell?.iconView = topViewShape.chauffeurTopView(1)
            case 23,24,33:
                cell?.iconView = topViewShape.chauffeurTopView(2)
            default:
                print("error")
            }
            return cell!
        }
        else{
            cell?.ratingStars.isHidden = true
            if DataCreator.sharedInstance.postBookingFormData[row-1][4] == "ambassador"{
                let cell = tableView.dequeueReusableCell(withIdentifier: "AmbassadorCell") as? AmbassadorCell
                cell?.callImage = shapes.drawShapes(type: DataCreator.sharedInstance.postBookingFormData[row-1][0])
                cell?.locationImage = shapes.drawShapes(type: DataCreator.sharedInstance.postBookingFormData[row-1][2])
                cell?.name = DataCreator.sharedInstance.postBookingFormData[row-1][3]
                cell?.nameColor = textColor
                cell?.nameFont = style.firstLineRegular!
                cell?.callImageView.isUserInteractionEnabled = true
                let tapOnCall = UITapGestureRecognizer(target: self, action: #selector(callAmbassador))
                cell?.callImageView.addGestureRecognizer(tapOnCall)
                cell?.locationImageView.isUserInteractionEnabled = true
                let tapOnLocation = UITapGestureRecognizer(target: self, action: #selector(locateAmbassador))
                cell?.locationImageView.addGestureRecognizer(tapOnLocation)
                let str = "http://m.21north.in/ambassadors/ambassadors-" + DataCreator.sharedInstance.postBookingData[bookingIndex].ambid + ".png"
                let url = URL(string: str)
                let data = try? Data(contentsOf: url!)
                if(data != nil){
                    cell!.ambassadorImage = UIImage(data: data!)
                }
                else{
                    cell!.ambassadorImage = UIImage(named: "Home-Insurance")
                }
                return cell!
            }
            if DataCreator.sharedInstance.postBookingFormData[row-1][2] == "2"{
                cell?.actionButton.setTitle("", for: .normal)
                cell?.buttonImage = shapes.drawShapes(type: DataCreator.sharedInstance.postBookingFormData[row-1][3])
                if DataCreator.sharedInstance.postBookingFormData[row-1][3] == "locationIcon"{
                    cell?.actionButton.tag = Int(DataCreator.sharedInstance.postBookingFormData[row-1][4])!
                    dropoffLocCell = cell!
                }
            }
            if DataCreator.sharedInstance.postBookingFormData[row-1][2] == "3"{
                cell?.buttonImage = nil
                cell?.actionButton.setTitle(DataCreator.sharedInstance.postBookingFormData[row-1][3], for: .normal)
                cell?.actionButton.setTitleColor(UIColor.black, for: .normal)
                cell?.actionButton.titleLabel?.font = style.firstLineRegular
            }
            if DataCreator.sharedInstance.postBookingFormData[row-1][2] == ""{
                cell?.actionButton.setTitle("", for: .normal)
                cell?.buttonImage = nil
            }
            cell?.header = DataCreator.sharedInstance.postBookingFormData[row-1][0]
            cell?.desc = DataCreator.sharedInstance.postBookingFormData[row-1][1]
            cell?.headerColor = UIColor.black
            cell?.descColor = textColor
            cell?.descFont = style.secondLineFont!
            cell?.headerFont = style.firstLineRegular!
            cell?.backgroundColor = style.background2
            if DataCreator.sharedInstance.postBookingFormData[row-1][4] == "ServiceCentre"{
                //                cell?.ratingStars.image = shapes.drawRatingStars(Int(DataCreator.sharedInstance.postBookingData[bookingIndex].svcrating)!)
                //                cell?.ratingStars.isHidden = false
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        let row = indexPath.row
        if row != 0 && row != numberOfRows+1{
            if DataCreator.sharedInstance.postBookingFormData[row-1][4] == "ViewComplaints" && DataCreator.sharedInstance.postBookingData[bookingIndex].idcomplaint != "0"{
                let viewComplaintsListVC = ViewComplaintsListViewController()
                viewComplaintsListVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                viewComplaintsListVC.complaintList = DataCreator.sharedInstance.postBookingData[bookingIndex].complaintText.split(separator: ",").map(String.init)
                self.present(viewComplaintsListVC, animated: true, completion: nil)
            }
            else if row == 4{
                changeLocation(dropoffLocCell.actionButton)
            }
            else if DataCreator.sharedInstance.postBookingFormData[row-1][4] == "ViewEstimate"{
                viewEstimate()
            }
            else if DataCreator.sharedInstance.postBookingFormData[row-1][4] == "call"{
                Helper.callNumber(DataCreator.sharedInstance.postBookingData[bookingIndex].advnumber)
            }
            else if DataCreator.sharedInstance.postBookingFormData[row-1][4] == "chat"{
                appdelegate.conn.send("\(Constants.RequestStates.GetChat)|\(DataCreator.sharedInstance.currentBookingId)|")
            }
            else if DataCreator.sharedInstance.postBookingFormData[row-1][3] == "locationIcon"{
                changeLocation(dropoffLocCell.actionButton)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return 100
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if (screenId == 0 || screenId == 1 || screenId == 6 || screenId == 7 || screenId == 20 || screenId == 21 || screenId == 24 || screenId == 30 || screenId == 31  || screenId == 32) && indexPath.row == numberOfRows+1{
            return 110
        }
        return UITableViewAutomaticDimension
    }
    
    //MARK: Map related
    func changeLocation(_ sender: UIButton){
        let newVC = MapView()
        newVC.from = sender.tag
        newVC.delegate = self
        newVC.latitude = DataCreator.sharedInstance.latitude
        newVC.longitude = DataCreator.sharedInstance.longitude
        Helper.topMostController().present(newVC, animated: true, completion: nil)
    }
    
    //MARK: MapView delegate
    func mapLocationSet(location: String, check: String, latitude: String, longitude: String){
        dropLocation = location
        appdelegate.conn.send("\(Constants.RequestStates.UpdateDropLocation)|\(DataCreator.sharedInstance.currentBookingId)|\(location)|\(latitude)|\(longitude)|")
    }
    
    //MARK: SocketManager delegate
    func reloadModifyPage(){
        screenId = Int(DataCreator.sharedInstance.postBookingData[bookingIndex].screenid)!
        DataCreator.sharedInstance.currentScreenId = screenId
        numberOfRows = DataCreator.sharedInstance.postBookingFormData.count
        bookingTable.reloadData()
    }
    
    func refreshEta(eta: String){
        buttonCell.promptText1 = eta+" "+NSLocalizedString("MinutesText", comment: "")
        DataCreator.sharedInstance.postBookingData[bookingIndex].etavar = eta
    }
    
    func presentRatingScreen(){
        let rateServicing = RateServicing()
        rateServicing.rateServicingDelegate = self
        Helper.topMostController().present(rateServicing, animated: true, completion: nil)
    }
    
    func populateDataForBookingForm(){
        DataCreator.sharedInstance.bookingFormData.removeAll()
        DataCreator.sharedInstance.bookingFormTitle = NSLocalizedString("ServicingHeader", comment: "")
        //        DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PickupDropText", comment: ""),NSLocalizedString("PickupDropRequiredText", comment: ""),DataCreator.sharedInstance.serviceType,"",""])
        DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("EarliestSlotText", comment: ""),Helper.convertSlotToDisplayFormat(slot: DataCreator.sharedInstance.postBookingData[bookingIndex].qtime),"2","calendar","slot"])//datepicker for slot
        if DataCreator.sharedInstance.serviceType != "0"{
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PickupLocationText", comment: ""),DataCreator.sharedInstance.postBookingData[bookingIndex].paddy,"2","locationIcon","1"])//1 = switch req, 2 = button image, 3 = button text
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("DropoffLocationText", comment: ""),DataCreator.sharedInstance.postBookingData[bookingIndex].daddy,"2","locationIcon","2"])
        }
        DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ClosestCentreText", comment: ""),DataCreator.sharedInstance.postBookingData[bookingIndex].svcname,"2","edit","serviceCentre"])
        var complaintText = ""
        if DataCreator.sharedInstance.postBookingData[bookingIndex].idcomplaint != "0"{
            complaintText  = String(DataCreator.sharedInstance.postBookingData[bookingIndex].idcomplaint.split(separator: ",").map(String.init).count)+NSLocalizedString("ComplaintsAddedText", comment: "")
        }
        else{
            complaintText = NSLocalizedString("0ComplaintsText", comment: "")
        }
        DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ViewComplaintsText", comment: ""),complaintText,"2","addComp","AddComplaints"])
        if DataCreator.sharedInstance.postBookingData[bookingIndex].promocode.isEmpty{
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PromoCodeText", comment: ""),NSLocalizedString("21North", comment: ""),"2","edit","promo"])
        }
        else{
            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PromoCodeText", comment: ""),DataCreator.sharedInstance.postBookingData[bookingIndex].promocode + " " + DataCreator.sharedInstance.postBookingData[bookingIndex].promoamount + " " + NSLocalizedString("DiscountAppliedText", comment: ""),"2","edit","promo"])
        }
        DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ConvenienceFeeText", comment: ""),NSLocalizedString("ExpertHelpText", comment: ""),"3",DataCreator.sharedInstance.postBookingData[bookingIndex].cfee,""])
        DataCreator.sharedInstance.bookingFormData.append(["","",NSLocalizedString("ModifyBookingText", comment: "")])
        presentBookingForm()
    }
    func presentBookingForm(){
        let bookingFormVC = BookingFormViewController()
        bookingFormVC.qTime = DataCreator.sharedInstance.postBookingData[bookingIndex].qtime
        bookingFormVC.bookingFormVCDelegate1 = self
        if DataCreator.sharedInstance.postBookingData[bookingIndex].idcomplaint != "0"{
            bookingFormVC.complaintsIDList = DataCreator.sharedInstance.postBookingData[bookingIndex].idcomplaint
            bookingFormVC.complaintsList = DataCreator.sharedInstance.postBookingData[bookingIndex].complaintText.split(separator: ",").map(String.init)
        }
        Helper.topMostController().present(bookingFormVC, animated: true, completion: nil)
    }
    
    func dismissModifyScreen(){
        if triggeredFrom == "Home"{
            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
            //            self.dismiss(animated: true, completion: nil)
            //            self.modifyBookingVCDelegate?.dismissBookingScreen()
        }
    }
    func updateDrop() {
        //        DataCreator.sharedInstance.postBookingFormData[3][1] = dropLocation
        dropoffLocCell.desc = dropLocation
    }
    
    func dismissModifyPageFromRating(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func reloadModifyScreen(){
        bookingTable.reloadData()
    }
    func moveTableToTop(){
        let indexPath = IndexPath(row: 0, section: 0)
        self.bookingTable.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}

class BookingStatusCell: UITableViewCell{
    var statusLabel = UILabel()
    
    let style1 = Style()
    
    var iconView: UIView?{
        didSet{
            let statusImageContainerView = UIView()
            contentView.addSubview(statusImageContainerView)
            statusImageContainerView.translatesAutoresizingMaskIntoConstraints = false
            statusImageContainerView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero, excludingEdge: .top)
            statusImageContainerView.autoSetDimension(.height, toSize: 50, relation: .greaterThanOrEqual)
            statusImageContainerView.autoPinEdge(.top, to: .bottom, of: statusLabel, withOffset: 10)
            statusImageContainerView.backgroundColor = style1.background1
            
            statusImageContainerView.addSubview(iconView!)
            iconView?.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            iconView?.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
            //            iconView?.autoAlignAxis(toSuperviewAxis: .vertical)
            iconView?.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10, 20, 0, 0), excludingEdge: .right)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = style1.background2
        let drawservicing = DrawServicing()
        
        contentView.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.numberOfLines = 0
        statusLabel.lineBreakMode = .byWordWrapping
        statusLabel.textColor = UIColor.orange
        statusLabel.font = style1.firstLineRegular
        statusLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(20, 20, 0, 20), excludingEdge: .bottom)
        statusLabel.autoSetDimension(.height, toSize: 15, relation: .greaterThanOrEqual)
        let underLine = drawservicing.drawLine(0, y: 25, width: self.bounds.width, color: "service")
        statusLabel.layer.addSublayer(underLine)
    }
}
