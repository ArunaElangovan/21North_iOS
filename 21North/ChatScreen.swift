//
//  ChatScreen.swift
//  21North
//
//  Created by Sachin Tomar on 01/08/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit

class ChatScreen: BaseViewController, UITextFieldDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, SocketManagerDelegate8 {
    var screen = UIScreen.main.bounds
    var width: CGFloat?
    var height: CGFloat?
    var str: String!
    var chatBox = UITextField()
    var chatView = UIView()
    let shapes = Shapes()
    var chatArray = [[String]]()
    var chatTableHt: CGFloat!
    var metric = Dictionary<String, CGFloat>()
    var chatViewVerConst: NSArray!
    var viewDictionary = Dictionary<String, UIView>()
    var mainView = UIView()
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    var collectionView: UICollectionView!
    var messageArray: [ChatData]!
    var dictionary = Dictionary<String, UIView>()
    let style = Style()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate?.conn.delegate8 = self
        
        width = screen.width
        height = screen.height
        chatTableHt = CGFloat(chatArray.count) * 40
        
        let drawservicing = DrawServicing()
        
        view.backgroundColor = style.serviceViewColor
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap1)
        
        chatView = drawservicing.addView(2)
        chatView.backgroundColor = UIColor.white
        chatView.translatesAutoresizingMaskIntoConstraints = true
        chatView.frame = CGRect(x: 0, y: 60, width: width!, height: height!-60)
        view.addSubview(chatView)
        messageArray = [ChatData]()
        messageArray.append(contentsOf: DataCreator.sharedInstance.chatArray)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width-20, height: 120)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: width!, height: height!-109), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RDCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.lightGray.cgColor
        chatView.addSubview(collectionView)
        
        let backButton = shapes.drawShapes(type: "blackBackButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        pageTitle = "Service advisor"
        titleFont = style.titleFont!
        titleColor = UIColor.black
        
        chatBox.frame = CGRect(x: 7, y: height!-38, width: width!-14, height: 28)
        chatBox.isUserInteractionEnabled = true
        chatBox.layer.borderWidth = 1.0
        chatBox.layer.borderColor = style.chatBoxBorderColor.cgColor
        chatBox.layer.cornerRadius = 11
        chatBox.backgroundColor = style.chatBoxColor
        chatBox.allowsEditingTextAttributes = true
        chatBox.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 30)
        chatBox.delegate = self
        chatBox.font = chatBox.font?.withSize(18)
        chatBox.returnKeyType = .send
        view.addSubview(chatBox)
        
        const()
        
        NotificationCenter.default.addObserver(self, selector: #selector(networkStatus), name: NSNotification.Name(rawValue: "NetworkStatus"), object: nil)
    }
    
    func const(){
        viewDictionary = ["chatBox": chatBox, "chatView": chatView, "collectionView": collectionView]
        let chatTextViewHorConst: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[chatView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDictionary) as NSArray
        view.addConstraints(chatTextViewHorConst as! [NSLayoutConstraint])
        let chatBoxHorConst: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|-7-[chatBox]-7-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDictionary) as NSArray
        view.addConstraints(chatBoxHorConst as! [NSLayoutConstraint])
        let chatBoxVerConst: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|[chatView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDictionary) as NSArray
        view.addConstraints(chatBoxVerConst as! [NSLayoutConstraint])
        let verConstForChatBox: NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:[chatBox(28)]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDictionary) as NSArray
        view.addConstraints(verConstForChatBox as! [NSLayoutConstraint])
        
        if((messageArray.count) != 0){
            let item = messageArray!.count - 1
            let insertionIndexPath = IndexPath(item: item, section: 0)
            collectionView.scrollToItem(at: insertionIndexPath, at: .bottom, animated: true)
        }
    }
    
    //MARK: Textfield delegate and keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        sendButtonClicked()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //        moveTextField(textField, moveDistance: -100, up: true)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        //        moveTextField(textField, moveDistance: -100, up: false)
    }
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        //        let moveDuration = 0.3
        //        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        //        UIView.beginAnimations("animateChatView", context: nil)
        //        UIView.setAnimationBeginsFromCurrentState(true)
        //        UIView.setAnimationDuration(moveDuration)
        //        textField.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        //        UIView.commitAnimations()
    }
    //    var keyCheck = 0
    //    var keyboardHeight: CGFloat!
    //    func check(_ notification: Notification){
    //        if(keyCheck == 0){
    //            if let userInfo = (notification as NSNotification).userInfo {
    //                let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
    //                keyboardHeight = keyboardSize!.height
    //            }
    //            if(keyboardHeight > 0){
    //                animateViewMoving(true, moveValue: keyboardHeight)
    //            }
    //            keyCheck = 1
    //        }
    //    }
    //
    //    func keyboardHide(){
    //        if(keyboardHeight != nil){
    //            animateViewMoving(false, moveValue: keyboardHeight)
    //            keyCheck = 0
    //        }
    //    }
    
    
    
    
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
    
    //    func animateViewMoving (_ up:Bool, moveValue :CGFloat){
    //        print(estHt)
    //        print(height!)
    //        let move1 = (estHt+moveValue-height!)
    //        let movementDuration:TimeInterval = 0.3
    //        let movement:CGFloat = ( up ? -move1 : move1)
    //        let movementForChatBox = (up ? -moveValue : moveValue)
    //        UIView.beginAnimations( "animateView", context: nil)
    //        UIView.setAnimationBeginsFromCurrentState(true)
    //        UIView.setAnimationDuration(movementDuration )
    //        if(estHt>height!){
    //            self.chatView.frame = self.chatView.frame.offsetBy(dx: 0,  dy: movementForChatBox)
    //        }
    //        else if(estHt+keyboardHeight > height!){
    //            self.chatView.frame = self.chatView.frame.offsetBy(dx: 0,  dy: movement)
    //        }
    //
    //        self.chatBox.frame = self.chatBox.frame.offsetBy(dx: 0, dy: movementForChatBox)
    //        UIView.commitAnimations()
    //    }
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    var x:CGFloat = 40
    
    //MARDK: Action handling
    func sendButtonClicked(){
        do{
            let message = try ChatData(incoming: "1", chatString: chatBox.text!)
            messageArray.append(message)
        }
        catch{}
        estHt = 0
        collectionView.reloadData()
        let item = messageArray!.count - 1
        let insertionIndexPath = IndexPath(item: item, section: 0)
        appDelegate?.conn.send("\(Constants.RequestStates.PostChat)|\(DataCreator.sharedInstance.currentBookingId)|\(chatBox.text!)|")
        
        chatBox.text = ""
        x += 40
        collectionView.scrollToItem(at: insertionIndexPath, at: .bottom, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if((messageArray) != nil){
            return messageArray.count
        }
        return 0
    }
    func refreshChat(message: String){
        do{
            let message = try ChatData(incoming: "0", chatString: message)
            messageArray.append(message)
        }
        catch{}
        
        estHt = 0
        collectionView.reloadData()
        let item = messageArray!.count - 1
        let insertionIndexPath = IndexPath(item: item, section: 0)
        collectionView.scrollToItem(at: insertionIndexPath, at: .bottom, animated: true)
    }
    var estHt = CGFloat()
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RDCell
        
        if !messageArray[(indexPath as NSIndexPath).item].chat.isEmpty{
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: messageArray[(indexPath as NSIndexPath).item].chat).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)], context: nil)
            cell.messageTextView.text = messageArray[(indexPath as NSIndexPath).item].chat
            if(messageArray[(indexPath as NSIndexPath).item].isincoming == "0"){
                
                cell.messageTextView.frame = CGRect(x: 8+6, y: 0, width: estimatedFrame.width+16, height: estimatedFrame.height+20)
                cell.messageTextView.textColor = UIColor.black
                cell.bubbleView.frame = CGRect(x: 0, y: 0, width: estimatedFrame.width+24+6, height: estimatedFrame.height+20)
                cell.imageView.image = UIImage(named: "bubble_gray")?.resizableImage(withCapInsets: UIEdgeInsets(top: 22, left: 26, bottom: 22, right: 26)).withRenderingMode(.alwaysTemplate)
                cell.imageView.tintColor = UIColor(white: 0.95, alpha: 1)
                estHt = estHt + estimatedFrame.height+20
            }
            else{
                cell.messageTextView.textColor = UIColor.white
                cell.messageTextView.frame = CGRect(x: view.frame.width-20-estimatedFrame.width-8, y: 5, width: estimatedFrame.width+16, height: estimatedFrame.height+20)
                cell.bubbleView.frame = CGRect(x: view.frame.width - 20 - estimatedFrame.width-12, y: 0, width: estimatedFrame.width+24, height: estimatedFrame.height+24)
                cell.imageView.image = UIImage(named: "bubble_blue")?.resizableImage(withCapInsets: UIEdgeInsets(top: 22, left: 26, bottom: 22, right: 26)).withRenderingMode(.alwaysTemplate)
                cell.imageView.tintColor = style.systemFontColor//UIColor(red: 0, green: 137/255, blue: 249/255, alpha: 1)
                estHt = estHt + estimatedFrame.height+24
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if !messageArray[(indexPath as NSIndexPath).item].chat.isEmpty {
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: messageArray[(indexPath as NSIndexPath).item].chat).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)], context: nil)
            
            return CGSize(width: view.frame.width-20, height: estimatedFrame.height+20)
        }
        
        return CGSize(width: view.frame.width-20, height: 100)
    }
}

class RDCell: UICollectionViewCell{
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    let bubbleView: UIView = {
        let bubbleView = UIView()
        bubbleView.layer.cornerRadius = 15
        bubbleView.layer.masksToBounds = true
        return bubbleView
    }()
    
    let messageTextView: UITextView = {
        let messageTextView = UITextView()
        messageTextView.translatesAutoresizingMaskIntoConstraints = true
        messageTextView.backgroundColor = UIColor(white: 0, alpha: 0)
        messageTextView.font = UIFont.systemFont(ofSize: 18)
        messageTextView.isEditable = false
        return messageTextView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor(white: 0.90, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupView(){
        
        
        addSubview(bubbleView)
        bubbleView.addSubview(imageView)
        addSubview(messageTextView)
        let dictionary = ["imageView": imageView]
        
        let h:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictionary) as NSArray
        bubbleView.addConstraints(h as! [NSLayoutConstraint])
        
        let v:NSArray = NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictionary) as NSArray
        bubbleView.addConstraints(v as! [NSLayoutConstraint])
    }
    
}

