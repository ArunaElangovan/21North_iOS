//
//  ProfileViewController.swift
//  21North
//
//  Created by Sachin Tomar on 05/08/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit
import PureLayout

@objc protocol ProfileVCDelegate{
    func dismissOTPVerificationScreen()
}

class ProfileViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, SocketManagerDelegate, AddVehicleNoVCDelegate {
    
    
    let shapes = Shapes()
    let drawservicing = DrawServicing()
    let style = Style()
    var loadingPage = UIView()
    
    var scrollView  = UIScrollView.newAutoLayout()
    var contentView = UIView.newAutoLayout()
    
    var dismissOtpDelegate: ProfileVCDelegate?
    
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    var superViewWidth: CGFloat!
    var superViewHeight: CGFloat!
    
    let profileImageView = UIImageView()
    let nameTextField = UITextFieldWithPadding()
    let emailTextField = UITextFieldWithPadding()
    let phNoTextField = UITextFieldWithPadding()
    
    let addVehicleNoVC = AddVehicleNoViewController()
    
    let imagePicker = UIImagePickerController()
    
    var populate: Bool!
    var isNewUser = false
    var shouldLoadPhoto = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let _ = populate{
            populateProfileScreen()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if DataCreator.sharedInstance.signupResponse.userId == "-1"{
            isNewUser = true
        }
        
        setupUI()
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(networkStatus), name: NSNotification.Name(rawValue: "NetworkStatus"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: UI setup
    func setupUI(){
        DataCreator.sharedInstance.currentScreen = "ProfileScreen"
        
        appdelegate.conn.delegate = self
        
        //        loadProfileImage()
        
        superViewWidth = UIScreen.main.bounds.width
        superViewHeight = UIScreen.main.bounds.height
        
        view.backgroundColor = UIColor.white
        
        let cross = shapes.drawShapes(type: "cross")
        let closeButtonItem = NavigationItemModel(title: nil, image: cross, highlitedImage: nil, action: #selector(cancelButtonClicked), type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        let saveButtonItem = NavigationItemModel(title: "SAVE", image: nil, highlitedImage: nil, action: #selector(saveButtonClicked), type: NavigationItemType.titleOnly)
        titleFont = UIFont(name: "HelveticaNeue-bold", size:14)!
        titleColor = drawservicing.lineColor
        setRightButtonItems(saveButtonItem)
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.autoPinEdgesToSuperviewEdges(with: (UIEdgeInsetsMake(navigationHeight, 0.0, 0.0, 0.0)))
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.autoPinEdgesToSuperviewEdges()
        contentView.autoMatch(.width, to: .width, of: view)
        contentView.isUserInteractionEnabled = true
        
        contentView.addSubview(profileImageView)
        profileImageView.autoSetDimension(.width, toSize: 82.0)
        profileImageView.autoSetDimension(.height, toSize: 82.0)
        profileImageView.autoPinEdge(toSuperviewEdge: .top, withInset: navigationHeight)
        profileImageView.autoAlignAxis(.vertical, toSameAxisOf: self.view, withOffset: 0.0)
        profileImageView.layer.cornerRadius = 41
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = UIColor.gray
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        //        profileImageView.image = Helper.loadImageFromPath()
        profileImageView.isUserInteractionEnabled = true
        let tapOnProfileImage = UITapGestureRecognizer(target: self, action: #selector(showAlertForImage))
        profileImageView.addGestureRecognizer(tapOnProfileImage)
        
        let editLabel = UILabel()
        contentView.addSubview(editLabel)
        editLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 30.0)
        editLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 30.0)
        editLabel.autoPinEdge(.top, to: .bottom, of: profileImageView, withOffset: 10.0)
        editLabel.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        editLabel.text = NSLocalizedString("Edit", comment: "")
        editLabel.translatesAutoresizingMaskIntoConstraints = false
        editLabel.font = style.editCarTextFieldFont
        editLabel.textColor = style.labelFontColor
        editLabel.isUserInteractionEnabled = true
        let tapOnProfileImage1 = UITapGestureRecognizer(target: self, action: #selector(showAlertForImage))
        editLabel.addGestureRecognizer(tapOnProfileImage1)
        editLabel.textAlignment = .center
        
        contentView.addSubview(nameTextField)
        nameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        nameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        nameTextField.autoPinEdge(.top, to: .bottom, of: editLabel, withOffset: 20.0)
        nameTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        let borderColor = style.borderColor
        let textFieldTextColor = style.labelFontColor
        nameTextField.layer.borderWidth = 1.0
        nameTextField.backgroundColor = UIColor.white
        nameTextField.textColor = textFieldTextColor
        nameTextField.font = style.editCarTextFieldFont
        nameTextField.layer.borderColor = borderColor
        nameTextField.returnKeyType = .done
        nameTextField.placeholder = "Name"
        nameTextField.delegate = self
        
        contentView.addSubview(emailTextField)
        emailTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        emailTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        emailTextField.autoPinEdge(.top, to: .bottom, of: nameTextField, withOffset: 20.0)
        emailTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        emailTextField.layer.borderWidth = 1.0
        emailTextField.backgroundColor = UIColor.white
        emailTextField.textColor = textFieldTextColor
        emailTextField.font = style.editCarTextFieldFont
        emailTextField.layer.borderColor = borderColor
        emailTextField.placeholder = "Email"
        emailTextField.returnKeyType = .done
        emailTextField.delegate = self
        emailTextField.layer.borderColor = borderColor
        
        contentView.addSubview(phNoTextField)
        phNoTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: 20.0)
        phNoTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20.0)
        phNoTextField.autoPinEdge(.top, to: .bottom, of: emailTextField, withOffset: 20.0)
        phNoTextField.autoSetDimension(.height, toSize: 20.0, relation: .greaterThanOrEqual)
        phNoTextField.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -20)
        phNoTextField.layer.borderWidth = 1.0
        phNoTextField.backgroundColor = UIColor.white
        phNoTextField.textColor = textFieldTextColor
        phNoTextField.font = style.editCarTextFieldFont
        phNoTextField.layer.borderColor = borderColor
        if isNewUser{
            phNoTextField.placeholder = "Referral code (Optional)"
        }
        else{
            phNoTextField.keyboardType = .numberPad
            phNoTextField.text = UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber) as? String
        }
        phNoTextField.layer.borderColor = borderColor
        phNoTextField.delegate = self
        
        addDoneButtonOnKeyboard()
        
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        contentView.addGestureRecognizer(tapOnView)
    }
    
    //MARK: Data handling OTPVerification delegate
    var userNo:String!
    func populateProfileScreen() {
        nameTextField.text = DataCreator.sharedInstance.userData.firstName
        emailTextField.text = DataCreator.sharedInstance.userData.email
        if shouldLoadPhoto{
            profileImageView.image = Helper.loadImageFromPath()
        }
    }
    
    //MARK: Textfield delegate methods and keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyBoard()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField == nameTextField){
            var characterSet = CharacterSet.letters // CharacterSet.whitespaces
            characterSet.insert(" ")
            if string.rangeOfCharacter(from: characterSet.inverted) != nil {
                return false
            }
        }
        return true
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: superViewWidth, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(hideKeyBoard))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.phNoTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func hideKeyBoard(){
        view.endEditing(true)
    }
    
    //MARK: Image handling
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!) {
        profileImageView.image = image
        shouldLoadPhoto = false
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func showAlertForImage() {
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        let alertController = UIAlertController(title: "21North", message: NSLocalizedString("What do you want to do?", comment: ""), preferredStyle: .actionSheet)
        
        let takePhotoAction = UIAlertAction(title: NSLocalizedString("Take Photo", comment: ""), style: .default, handler: {
            action in
            self.openCamera()
        }
        )
        alertController.addAction(takePhotoAction)
        
        let choosePhotoAction = UIAlertAction(title: NSLocalizedString("Choose Photo", comment: ""), style: .default, handler: {
            action in
            self.openGallary()
        }
        )
        alertController.addAction(choosePhotoAction)
        
        let defaultAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            Helper.topMostController().present(imagePicker, animated: true, completion: nil)
        }
    }
    func openGallary(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = false
            Helper.topMostController().present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //    func loadImageFromPath(_ path: String) -> UIImage? {
    //
    //        let image = UIImage(contentsOfFile: path)
    //
    //        if image == nil {
    //        }
    //        return image
    //    }
    //    func loadProfileImage(){
    //        let imagePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc") as String//fileInDocumentsDirectory(fileName)
    //        if let loadedImage = loadImageFromPath(imagePath + "/profileImage.jpg") {
    //            profileImageView.image = loadedImage
    //        } else {
    //        }
    //    }
    
    //MARK: Data validation
    func isValidName(name: String) -> Bool {
        if((name.count) > 2){
            return true
        }
        return false
    }
    
    func isValidPhoneNumber() -> Bool {
        if(phNoTextField.text!.count == 10) || isNewUser{
            return true
        }
        return false
    }
    
    func isValidEmail() -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailTextField.text)
    }
    
    func showAlert(dataToShow: String){
        let alert = UIAlertController(title: "21North", message: dataToShow, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        Helper.topMostController().present(alert, animated: true, completion: nil)
    }
    
    var otp:Int!
    var countTimer:Timer?
    
    //MARK: Action handling
    @objc func cancelButtonClicked(){
        //        passData.clickTrack(dataString: "59")
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            //            let generator = UINotificationFeedbackGenerator()
            //            generator.notificationOccurred(.success)
            //            let generator = UISelectionFeedbackGenerator()
            //            generator.selectionChanged()
        } else {
            // Fallback on earlier versions
        }
        
        hideKeyBoard()
        shouldLoadPhoto = true
        //        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    var resendNoTimer = Timer()
    var resendCheck = 0
    
    @objc func saveButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        if(profileImageView.image != nil){
            let imageData = UIImageJPEGRepresentation(profileImageView.image!, 1)
            let compressedJPGImage = UIImage(data: imageData!)
            
            let fileManager = FileManager.default
            let paths =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc") as String
            
            if !fileManager.fileExists(atPath: paths){
                do {
                    try FileManager.default.createDirectory(atPath: paths, withIntermediateDirectories: false, attributes: nil)
                } catch let error as NSError {
                    print(error.localizedDescription);
                }
            }
            var result = Bool()
            DispatchQueue.main.async {
                let jpgImageData = UIImageJPEGRepresentation(compressedJPGImage!, 1.0)   // if you want to save as JPEG
                result = (try? jpgImageData!.write(to: URL(fileURLWithPath: (paths)+"/profileImage.jpg"), options: [.atomic])) != nil
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "photoTaken"), object: nil)
                
                let connn = SocketForDoc()
                connn.open(DataCreator.sharedInstance.connserver, port: 7410)
            }
            if(result == true){
                self.dismiss(animated: true, completion: nil)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Profile"), object: nil)
                
                
            }
        }
        
        if isValidName(name: nameTextField.text!) {
            if(isValidPhoneNumber()){
                if(isValidEmail()){
                    if isNewUser{
                        if (phNoTextField.text?.isEmpty)!{
                            appdelegate.conn.send("\(Constants.RequestStates.AddUser)|\(DataCreator.sharedInstance.mobileNumber)|\(nameTextField.text!)|\(emailTextField.text!)|\(DataCreator.sharedInstance.latitude)|\(DataCreator.sharedInstance.longitude)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.deviceId)!)|\(UIDevice.current.systemName)|\(UIDevice.current.systemVersion)|\(UIDevice.current.model)| |")
                        }
                        else{
                            appdelegate.conn.send("\(Constants.RequestStates.AddUser)|\(DataCreator.sharedInstance.mobileNumber)|\(nameTextField.text!)|\(emailTextField.text!)|\(DataCreator.sharedInstance.latitude)|\(DataCreator.sharedInstance.longitude)|\(UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.deviceId)!)|\(UIDevice.current.systemName)|\(UIDevice.current.systemVersion)|\(UIDevice.current.model)|\(phNoTextField.text!)|")
                        }
                        
                        isNewUser = false
                    }
                    else{
                        if phNoTextField.text! == String(describing: UserDefaults.standard.object(forKey: Constants.UserDefaultKeys.MobileNumber)!){
                            appdelegate.conn.send("\(Constants.RequestStates.UpdateUser)|\(nameTextField.text!)|\(emailTextField.text!)|0|")
                        }
                        else {
                            DataCreator.sharedInstance.mobileNumber = phNoTextField.text!
                            UserDefaults.standard.set(phNoTextField.text!, forKey: Constants.UserDefaultKeys.MobileNumber)
                            appdelegate.conn.send("\(Constants.RequestStates.GenerateOtp)|\(phNoTextField.text!)|")
                        }
                    }
                }
                else{
                    showAlert(dataToShow: "Please Enter Valid Email")
                }
            }
            else{
                showAlert(dataToShow: "Mobile Number Should Have 10 Digits")
            }
        }
        else {
            showAlert(dataToShow: "Name should have 3 characters")
        }
    }
    
    //MARK: Delegate methods
    //Socket delegate
    func validateNumber(){
        let otpVerificationVC = OTPVerificationViewController()
        otpVerificationVC.triggeredFrom = "ChangeNumber"
        otpVerificationVC.userName = nameTextField.text!
        otpVerificationVC.email = emailTextField.text!
        Helper.topMostController().present(otpVerificationVC, animated: true, completion: nil)
        
    }
    
    func presentAddVehicleNoVC(){
        addVehicleNoVC.addVehicleNoVCDelegate = self
        Helper.topMostController().present(addVehicleNoVC, animated: true, completion: nil)
    }
    
    func dismissProfileVC(){
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
        //        self.dismiss(animated: true, completion: nil)
        //        dismissOtpDelegate?.dismissOTPVerificationScreen()
    }
    func dismissProfileFromAddVehicle(){
        view.endEditing(true)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        //        self.dismiss(animated: true, completion: nil)
        //        dismissOtpDelegate?.dismissOTPVerificationScreen()
    }
}

