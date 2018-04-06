//
//  AppDelegate.swift
//  21North
//
//  Created by Sachin Tomar on 21/05/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import UserNotifications
import SwiftyJSON
import UserNotifications
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var pin: String!
    
    var connserver = "202.56.203.38"
    //202.56.203.38
    //202.56.203.44
    var connport:Int = 7420 //7407
    //7420
    //7412
    var databasePath = NSString()
    
    var fileExist = 0
    var connected = 0
    var reconnect = 0
    var login = 0
    var mobilenumbersend = 0
    var myTimer:Timer!
    var locTimer:Timer!
    var pingTimer: Timer!
    var pingReplyTimer:Timer!
    let reachability = Reachability()!
    var mobilenumber: String!
    var returnData = 0
    var checkUp: String!
    
    var clikckedOn = 0
    var vehicleArray = [[String]]()
    var loginstring:String!
    var reconnectCheck = 0
    var loginTryTimer: Timer!
    var version = "ios Client v0.001"
    var screenNo = 0
    var screenLabel = String()
    var slotType = 1
    var bookingID = "0"
    var bookedCars = [[String]]()
    var googleApiKey = "AIzaSyD2--igrkqS8F6XgIxHOHCw8JWL6atRMXQ"
    var refreshData = [String]()
    var complainArray = [[String]]()
    var complainCat = [String]()
    var complainsFromUser = [String]()
    var bookingData = [[String]]()
    var check = 1
    var reachCount = 0
    var currentScreenNo = 0
    
    var conn = Socket()
    var window: UIWindow?
    var tokenString = "1"
    var token = "0"
    let style = Style()
    
    //MARK: AppDelegate Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.sharedManager().enable = true
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        registerForPushNotifications(application: application)
        
        //        let mobileDictionary = ["NetworkStatus" : "trying to connect", "check": "1"]
        //        NotificationCenter.default.post(name: Notification.Name(rawValue: "NetworkStatus"), object: nil, userInfo: mobileDictionary)
        conn.open(DataCreator.sharedInstance.connserver, port: DataCreator.sharedInstance.connport)
        
        GMSServices.provideAPIKey(DataCreator.sharedInstance.googleApiKey)
        GMSPlacesClient.provideAPIKey(DataCreator.sharedInstance.googleApiKey)
        
        //        UserDefaults.standard.set("9151000333", forKey: Constants.UserDefaultKeys.MobileNumber)
        
        //        if let _ = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber){
        //            conn.send("\(Constants.RequestStates.Login)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber)!)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.deviceId)!)|")
        //
        //        }
        
        viewCtrl()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveResponse(_:)), name:NSNotification.Name(rawValue: "mobilenumber"), object: nil)
        application.isStatusBarHidden = true
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        conn.close()
        DataCreator.sharedInstance.login = 0
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        //        DataCreator.sharedInstance.reconnectCheck = 1
        //        conn.retryServer(pingTimer)
        conn.open(DataCreator.sharedInstance.connserver, port: DataCreator.sharedInstance.connport)
        
        if(CLLocationManager.locationServicesEnabled() && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.denied){
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "dismiss"), object: nil)
        }
        else{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SHOWLOCATION"), object: nil, userInfo: nil)
        }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {}
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        token = String(format: "%@", deviceToken as CVarArg)
        token = token.replacingOccurrences(of: "<", with: "")
        token = token.replacingOccurrences(of: ">", with: "")
        token = token.replacingOccurrences(of: " ", with: "")
        
        print("Device Token:", "UPDATENOTIFICATIONID|" + token + "|")
        if(!DataCreator.sharedInstance.deviceId.isEmpty && DataCreator.sharedInstance.returnData > 1){
            conn.send("UPDATENOTIFICATIONID|" + DataCreator.sharedInstance.deviceId + "|" + token + "|")
        }
        else{
            print("UPDATENOTIFICATIONID|" + UIDevice.current.identifierForVendor!.uuidString + "|" + token + "|")
        }
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register:", error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        _ = userInfo["aps"] as! [String: AnyObject]
    }
    
    //MARK: Register for Notification
    @available(iOS 10.0, *)
    private func userNotificationCenter(center: UNUserNotificationCenter, willPresentNotification notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        //Handle the notification
    }
    
    @available(iOS 10.0, *)
    private func userNotificationCenter(center: UNUserNotificationCenter, didReceiveNotificationResponse response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
        //Handle the notification
    }
    
    func registerForPushNotifications(application: UIApplication) {
        if #available(iOS 10.0, *){
            UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {(granted,error) in
                if granted{
                    DispatchQueue.main.async {
                        application.registerForRemoteNotifications()
                        print("Permission granted for push notification: \(granted)")
                    }
                }
                self.getNotificationSettings()
            })
        }
            
        else{
            let type: UIUserNotificationType = [UIUserNotificationType.badge, UIUserNotificationType.alert, UIUserNotificationType.sound];
            let setting = UIUserNotificationSettings(types: type, categories: nil);
            UIApplication.shared.registerUserNotificationSettings(setting);
            UIApplication.shared.registerForRemoteNotifications();
        }
    }
    
    func getNotificationSettings() {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                print("Notification settings: \(settings)")
                guard settings.authorizationStatus == .authorized else { return }
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    //MARK: Extra methods
    func removeImage(itemName:String, fileExtension: String) {
        let fileManager = FileManager.default
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("config") as String
        do {
            try fileManager.removeItem(atPath: paths)
            viewCtrl()
        } catch let error as NSError {
            print(error.debugDescription)
        }
        let path1 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        do {
            try fileManager.removeItem(atPath: path1)
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    @objc func didReceiveResponse(_ notification: Notification){
        DataCreator.sharedInstance.mobilenumber = (notification as NSNotification).userInfo!["mobilenumber"] as! String
        if DataCreator.sharedInstance.mobilenumber != nil{
            print("Recieved data : ", (notification as NSNotification).userInfo!["mobilenumber"]!)
        }
        conn.send(DataCreator.sharedInstance.mobilenumber);
    }
    
    func viewCtrl(){
        let mainViewController = ViewController(nibName:"MainViewController",bundle:nil)
        let leftViewController = LeftViewController(nibName:"LeftViewController",bundle:nil)
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        leftViewController.mainViewController = nvc
        nvc.isNavigationBarHidden = true
        
        let rightViewController = RightViewController(nibName:"RightViewController",bundle:nil)
        
        let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController, rightMenuViewController:rightViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = mainViewController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.black
        self.window?.rootViewController = slideMenuController
        self.window?.makeKeyAndVisible()
        //        let fileManager = FileManager.default
        //        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("config") as String
        
        //            mainViewController.hideLoadingPage()
        
        //        if fileManager.fileExists(atPath: dir as String){
        //            DataCreator.sharedInstance.returnData = 1
        //            NotificationCenter.default.post(name: Notification.Name(rawValue: "CARANDSERVICES"), object: nil)
        //            let dictionary = ["fileExists": "0"]
        //            NotificationCenter.default.post(name: Notification.Name(rawValue: "fileExists"), object: nil, userInfo: dictionary)
        //        }
        //        else{
        //            mainViewController.hideLoadingPage()
        //            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HIDELOADINGPAGE"), object: nil)
        //        }
    }
}

