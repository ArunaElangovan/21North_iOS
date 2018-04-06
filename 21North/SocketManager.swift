//
//  SocketManager.swift
//
//
//  Created by Grimi on 6/21/15.
//
//
import UIKit
import SwiftyJSON

@objc protocol SocketManagerDelegate{
    func validateNumber()
    func presentAddVehicleNoVC()
    func dismissProfileVC()
}

@objc protocol SocketManagerDelegate1{
    func presentProfileVC()
    func reloadLeftVC()
}

@objc protocol SocketManagerDelegate2{
    func presentChooseBrand()
}

@objc protocol SocketManagerDelegate3{
    func presentChooseModel()
}

@objc protocol SocketManagerDelegate4{
    func reloadSubModel()
    func dismissChooseModelSubModelVC()
}

@objc protocol SocketManagerDelegate5{
    func dismissPromoScreen(promoAmount: String)
    func promoNotValid()
}

@objc protocol SocketManagerDelegate6{
    func reloadSlot()
    func presentModifyScreen()
    func dismissBookingForm()
    func reloadBookingForm()
}

@objc protocol SocketManagerDelegate7{
    func presentBookingForm()
    func presentCostEstimator()
    func presentHistory()
    func presentEditVehicle()
    func presentModifyScreen()
    func presentRatingScreen()
    func reloadHomePage()
}
@objc protocol SocketManagerDelegate8{
    func refreshChat(message: String)
}
@objc protocol SocketManagerDelegate9{
    func reloadModifyPage()
    func refreshEta(eta: String)
    func presentRatingScreen()
    func openChatScreen()
    func presentBookingForm()
    func dismissModifyScreen()
    func updateDrop()
}
@objc protocol SocketManagerDelegate10{
    func dismissRatingScreen()
}
@objc protocol SocketManagerDelegate11{
    func dismissEditPage()
    func presentBrands()
    func presentModels()
}
@objc protocol SocketManagerDelegate12{
    func dismissHelpScreen()
}
@objc protocol SocketManagerDelegate13{
    func dismissPartnerPage()
}
@objc protocol SocketManagerDelegate14{
    func refreshAmbMap()
}
@objc protocol SocketManagerDelegate15{
    func dismissRequestingVC()
}

class Socket: NSObject, StreamDelegate {
    let appdelegate = UIApplication.shared.delegate as? AppDelegate
    var delegate: SocketManagerDelegate?
    var delegate1: SocketManagerDelegate1?
    var delegate2: SocketManagerDelegate2?
    var delegate3: SocketManagerDelegate3?
    var delegate4: SocketManagerDelegate4?
    var delegate5: SocketManagerDelegate5?
    var delegate6: SocketManagerDelegate6?
    var delegate7: SocketManagerDelegate7?
    var delegate8: SocketManagerDelegate8?
    var delegate9: SocketManagerDelegate9?
    var delegate10: SocketManagerDelegate10?
    var delegate11: SocketManagerDelegate11?
    var delegate12: SocketManagerDelegate12?
    var delegate13: SocketManagerDelegate13?
    var delegate14: SocketManagerDelegate14?
    var delegate15: SocketManagerDelegate15?
    var showLoading = true
    var splitDate = [String]()
    var defaultSelectedDate = ""
    var defaultSelectedSlot = ""
    var earliestDate: Date!
    
    fileprivate let bufferSize = 1024
    fileprivate var clearMe:String?
    fileprivate var _messagesQueue:Array<String> = [String]()
    fileprivate var _streamHasSpace:Bool = false
    fileprivate var inputStream: InputStream?
    fileprivate var outputStream: OutputStream?
    fileprivate var inputBuffer = NSMutableData(capacity: 65536)!
    fileprivate  let terminator = "\0".data(using: String.Encoding.utf8)!
    fileprivate  let terminatornl = "\n".data(using: String.Encoding.utf8)!
    fileprivate  let terminatorlarge = "ø".data(using: String.Encoding.utf8)!
    var x = 0
    var startLoadTimer: Timer!
    var stopLoadTimer: Timer!
    var pingTimer: Timer!
    var pingReplyTimer:Timer!
    var myTimer:Timer!
    var locTimer:Timer!
    var responseJson: JSON = JSON.null
    
    deinit{
        if let inputStr = self.inputStream{
            inputStr.close()
            inputStr.remove(from: .main, forMode: RunLoopMode.defaultRunLoopMode)
        }
        if let outputStr = self.outputStream{
            outputStr.close()
            outputStr.remove(from: .main, forMode: RunLoopMode.defaultRunLoopMode)
        }
    }
    
    final func close(){
        let string = "X\n"
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        self.outputStream?.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count)
        if let inputStr = self.inputStream{
            inputStr.close()
            inputStr.remove(from: .main, forMode: RunLoopMode.defaultRunLoopMode)
        }
        if let outputStr = self.outputStream{
            outputStr.close()
            outputStr.remove(from: .main, forMode: RunLoopMode.defaultRunLoopMode)
        }
    }
    
    /**
     Opens streaming for both reading and writing, error will be thrown if you try to send a message and streaming hasn't been opened
     
     - parameter host: String with host portion
     - parameter port: Port
     */
    final func open(_ host:String!, port:Int!){
        self.inputStream = nil
        self.outputStream = nil
        
        //        let host1 = "202.56.203.38"
        //        let port1 = 7416
        
        Stream.getStreamsToHost(withName: host, port: port, inputStream: &inputStream, outputStream: &outputStream)
        
        if inputStream != nil && outputStream != nil{
            inputStream!.delegate = self
            outputStream!.delegate = self
            inputStream!.schedule(in: .main, forMode: RunLoopMode.defaultRunLoopMode)
            outputStream!.schedule(in: .main, forMode: RunLoopMode.defaultRunLoopMode)
            print("[SCKT]: Open Stream")
            print("Host", host)
            print("port", port)
            self._messagesQueue = Array()
            inputStream!.open()
            outputStream!.open()
        } else {
            print("[SCKT]: Failed Getting Streams")
            socketServerDown("Unable to Connect")
        }
    }
    
    /**
     NSStream Delegate Method where we handle errors, read and write data from input and output streams
     
     - parameter stream: NStream that called delegate method
     - parameter eventCode:      Event Code
     */
    var serverDownCount = 0
    final func stream(_ stream: Stream, handle eventCode: Stream.Event) {
        switch eventCode {
        case Stream.Event.endEncountered:
            endEncountered(stream)
            socketShutDown(stream)
        case Stream.Event.errorOccurred:
            print("[SCKT]: ErrorOccurred: \(String(describing: stream.streamError?.localizedDescription))")
            socketDidDisconnect()
            print("Unable to connect server")
            print("errorOccured" ,x)
            x = 1
            let mobileDictionary = ["NetworkStatus" : "Server Down", "check": "0"]
            print()
            
            if(serverDownCount==0 && DataCreator.sharedInstance.currentScreenNo == 0){
                NotificationCenter.default.post(name: Notification.Name(rawValue: "NetworkStatus"), object: nil, userInfo: mobileDictionary)
                serverDownCount=1
            }
        case Stream.Event.openCompleted:
            if (stream == outputStream) {
                print("output stream opened")
                openCompleted(stream)
            }
        case Stream.Event.hasBytesAvailable:
            handleIncommingStream(stream)
            
        case Stream.Event.hasSpaceAvailable:
            let mobileDictionary = ["NetworkStatus" : "Server Down", "check": "1"]
            print()
            if(x==1){
                NotificationCenter.default.post(name: Notification.Name(rawValue: "NetworkStatus"), object: nil, userInfo: mobileDictionary)
                DataCreator.sharedInstance.reconnect = 0
                x=0
            }
            writeToStream()
            socketReady(stream)
            break;
            
        default:
            break;
        }
    }
    
    final func endEncountered(_ stream:Stream){}
    
    final func openCompleted(_ stream:Stream){
        if(self.inputStream?.streamStatus == .open && self.outputStream?.streamStatus == .open){
            socketDidConnect(stream)
        }
    }
    
    /**
     Reads bytes asynchronously from incomming stream and calls delegate method socketDidReceiveMessage
     
     - parameter stream: An NSInputStream
     */
    
    final func handleIncommingStream(_ stream: Stream){
        var result : [String] = []
        let bufferSize = 4116
        var buffer = Array<UInt8>(repeating: 0, count: bufferSize)
        
        let bytesRead = self.inputStream!.read(&buffer, maxLength: buffer.count)
        
        if bytesRead > 0{
            self.inputBuffer.append(&buffer, length: bytesRead)
            
            let terminatorRange: NSRange = self.inputBuffer.range(of: terminator,options: NSData.SearchOptions(),in: NSMakeRange(0, self.inputBuffer.length))
            
            let terminatorRangenl: NSRange = self.inputBuffer.range(of: terminatornl,options: NSData.SearchOptions(),in: NSMakeRange(0, self.inputBuffer.length))
            
            let terminatorRangelarge: NSRange = self.inputBuffer.range(of: terminatorlarge,options: NSData.SearchOptions(),in: NSMakeRange(0, self.inputBuffer.length))
            var blockString = NSString(data: self.inputBuffer as Data, encoding: String.Encoding.utf8.rawValue)
            print(terminatorRangelarge.location)
            
            result.append(blockString! as String)
            print(terminatorRange.location)
            print(terminatorRangelarge.location)
            
            // When the terminator is found, process the data
            if ((terminatorRange.location != NSNotFound) || (terminatorRangelarge.location != NSNotFound) || (terminatorRangenl.location != NSNotFound)){
                print(result[0])
                let termlocation = terminatorRange.location
                let termnllocation = terminatorRangenl.location
                var finallocation = 0;
                if (termlocation > termnllocation){
                    finallocation = termnllocation
                }
                else{
                    finallocation = termlocation
                }
                blockString = blockString?.substring(with: NSRange(location: 0, length: finallocation)) as NSString?
                self.socketDidReceiveMessage(message: (blockString! as String))
                // Clean the buffer
                let rangeToEndOfTerminator = NSMakeRange(0, self.inputBuffer.length)
                result[0] = ""
                self.inputBuffer.replaceBytes(in: rangeToEndOfTerminator, withBytes: nil, length: 0)
            }
        }
            
        else if bytesRead < 0{
            print("Input stream has less than 0 bytes")
        }
            
        else if bytesRead == 0
        {
            print("Input stream has 0 bytes")
            let mobileDictionary = ["NetworkStatus" : "Server Down", "check": "0"]
            if(x==0){
                NotificationCenter.default.post(name: Notification.Name(rawValue: "NetworkStatus"), object: nil, userInfo: mobileDictionary)
            }
        }
    }
    
    /**
     If messages exist in _messagesQueue it will remove and it and send it, if there is an error
     it will return the message to the queue
     */
    final func writeToStream(){
        if _messagesQueue.count > 2{
            clearMe = "Disconnected."
            unableToreachserver(clearMe!)
        }
        if _messagesQueue.count > 4{
            clearMe = "Too many messages in buffer to clear."
        }
        if _messagesQueue.count > 0 && self.outputStream!.hasSpaceAvailable  {
            DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
                if (self._messagesQueue.count > 0){
                    let message = self._messagesQueue.removeLast()
                    
                    let data = message.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                    
                    while ( !self.outputStream!.hasSpaceAvailable)
                    {
                        Thread.sleep(forTimeInterval: 0.05)
                    }
                    //An error ocurred when writing
                    if self.outputStream!.write((data as NSData).bytes.bindMemory(to: UInt8.self, capacity: data.count), maxLength: data.count) == -1 {
                        self._messagesQueue.append(message)
                    }
                    self.socketWrote("Wrote")
                }
            })
        }
    }
    
    func listFilesFromDocumentsFolder() -> [String]{
        let theError: NSErrorPointer = nil
        let dirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        var dir = dirs[0]
        dir = dir+"/f/"
        var fileList: [AnyObject]?
        do {
            fileList = try FileManager.default.contentsOfDirectory(atPath: dir) as [AnyObject]?
        } catch let error as NSError {
            theError?.pointee = error
            fileList = nil
        }
        return fileList as! [String]
    }
    
    func socketReady(_ stream:Stream){}
    
    func socketDidConnect(_ stream:Stream){
        DataCreator.sharedInstance.connected = 1
        DataCreator.sharedInstance.reachCount = 1
        
        //Setting Ping Timer  for 20 seconds
        let mobileDictionary = ["NetworkStatus" : "trying to connect", "check": "1"]
        NotificationCenter.default.post(name: Notification.Name(rawValue: "NetworkStatus"), object: nil, userInfo: mobileDictionary)
        
        pingTimer = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(pingServer), userInfo: nil, repeats: false)
        
        if let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber){
            send("\(Constants.RequestStates.Login)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber)!)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.deviceId)!)|")
            if DataCreator.sharedInstance.loginTryTimer == nil {
                DataCreator.sharedInstance.loginTryTimer = Timer.scheduledTimer(timeInterval: 7, target: self, selector: #selector(retryLogin), userInfo: nil, repeats: true)
            }
            if (myTimer != nil) {
                myTimer.invalidate()
            }
        }
        //            else{
        //                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HIDELOADINGPAGE"), object: nil)
        //            }
    }
    
    func socketDidDisconnect(){
        let mobileDictionary = ["NetworkStatus" : "trying to connect", "check": "0"]
        NotificationCenter.default.post(name: Notification.Name(rawValue: "NetworkStatus"), object: nil, userInfo: mobileDictionary)
        if (locTimer != nil) {locTimer.invalidate()}
        if (pingTimer != nil){
            pingTimer.invalidate()
        }
        DataCreator.sharedInstance.connected = 0
        DataCreator.sharedInstance.login = 0
        close()
        
        myTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(retryServer(_:)), userInfo: nil, repeats: true)
        
        print("Disconnect")
    }
    
    func socketReconnect(_ message:String){}
    
    func unableToreachserver(_ message:String){}
    
    func handleLoginResponse(responseJson: JSON){
        if(DataCreator.sharedInstance.loginTryTimer != nil){
            DataCreator.sharedInstance.loginTryTimer.invalidate()
        }
        
        DataCreator.sharedInstance.vehicleArray.removeAll()
        DataCreator.sharedInstance.postBookingData.removeAll()
        DataCreator.sharedInstance.cancelReasons.removeAll()
        
        if responseJson["record0"][0]["-1"].stringValue != "-1" && responseJson["record0"].count > 0{
            do{
                DataCreator.sharedInstance.loginResponse = try LoginResponse(json: responseJson)
            }
            catch{}
            
            DataCreator.sharedInstance.sponserLink = DataCreator.sharedInstance.loginResponse.advertLink
            let url = URL(string: DataCreator.sharedInstance.loginResponse.advertImage)
            let adImageURL = try? Data(contentsOf: url!)
            if(adImageURL != nil){
                DataCreator.sharedInstance.sponserImageLink = UIImage(data: adImageURL!)!
            }
            
            //After create profile we receive the same response as userLogin, so check for userid
            if DataCreator.sharedInstance.signupResponse.userId == "-1"{
                UserDefaults.standard.set(DataCreator.sharedInstance.mobileNumber, forKey: Constants.UserDefaultKeys.MobileNumber)
            }
            
            if responseJson["record1"][0]["-1"].stringValue != "-1"{
                DataCreator.sharedInstance.vehicleArray.append(contentsOf: DataCreator.sharedInstance.loginResponse.vehiclesList)
            }
            
            if !DataCreator.sharedInstance.vehicleArray.isEmpty{
                DataCreator.sharedInstance.fullVehicleData.vehiclemake_id = DataCreator.sharedInstance.loginResponse.vehiclesList[0].brandid
                DataCreator.sharedInstance.fullVehicleData.vehiclemodelid = DataCreator.sharedInstance.loginResponse.vehiclesList[0].modelid
                DataCreator.sharedInstance.selectedVehicleID = DataCreator.sharedInstance.loginResponse.vehiclesList[0].id
                DataCreator.sharedInstance.fullVehicleData.sub_model_id = DataCreator.sharedInstance.loginResponse.vehiclesList[0].smodelid
                DataCreator.sharedInstance.selectedVehicleNumber = DataCreator.sharedInstance.loginResponse.vehiclesList[0].number
            }
            
            //Append booking data only when record2 has values
            if responseJson["record2"].count > 0 && responseJson["record2"][0]["-1"].stringValue != "-1"{
                
                DataCreator.sharedInstance.serviceType = responseJson["record2"][0]["svc_type"].stringValue
                
                DataCreator.sharedInstance.currentVehicleId = 0
                DataCreator.sharedInstance.currentScreenId = Int(DataCreator.sharedInstance.loginResponse.bookingData[0].screenid)!
                
                DataCreator.sharedInstance.postBookingData.append(contentsOf: DataCreator.sharedInstance.loginResponse.bookingData)
                
                DataCreator.sharedInstance.cancelReasons.append(contentsOf: DataCreator.sharedInstance.loginResponse.cancelReason)
            }
            
            delegate1?.reloadLeftVC()
            
            if DataCreator.sharedInstance.currentScreen == "ProfileScreen"{
                //                presentVC(viewController: AddVehicleNoViewController())
                delegate?.presentAddVehicleNoVC()
            }
        }
        if DataCreator.sharedInstance.currentScreen == "HomeScreen"{
            delegate7?.reloadHomePage()
        }
    }
    
    func presentVC(viewController: UIViewController){
        let topVC = Helper.topMostController()
        topVC.present(viewController, animated: true, completion: nil)
    }
    
    func socketDidReceiveMessage(message:String){
        var message1 = ""
        print("Received message", message)
        if(message == "PINGSUCCESS"){
            pingReplyTimer.invalidate()
        }
            
        else {
            
            //To separate actual chat response from ping(ping {"rproc".....): get a substring from { to end of message
            if let pos = message.range(of: "{") {
                message1 = String(message[pos.lowerBound...])
            }
            
            if let dataFromString = message1.data(using: .utf8, allowLossyConversion: false) {
                if let responseJson = try? JSON(data: dataFromString) {
                    print("Received json \(responseJson)")
                    showLoading = false
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HIDELOADINGPAGE"), object: nil)
                    
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    
                    if responseJson["rproc"].stringValue == Constants.ResponseStates.Signup {
                        do{
                            DataCreator.sharedInstance.signupResponse = try SignupResponse(json: responseJson)
                        }
                        catch{}
                        
                        if DataCreator.sharedInstance.signupResponse.userId != "-1"{
                            //getallcars
                            send("\(Constants.RequestStates.GetAllInfo)|\(DataCreator.sharedInstance.signupResponse.userId)|")
                        }
                        if DataCreator.sharedInstance.currentScreen == "SignUp"{
                            delegate?.validateNumber()
                        }
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.GetAllInfo{
                        handleLoginResponse(responseJson: responseJson)
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.Login {
                        handleLoginResponse(responseJson: responseJson)
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.ChatRefresh {
                        delegate8?.refreshChat(message: responseJson["record0"][0]["chatvar"].stringValue)
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.BookingDetails {
                        var postBookingDetails = PostBookingDetails()
                        do{
                            postBookingDetails = try PostBookingDetails(json: responseJson)
                        }
                        catch{}
                        DataCreator.sharedInstance.serviceCentreList.removeAll()
                        DataCreator.sharedInstance.subComplaintList.removeAll()
                        DataCreator.sharedInstance.complaintList.removeAll()
                        DataCreator.sharedInstance.cancelReasons.removeAll()
                        DataCreator.sharedInstance.slotList.removeAll()
                        
                        DataCreator.sharedInstance.serviceCentreList.append(contentsOf: postBookingDetails.serviceCentreData)
                        DataCreator.sharedInstance.subComplaintList.append(contentsOf: postBookingDetails.subComplaintData)
                        DataCreator.sharedInstance.complaintList.append(contentsOf: postBookingDetails.complaintData)
                        
                        DataCreator.sharedInstance.cancelReasons.append(contentsOf: postBookingDetails.cancelReason)
                        
                        DataCreator.sharedInstance.slotList.append(contentsOf: postBookingDetails.slotData)
                        
                        DataCreator.sharedInstance.bookingFormTitle = NSLocalizedString("ServicingHeader", comment: "")
                        
                        DataCreator.sharedInstance.postBookingData.removeAll()
                        
                        DataCreator.sharedInstance.currentScreenId = Int(postBookingDetails.bookingData[0].screenid)!
                        
                        DataCreator.sharedInstance.postBookingData.append(contentsOf: postBookingDetails.bookingData)
                        
                        
                        
                        DataCreator.sharedInstance.currentBookingId = DataCreator.sharedInstance.postBookingData[0].queueid
                        
                        Helper.getPostBookingFormData(bookingData: DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()])
                        
                        let splitQTime = DataCreator.sharedInstance.postBookingData[Helper.getBookingIndex()].qtime.split(separator: " ").map(String.init)
                        earliestDate = dateFormatter.date(from: splitQTime[0])
                        
                        if DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0"{
                            send("\(Constants.RequestStates.HolidayList)|February|2018|")
                        }
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.RefreshQueue {
                        if responseJson["record0"].count > 0{
                            DataCreator.sharedInstance.postBookingData.removeAll()
                            DataCreator.sharedInstance.cancelReasons.removeAll()
                            
                            var refreshResponse = RefreshResponse()
                            
                            if responseJson["record0"][0]["-1"].stringValue != "-1"{
                                do{
                                    refreshResponse = try RefreshResponse(json: responseJson)
                                }
                                catch{}
                            }
                            DataCreator.sharedInstance.cancelReasons.append(contentsOf: refreshResponse.cancelReason)
                            
                            let bookingIndex = Helper.getBookingIndex()
                            Helper.getPostBookingFormData(bookingData: refreshResponse.bookingData[bookingIndex])
                            
                            DataCreator.sharedInstance.postBookingData.append(contentsOf: refreshResponse.bookingData)
                            
                            if DataCreator.sharedInstance.currentScreen == "ModifyScreen"{
                                if refreshResponse.bookingData[bookingIndex].screenid != "8" && refreshResponse.bookingData[bookingIndex].screenid != "25" && refreshResponse.bookingData[bookingIndex].screenid != "34"{
                                    delegate9?.reloadModifyPage()
                                }
                                else{
                                    delegate9?.presentRatingScreen()
                                }
                            }
                            else if DataCreator.sharedInstance.currentScreen == "HomeScreen"{
                                delegate7?.reloadHomePage()
                            }
                            if refreshResponse.bookingData[bookingIndex].typesvc == "3" || refreshResponse.bookingData[bookingIndex].typesvc == "2"{
                                delegate15?.dismissRequestingVC()
                            }
                        }
                        send("\(Constants.RequestStates.DeleteRefresh)|1|")
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.rsaEtaRefresh || responseJson["rproc"].stringValue == Constants.ResponseStates.chauffEtaRefresh {
                        if responseJson["record0"].count > 0 && DataCreator.sharedInstance.currentScreen == "ModifyScreen" && responseJson["record0"][0]["queueidvar"].stringValue == DataCreator.sharedInstance.currentBookingId{
                            delegate9?.refreshEta(eta: responseJson["record0"][0]["etavar"].stringValue)
                            //                                    { "rproc": "REFRESHETARSA!", "record0": [ {"custidvar": "146695", "queueidvar": "271002", "etavar": "1"} ]}
                        }
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.AddVehicle {
                        do{
                            let addVehicleData = try BookedVehicleData(json: responseJson["record0"][0])
                            DataCreator.sharedInstance.vehicleArray.append(addVehicleData)
                        }
                        catch{}
                        delegate4?.dismissChooseModelSubModelVC()
                        let value = ["SCROLL": String(DataCreator.sharedInstance.vehicleArray.count-1)]
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "SCROLL"), object: nil, userInfo: value)
                        
                        
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.UpdateVehicleBrand {
                        DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].brandid = DataCreator.sharedInstance.fullVehicleData.vehiclemake_id
                        DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].modelid = DataCreator.sharedInstance.fullVehicleData.vehiclemodelid
                        DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].smodelid = DataCreator.sharedInstance.fullVehicleData.sub_model_id
                        delegate4?.dismissChooseModelSubModelVC()
                    }
                        //Change number from profile page or regenerate otp during signup
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.GenerateOtp && !responseJson["record0"][0]["otpvar"].stringValue.isEmpty{
                        DataCreator.sharedInstance.signupResponse.otp = responseJson["record0"][0]["otpvar"].stringValue
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.UserDetails {
                        do{
                            DataCreator.sharedInstance.userData = try UserData(json: responseJson["record0"][0])
                        }
                        catch{}
                        DataCreator.sharedInstance.loginResponse.fname = DataCreator.sharedInstance.userData.firstName
                        //                            presentVC(viewController: ProfileViewController())
                        delegate1?.presentProfileVC()
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.VehicleDetails {
                        do{
                            DataCreator.sharedInstance.fullVehicleData = try FullVehicleData(json: responseJson["record0"][0])
                        }
                        catch{}
                        
                        delegate7?.presentEditVehicle()
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.VehicleHistory {
                        DataCreator.sharedInstance.historyData.removeAll()
                        if responseJson["record0"][0]["-1"].stringValue != "-1"{
                            for i in 0 ..< responseJson["record0"].count{
                                do{
                                    let historyData = try BookingData(json: responseJson["record0"][i])
                                    DataCreator.sharedInstance.historyData.append(historyData)
                                }
                                catch{}
                            }
                        }
                        delegate7?.presentHistory()
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.VehicleBrands {
                        DataCreator.sharedInstance.brandArray.removeAll()
                        if responseJson["record0"][0]["-1"].stringValue != "-1"{
                            for i in 0 ..< responseJson["record0"].count{
                                do{
                                    let brandData = try BrandData(json: responseJson["record0"][i])
                                    DataCreator.sharedInstance.brandArray.append(brandData)
                                }
                                catch{}
                            }
                        }
                        //                            presentVC(viewController: ChooseBrandViewController())
                        if DataCreator.sharedInstance.modelPageTriggeredFrom == "EditBrandPage"{
                            delegate11?.presentBrands()
                            return
                        }
                        delegate2?.presentChooseBrand()
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.VehicleModels {
                        DataCreator.sharedInstance.modelArray.removeAll()
                        DataCreator.sharedInstance.fullVehicleData.vehiclemodelid = ""
                        if responseJson["record0"][0]["-1"].stringValue != "-1"{
                            for i in 0 ..< responseJson["record0"].count{
                                do{
                                    let modelData = try ModelData(json: responseJson["record0"][i])
                                    DataCreator.sharedInstance.modelArray.append(modelData)
                                }
                                catch{}
                            }
                        }
                        if DataCreator.sharedInstance.fullVehicleData.vehiclemodelid.isEmpty{
                            DataCreator.sharedInstance.fullVehicleData.vehiclemodelid = DataCreator.sharedInstance.modelArray[0].id
                        }
                        send("\(Constants.RequestStates.VehicleSubModels)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemodelid)|")
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.VehicleSubModels {
                        DataCreator.sharedInstance.subModelArray.removeAll()
                        if responseJson["record0"][0]["-1"].stringValue != "-1"{
                            for i in 0 ..< responseJson["record0"].count{
                                do{
                                    let subModelData = try SubModelData(json: responseJson["record0"][i])
                                    DataCreator.sharedInstance.subModelArray.append(subModelData)
                                }
                                catch{}
                            }
                        }
                        if DataCreator.sharedInstance.shouldReloadSubModel{
                            delegate4?.reloadSubModel()
                        }
                        else{
                            if DataCreator.sharedInstance.modelPageTriggeredFrom == "BrandsPage" || DataCreator.sharedInstance.modelPageTriggeredFrom == "EditBrandPage"{
                                //                                    presentVC(viewController: ChooseModelSubModelViewController())
                                delegate3?.presentChooseModel()
                            }
                            else if DataCreator.sharedInstance.modelPageTriggeredFrom == "EditPage"{
                                delegate11?.presentModels()
                            }
                        }
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.BookingData {
                        DataCreator.sharedInstance.bookingFormData.removeAll()
                        DataCreator.sharedInstance.serviceCentreList.removeAll()
                        DataCreator.sharedInstance.rsaComplaintList.removeAll()
                        DataCreator.sharedInstance.cancelReasons.removeAll()
                        DataCreator.sharedInstance.subComplaintList.removeAll()
                        DataCreator.sharedInstance.complaintList.removeAll()
                        DataCreator.sharedInstance.slotList.removeAll()
                        
                        if DataCreator.sharedInstance.serviceType == "3"{
                            DataCreator.sharedInstance.bookingFormTitle = NSLocalizedString("RSAHeader", comment: "")
                            var complaint = ""
                            var serviceCentre = ""
                            var cfee = ""
                            var eta = ""
                            
                            do{
                                DataCreator.sharedInstance.rsaBookingFormData = try RSABookingFormData(json: responseJson)
                            }
                            catch{}
                            
                            DataCreator.sharedInstance.rsaComplaintList.append(contentsOf: DataCreator.sharedInstance.rsaBookingFormData.rsaComplaintData)
                            DataCreator.sharedInstance.waitTimeForRequest = DataCreator.sharedInstance.rsaBookingFormData.waitTimeData
                            DataCreator.sharedInstance.cancelReasons.append(contentsOf: DataCreator.sharedInstance.rsaBookingFormData.cancelReason)
                            
                            
                            if responseJson["record1"][0]["-1"] == "-1"{
                                complaint = NSLocalizedString("NoServiceCentreText", comment: "")
                                serviceCentre = NSLocalizedString("NoServiceCentreText", comment: "")
                                cfee = "0"
                                eta = "0"
                            }
                            else{
                                DataCreator.sharedInstance.serviceCentreList.append(contentsOf: DataCreator.sharedInstance.rsaBookingFormData.serviceCentreData)
                                complaint = DataCreator.sharedInstance.rsaComplaintList[0].description
                                cfee = DataCreator.sharedInstance.rsaBookingFormData.rsaCost
                                serviceCentre = DataCreator.sharedInstance.serviceCentreList[0].name
                                eta = DataCreator.sharedInstance.waitTimeForRequest.eta
                            }
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("TowingNeededText", comment: ""),NSLocalizedString("VehicleNotMovingText", comment: ""),"1","",""])//1 = switch req, 2 = button image, 3 = button text
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("BreakdownLocText", comment: ""),DataCreator.sharedInstance.currentLocation,"2","locationIcon","2"])
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ServiceCentreText", comment: ""),serviceCentre,"2","edit","serviceCentre"])//text = default 1 = location cell, 2 = service centre cell
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PromoCodeText", comment: ""),NSLocalizedString("21North", comment: ""),"2","edit","promo"])
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ConvenienceFeeText", comment: ""),complaint,"3",cfee,"rsaCfee"])
                            DataCreator.sharedInstance.bookingFormData.append(["ETA",eta+" "+NSLocalizedString("MinutesText", comment: ""),NSLocalizedString("RequestRSAText", comment: "")])
                        }
                        else if DataCreator.sharedInstance.serviceType == "2"{
                            do{
                                DataCreator.sharedInstance.chauffeurBookingFormData = try ChauffeurBookingFormData(json: responseJson)
                            }
                            catch{}
                            DataCreator.sharedInstance.waitTimeForRequest = DataCreator.sharedInstance.chauffeurBookingFormData.waitTimeData
                            DataCreator.sharedInstance.cancelReasons.append(contentsOf: DataCreator.sharedInstance.chauffeurBookingFormData.cancelReason)
                            DataCreator.sharedInstance.bookingFormTitle = NSLocalizedString("ChauffeurServiceText", comment: "")
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PickupLocationText", comment: ""),DataCreator.sharedInstance.currentLocation,"2","locationIcon","1"])//1 = switch req, 2 = button image, 3 = button text
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("DropoffLocationText", comment: ""),DataCreator.sharedInstance.currentLocation,"2","locationIcon","2"])
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ApproxHoursText", comment: ""),"2 hours","2","edit","hours"])//text = default 1 = location cell, 2 = service centre cell
                            let cost = "\u{20B9} "+DataCreator.sharedInstance.chauffeurBookingFormData.cost+" "+NSLocalizedString("PerMinuteText", comment: "")
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("EstConvenienceFeeText", comment: ""),cost,"3",String(Float(DataCreator.sharedInstance.chauffeurBookingFormData.cost)!*60*2),"chauffeurCfee"])
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PromoCodeText", comment: ""),NSLocalizedString("21North", comment: ""),"2","edit","promo"])
                            DataCreator.sharedInstance.bookingFormData.append(["ETA",DataCreator.sharedInstance.waitTimeForRequest.eta+" "+NSLocalizedString("MinutesText", comment: ""),NSLocalizedString("RequestChauffeurText", comment: "")])
                        }
                        if DataCreator.sharedInstance.serviceType == "1" || DataCreator.sharedInstance.serviceType == "0"{
                            DataCreator.sharedInstance.bookingFormTitle = NSLocalizedString("ServicingHeader", comment: "")
                            var slotData = ""
                            var serviceCentre = ""
                            var cfee = ""
                            if responseJson["record0"][0]["-1"] != "-1"{
                                do{
                                    DataCreator.sharedInstance.servicingBookingFormData = try ServicingBookingFormData(json: responseJson)
                                }
                                catch{}
                                DataCreator.sharedInstance.serviceCentreList.append(contentsOf: DataCreator.sharedInstance.servicingBookingFormData.serviceCentreData)
                                DataCreator.sharedInstance.subComplaintList.append(contentsOf: DataCreator.sharedInstance.servicingBookingFormData.subComplaintData)
                                DataCreator.sharedInstance.complaintList.append(contentsOf: DataCreator.sharedInstance.servicingBookingFormData.complaintData)
                                DataCreator.sharedInstance.cancelReasons.append(contentsOf: DataCreator.sharedInstance.servicingBookingFormData.cancelReason)
                                DataCreator.sharedInstance.slotList.append(contentsOf: DataCreator.sharedInstance.servicingBookingFormData.slotData)
                                //Convert date and time to required format before displaying
                                var splitDate = (DataCreator.sharedInstance.servicingBookingFormData.earliestSlotDate.split(separator: "-").map(String.init))
                                splitDate[1] = Helper.getMonthNameFromNumber(monthNumber: Int(splitDate[1])!)
                                let defaultSelectedDate = splitDate[1]+" "+splitDate[2]+", "+splitDate[0]
                                //Your date format
                                //                                    dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
                                earliestDate = dateFormatter.date(from: DataCreator.sharedInstance.servicingBookingFormData.earliestSlotDate) //according to date format your
                                
                                //If earliest slot is for next day current date should be the next day
                                if DataCreator.sharedInstance.servicingBookingFormData.earliestSlotDate > dateFormatter.string(from: Date()){
                                    earliestDate.addTimeInterval(60 * 60 * 24)
                                }
                                let defaultSelectedSlot = DataCreator.sharedInstance.servicingBookingFormData.earliestSlotTime.convert24To12HoursFormat()+", "
                                slotData = defaultSelectedSlot+defaultSelectedDate
                                serviceCentre = DataCreator.sharedInstance.servicingBookingFormData.name
                                cfee = DataCreator.sharedInstance.servicingBookingFormData.advFee
                            }
                            //                                DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PickupDropText", comment: ""),NSLocalizedString("PickupDropRequiredText", comment: ""),DataCreator.sharedInstance.serviceType,"",""])
                            
                            if responseJson["record0"][0]["-1"] == "-1"{
                                slotData = NSLocalizedString("NoServiceCentreText", comment: "")
                                serviceCentre = NSLocalizedString("NoServiceCentreText", comment: "")
                                cfee = "0"
                            }
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("EarliestSlotText", comment: ""),slotData,"2","calendar","slot"])//datepicker for slot
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PickupLocationText", comment: ""),DataCreator.sharedInstance.currentLocation,"2","locationIcon","1"])//1 = switch req, 2 = button image, 3 = button text
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("DropoffLocationText", comment: ""),DataCreator.sharedInstance.currentLocation,"2","locationIcon","2"])
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ClosestCentreText", comment: ""),serviceCentre,"2","edit","serviceCentre"])
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("AddComplaintsText", comment: ""),NSLocalizedString("0ComplaintsText", comment: ""),"2","addComp","AddComplaints"])
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("PromoCodeText", comment: ""),NSLocalizedString("21North", comment: ""),"2","edit","promo"])
                            DataCreator.sharedInstance.bookingFormData.append([NSLocalizedString("ConvenienceFeeText", comment: ""),NSLocalizedString("ExpertHelpText", comment: ""),"3",cfee,""])
                            DataCreator.sharedInstance.bookingFormData.append(["","",NSLocalizedString("ScheduleServicingText", comment: "")])
                            if earliestDate == nil{
                                if DataCreator.sharedInstance.currentScreen == "BookingScreen"{
                                    delegate6?.reloadBookingForm()
                                }
                                else if DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus != "111"{
                                    delegate7?.presentModifyScreen()
                                }
                                else{
                                    delegate7?.presentBookingForm()
                                }
                            }
                            else{
                                send("\(Constants.RequestStates.HolidayList)|February|2018|")
                            }
                        }
                        if DataCreator.sharedInstance.serviceType == "2" || DataCreator.sharedInstance.serviceType == "3"{
                            delegate7?.presentBookingForm()
                        }
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.HolidayList {
                        DataCreator.sharedInstance.dateList.removeAll()
                        var calendar = NSCalendar.current
                        calendar.timeZone = NSTimeZone(abbreviation: "UTC")! as TimeZone //OR NSTimeZone.localTimeZone()
                        earliestDate = calendar.startOfDay(for: earliestDate)
                        let endDate = earliestDate.dateAfterXMonths(x: 6)
                        let dateArray = earliestDate.generateDatesArrayBetweenTwoDates(startDate: earliestDate, endDate: endDate)
                        let dateFormatter = DateFormatter()
                        var yearArray = [String]()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        for i in 0 ..< dateArray.count{
                            DataCreator.sharedInstance.dateList.append(dateFormatter.string(from: dateArray[i]))
                        }
                        for i in 0 ..< responseJson["record1"].count{
                            if let index = DataCreator.sharedInstance.dateList.index(of: responseJson["record1"][i]["holidays"].stringValue){
                                DataCreator.sharedInstance.dateList.remove(at: index)
                            }
                        }
                        yearArray = yearArray.unique()
                        if DataCreator.sharedInstance.currentScreen == "BookingScreen"{
                            delegate6?.reloadBookingForm()
                        }
                        else if DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus != "111"{
                            delegate7?.presentModifyScreen()
                        }
                        else{
                            delegate7?.presentBookingForm()
                        }
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.UpdateDropLocation {
                        if DataCreator.sharedInstance.signupResponse.userId.isEmpty{
                            send("\(Constants.RequestStates.GetAllInfo)|\(DataCreator.sharedInstance.loginResponse.userId)|")
                        }
                        else{
                            send("\(Constants.RequestStates.GetAllInfo)|\(DataCreator.sharedInstance.signupResponse.userId)|")
                        }
                        delegate9?.updateDrop()
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.SlotList {
                        DataCreator.sharedInstance.slotList.removeAll()
                        for i in 0 ..< responseJson["record0"].count{
                            do{
                                let slotData = try SlotData(json: responseJson["record0"][i])
                                DataCreator.sharedInstance.slotList.append(slotData)
                            }
                            catch{}
                        }
                        delegate6?.reloadSlot()
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.ComplaintList {
                        DataCreator.sharedInstance.subComplaintList.removeAll()
                        DataCreator.sharedInstance.complaintList.removeAll()
                        for i in 0 ..< responseJson["record1"].count{
                            do{
                                let subComplaintData = try SubComplaintData(json: responseJson["record1"][i])
                                DataCreator.sharedInstance.subComplaintList.append(subComplaintData)
                            }
                            catch{}
                        }
                        for i in 0 ..< responseJson["record0"].count{
                            do{
                                let complaintData = try ComplaintData(json: responseJson["record0"][i])
                                DataCreator.sharedInstance.complaintList.append(complaintData)
                            }
                            catch{}
                        }
                        delegate7?.presentCostEstimator()
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.GetChat {
                        DataCreator.sharedInstance.chatArray.removeAll()
                        for i in 0 ..< responseJson["record0"].count{
                            do{
                                let chatData = try ChatData(json: responseJson["record0"][i])
                                DataCreator.sharedInstance.chatArray.append(chatData)
                            }
                            catch{}
                        }
                        delegate9?.openChatScreen()
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.RefreshLocation {
                        UserDefaults.standard.set(responseJson["record1"][0]["latvar"].stringValue, forKey: Constants.UserDefaultKeys.AmbLat)
                        UserDefaults.standard.set(responseJson["record1"][0]["longvar"].stringValue, forKey: Constants.UserDefaultKeys.AmbLong)
                        delegate14?.refreshAmbMap()
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.ModifyBooking {
                        DataCreator.sharedInstance.currentBookingId = responseJson["record0"][0]["bookingid"].stringValue
                        delegate6?.dismissBookingForm()
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.Rating {
                        let bookingIndex = Helper.getBookingIndex()
                        if DataCreator.sharedInstance.postBookingData[bookingIndex].queueid == DataCreator.sharedInstance.currentBookingId{
                            if DataCreator.sharedInstance.serviceType == "3"{
                                DataCreator.sharedInstance.postBookingData[bookingIndex].screenid = "35"
                            }
                            else if DataCreator.sharedInstance.serviceType == "2"{
                                DataCreator.sharedInstance.postBookingData[bookingIndex].screenid = "26"
                            }
                            else if DataCreator.sharedInstance.serviceType == "1"  || DataCreator.sharedInstance.serviceType == "0"{
                                DataCreator.sharedInstance.postBookingData[bookingIndex].screenid = "9"
                            }
                        }
                        
                        DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus = "111"
                        delegate10?.dismissRatingScreen()
                        
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.Feedback {
                        delegate12?.dismissHelpScreen()
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.UpdateUser {
                        do{
                            DataCreator.sharedInstance.userData = try UserData(json: responseJson["record0"][0])
                        }
                        catch{}
                        
                        UserDefaults.standard.set(DataCreator.sharedInstance.userData.mobile, forKey: Constants.UserDefaultKeys.MobileNumber)
                        DataCreator.sharedInstance.loginResponse.fname = DataCreator.sharedInstance.userData.firstName
                        delegate?.dismissProfileVC()
                        delegate1?.reloadLeftVC()
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.UpdateVehicle {
                        DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].number = DataCreator.sharedInstance.selectedVehicleNumber
                        delegate11?.dismissEditPage()
                        delegate1?.reloadLeftVC()
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.AppLeads {
                        delegate13?.dismissPartnerPage()
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.DeleteVehicle {
                        for i in 0 ..< DataCreator.sharedInstance.vehicleArray.count{
                            if DataCreator.sharedInstance.vehicleArray[i].id == DataCreator.sharedInstance.selectedVehicleID{
                                DataCreator.sharedInstance.vehicleArray.remove(at: i)
                                break
                            }
                        }
                        if !DataCreator.sharedInstance.vehicleArray.isEmpty{
                            DataCreator.sharedInstance.selectedVehicleID = DataCreator.sharedInstance.vehicleArray[0].id
                            DataCreator.sharedInstance.currentVehicleId = 0
                            let value = ["SCROLL": "0"]
                            NotificationCenter.default.post(name: Notification.Name(rawValue: "SCROLL"), object: nil, userInfo: value)
                        }
                        delegate11?.dismissEditPage()
                    }
                        
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.VerifyPromo {
                        if responseJson["record0"][0]["amount"].stringValue == "0"{
                            delegate5?.promoNotValid()
                        }
                        else{
                            delegate5?.dismissPromoScreen(promoAmount: responseJson["record0"][0]["amount"].stringValue)
                        }
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.CancelBooking {
                        DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus = responseJson["record0"][0]["veh_status"].stringValue
                        delegate9?.dismissModifyScreen()
                        
                    }
                    else if responseJson["rproc"].stringValue == Constants.ResponseStates.AddBooking {
                        DataCreator.sharedInstance.vehicleArray[DataCreator.sharedInstance.currentVehicleId].vehstatus = responseJson["record0"][0]["veh_status"].stringValue
                        DataCreator.sharedInstance.currentScreenId = 0
                        DataCreator.sharedInstance.currentBookingId = responseJson["record0"][0]["bookingid"].stringValue
                        if DataCreator.sharedInstance.serviceType == "1"  || DataCreator.sharedInstance.serviceType == "0"{
                            delegate6?.presentModifyScreen()
                        }
                    }
                }
            }
        }
    }
    
    func socketServerDown(_ message:String){}
    
    func socketShutDown(_ stream:Stream){
        close()
        DataCreator.sharedInstance.connected = 0
        DataCreator.sharedInstance.login = 0
        myTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(retryServer(_:)), userInfo: nil, repeats:  true)
    }
    
    func socketWrote(_ message:String){
        DataCreator.sharedInstance.connected = 1
    }
    
    @objc func retryServer(_ timer:Timer){
        if (myTimer != nil)
        {
            myTimer.invalidate()
        }
        close()
        DataCreator.sharedInstance.login = 0
        if let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber){
            DataCreator.sharedInstance.reconnect = 1
        }
        open(DataCreator.sharedInstance.connserver, port: DataCreator.sharedInstance.connport)
    }
    
    @objc func retryLogin(){
        send("\(Constants.RequestStates.Login)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber)!)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.deviceId)!)|")
    }
    
    @objc func pingServer() {
        pingTimer.invalidate()
        //Setting Ping Timer again for 20 seconds
        pingTimer = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(pingServer), userInfo: nil, repeats: false)
        send("PINGS")
        //Setting Ping Response Timer for 5 seconds. If Ping Response is not received Client will disconnect and connect again.
        pingReplyTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(pingretryServer), userInfo: nil, repeats: false)
    }
    
    @objc func pingretryServer() {
        pingTimer.invalidate()
        pingReplyTimer.invalidate()
        retryServer(pingReplyTimer)
    }
    
    func currentTimeMillis() -> Int64{
        let nowDouble = NSDate().timeIntervalSince1970
        return Int64(nowDouble*1000)
    }
    
    var deviceId = DataCreator.sharedInstance.deviceId
    let loginChatString = DataCreator.sharedInstance.loginChatString
    func updateLabelColourWhenReachable(_ reachability: Reachability){
        let nwstatus = UILabel()
        nwstatus.frame = CGRect(x: 100,y: 100,width: 100,height: 100)
        if reachability.isReachableViaWiFi {
            nwstatus.textColor = UIColor.orange
        } else {
            nwstatus.textColor = UIColor.lightGray
            print(nwstatus)
        }
        if(DataCreator.sharedInstance.currentScreenNo == 0){
            let mobileDictionary = ["NetworkStatus" : "trying to connect", "check": "1"]
            NotificationCenter.default.post(name: Notification.Name(rawValue: "NetworkStatus"), object: nil, userInfo: mobileDictionary)
        }
        nwstatus.text  = reachability.currentReachabilityString
        DataCreator.sharedInstance.reachCount = 1
    }
    
    final func sendFile(_ filename:String){
        if self.outputStream!.hasSpaceAvailable  {
            DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
                _ = FileManager.default
                let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("f/") as String
                var fileSize : UInt64 = 0
                let theError: NSErrorPointer = nil
                var fileList: [AnyObject]?
                do {
                    fileList = try FileManager.default.contentsOfDirectory(atPath: dir) as [AnyObject]?
                } catch let error as NSError {
                    theError?.pointee = error
                    fileList = nil
                } catch {
                    fatalError()
                }
                if (fileList != nil) {
                    for i in 0 ..< fileList!.count{
                        
                        let filefolder = "\(dir)/\(fileList![i])"
                        let filename = "\(fileList![i])"
                        
                        let attr:NSDictionary? = try! FileManager.default.attributesOfItem(atPath: filefolder) as NSDictionary?
                        if let _attr = attr {
                            fileSize = _attr.fileSize();
                        }
                        let filenameupload = "FILUP,\(filename),\(fileSize)"
                        let dataopen = filenameupload.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                        if self.outputStream!.write((dataopen as NSData).bytes.bindMemory(to: UInt8.self, capacity: dataopen.count), maxLength: dataopen.count) == -1 {
                            print("error : opening file")
                        }
                        let data = try? Data(contentsOf: URL(fileURLWithPath: filefolder))
                        var bytesWritten = 0;
                        var writeResult = 0;
                        while ( data!.count > bytesWritten ) {
                            while ( !self.outputStream!.hasSpaceAvailable ){
                                Thread.sleep(forTimeInterval: 0.05)
                            }
                            //An error ocurred when writing
                            writeResult = self.outputStream!.write((data! as NSData).bytes.bindMemory(to: UInt8.self, capacity: data!.count)+bytesWritten, maxLength: data!.count-bytesWritten)
                            if ( writeResult == -1 ) {
                                NSLog("error code here"); }
                            else {
                                bytesWritten = bytesWritten + writeResult;
                            }
                        }
                    }
                }
            })
        }
    }
    
    final func send(_ message:String){
        print("Send" , message)
        if message != "PINGS"{
            startLoadTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(showLoadingView), userInfo: nil, repeats: false)
        }
        _messagesQueue.append(message)
        if (self.outputStream != nil){
            writeToStream()
        }
    }
    
    @objc func showLoadingView(){
        startLoadTimer.invalidate()
        if showLoading{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SHOWLOADINGPAGE"), object: nil)
            stopLoadTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideLoadingView), userInfo: nil, repeats: false)
        }
    }
    
    @objc func hideLoadingView(){
        stopLoadTimer.invalidate()
        showLoading = false
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HIDELOADINGPAGE"), object: nil)
    }
}

