//
//  Camera.swift
//  21North
//
//  Created by Sachin Tomar on 23/10/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation
import MobileCoreServices

protocol CameraDelegate {
    func updateData(_ data: String)
}

class Camera: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate, UIDocumentMenuDelegate,UIDocumentPickerDelegate{
    
    var width: CGFloat!
    var height: CGFloat!
    
    let style = Style()
    let shapes = Shapes()
    var triggeredFrom: String!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    var imagePicked = UIImageView()
    var fileName = ""
    var imageName: String!
    var delegate1: CameraDelegate?
    
    func fileNameFunc(_ notification: Notification){
        fileName = (notification as NSNotification).userInfo!["file"] as! String
        let imagePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc") as String//fileInDocumentsDirectory(fileName)
        if let loadedImage = loadImageFromPath(imagePath + "/" + fileName + ".jpg") {
            imagePicked.image = loadedImage
            print(" Loaded Image: \(loadedImage)")
        } else {
            print("some error message 2")
        }
    }
    let scrollViewForImage = UIScrollView()
    var verConst = NSArray()
    var horConst = NSArray()
    var dictionary = Dictionary<String, UIView>()
    var imageScrollView = ImageScrollView()
    var saveButton = UIButton()
    var imagePath = ""
    var pdfPath: NSURL!
    var pdfImg: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        
        view.backgroundColor = UIColor.white
        
        let topView = UIView()
        topView.frame = CGRect(x: 0, y: 0, width: width!, height: 60)
        topView.backgroundColor = style.chatBoxColor
        view.addSubview(topView)
        
        imageScrollView.frame = CGRect(x: 0, y: 60, width: width, height: height)
        view.addSubview(imageScrollView)
        
        dictionary = ["imagePicked": imagePicked]
        
        imagePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc") as String
        if triggeredFrom == "DL"{
            imagePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc/DL") as String
            pdfPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("21Doc/DL/\(fileName).pdf") as NSURL
        }
        else if triggeredFrom == "Documents"{
            imagePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc/\(DataCreator.sharedInstance.selectedVehicleNumber)") as String
            pdfPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("21Doc/\(DataCreator.sharedInstance.selectedVehicleNumber)/\(fileName).pdf") as NSURL
        }
        
        if #available(iOS 10.0, *) {
            pdfImg = drawPDFfromURL(url: pdfPath as URL)
        } else {
            // Fallback on earlier versions
        }
        
        if let loadedImage = loadImageFromPath(imagePath + "/" + fileName + ".jpg") {
            imageScrollView.display(image: loadedImage)
            print(" Loaded Image: \(loadedImage)")
        }
        else if let loadedPdf = loadPdfFromPath(pdfPath as URL){
            imageScrollView.display(image: pdfImg!)
            print(" Loaded Image: \(loadedPdf)")
        }
        else {
            print("some error message 2")
        }
        
        let backButtonImage = shapes.drawShapes(view, type: "mapBack")
        backButtonImage.translatesAutoresizingMaskIntoConstraints = true
        backButtonImage.frame = CGRect(x: 6, y: 30, width: 25, height: 25)
        view.addSubview(backButtonImage)
        
        let openCameraButton = UIButton(frame: CGRect(x: 0, y: 28, width: 100, height: 23))
        openCameraButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        openCameraButton.setTitleColor(style.systemFontColor, for: .normal)
        openCameraButton.setTitle("Back", for: UIControlState())
        openCameraButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20)
        topView.addSubview(openCameraButton)
        
        saveButton = UIButton(frame: CGRect(x: width!-100, y: 28, width: 100, height: 23))
        saveButton.setTitleColor(style.systemFontColor, for: .normal)
        saveButton.setTitle("Change", for: UIControlState())
        saveButton.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0)
        saveButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        topView.addSubview(saveButton)
        
    }
    
    @available(iOS 10.0, *)
    func drawPDFfromURL(url: URL) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }
        
        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)
            
            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
            
            ctx.cgContext.drawPDFPage(page)
        }
        
        return img
    }
    
    var zoomCheck = 0
    func zoomInOut(){
        if(zoomCheck == 0){
            scrollViewForImage.removeConstraints(horConst as! [NSLayoutConstraint])
            scrollViewForImage.removeConstraints(verConst as! [NSLayoutConstraint])
            horConst = NSLayoutConstraint.constraints(withVisualFormat: "H:|[imagePicked(\(width!))]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictionary) as NSArray
            scrollViewForImage.addConstraints(horConst as! [NSLayoutConstraint])
            verConst = NSLayoutConstraint.constraints(withVisualFormat: "V:|[imagePicked(\(height!))]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictionary) as NSArray
            scrollViewForImage.addConstraints(verConst as! [NSLayoutConstraint])
            zoomCheck = 1
        }
        else{
            scrollViewForImage.removeConstraints(horConst as! [NSLayoutConstraint])
            scrollViewForImage.removeConstraints(verConst as! [NSLayoutConstraint])
            horConst = NSLayoutConstraint.constraints(withVisualFormat: "H:|[imagePicked(\(1.5*width!))]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictionary) as NSArray
            scrollViewForImage.addConstraints(horConst as! [NSLayoutConstraint])
            verConst = NSLayoutConstraint.constraints(withVisualFormat: "V:|[imagePicked(\(1.5*height!))]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dictionary) as NSArray
            scrollViewForImage.addConstraints(verConst as! [NSLayoutConstraint])
            zoomCheck = 0
        }
    }
    
    //    @objc func showAlert() {
    //        if(saveCount == 0){
    //        let alertController = UIAlertController(title: "21North", message: "What do you want to do?", preferredStyle: .actionSheet)
    //
    //        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: {
    //            action in
    //            self.openCamera()
    //            }
    //        )
    //        alertController.addAction(takePhotoAction)
    //
    //        let choosePhotoAction = UIAlertAction(title: "Choose Photo", style: .default, handler: {
    //            action in
    //            self.openGallary()
    //            }
    //        )
    //        alertController.addAction(choosePhotoAction)
    //
    //        let defaultAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
    //        alertController.addAction(defaultAction)
    //        present(alertController, animated: true, completion: nil)
    //        }
    //        else{
    //            let alert = UIAlertController(title: "Replace Existing Image", message: "Would you like to continue?", preferredStyle: UIAlertControllerStyle.alert)
    //
    //            // add the actions (buttons)
    //            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in
    //                self.saveButt()
    //            }))
    //            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
    //
    //            // show the alert
    //            Helper.topMostController().present(alert, animated: true, completion: nil)
    //        }
    //    }
    
    @objc func showAlert() {
        if(saveCount == 0){
            let importMenu = UIDocumentMenuViewController(documentTypes: [String(kUTTypePDF)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            importMenu.addOption(withTitle: NSLocalizedString("Take Photo", comment: ""), image: nil, order: .first, handler: { self.openCamera() })
            importMenu.addOption(withTitle: NSLocalizedString("Choose Photo", comment: ""), image: nil, order: .first, handler: { self.openGallery()})
            importMenu.addOption(withTitle: NSLocalizedString("What do you want to do?", comment: ""), image: nil, order: .first, handler: { print("New Doc Requested") })
            //        importMenu.addOption(withTitle: NSLocalizedString("Choose pdf", comment: ""), image: nil, order: .first, handler: { print("New Doc Requested") })
            Helper.topMostController().present(importMenu, animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Replace Existing Image", message: "Would you like to continue?", preferredStyle: UIAlertControllerStyle.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in
                self.saveButt()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
            
            // show the alert
            Helper.topMostController().present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = false
            Helper.topMostController().present(imagePicker, animated: true, completion: nil)
        }
    }
    var saveCount = 0
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!) {
        imagePicked.image = image
        saveButton.setTitle("Save", for: .normal)
        imageScrollView.display(image: image!)
        saveCount = 1
        self.dismiss(animated: true, completion: nil);
    }
    func fileInDocumentsDirectory(_ filename: String) -> String {
        
        let fileURL = getDocumentsURL().appendingPathComponent(filename)
        return fileURL.path
        
    }
    func getDocumentsURL() -> URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsURL
    }
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            Helper.topMostController().present(imagePicker, animated: true, completion: nil)
        }
    }
    func saveButt(){
        if(imagePicked.image != nil){
            let imageData = UIImageJPEGRepresentation(imagePicked.image!, 1)
            let compressedJPGImage = UIImage(data: imageData!)
            
            
            let fileManager = FileManager.default
            var paths =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc") as String
            
            if triggeredFrom == "DL"{
                paths = paths.stringByAppendingPathComponent("/DL")
                pdfPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("21Doc/DL/\(fileName).pdf") as NSURL
            }
            else if triggeredFrom == "Documents"{
                paths = paths.stringByAppendingPathComponent("/\(DataCreator.sharedInstance.selectedVehicleNumber)")
                pdfPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("21Doc/\(DataCreator.sharedInstance.selectedVehicleNumber)/\(fileName).pdf") as NSURL
            }
            
            if !fileManager.fileExists(atPath: paths){
                do {
                    try FileManager.default.createDirectory(atPath: paths, withIntermediateDirectories: false, attributes: nil)
                } catch let error as NSError {
                    print(error.localizedDescription);
                }
            }
            
            DispatchQueue.main.async {
                let jpgImageData = UIImageJPEGRepresentation(compressedJPGImage!, 1.0)   // if you want to save as JPEG
                _ = (try? jpgImageData!.write(to: URL(fileURLWithPath: (paths)+"/\(self.fileName).jpg"), options: [.atomic])) != nil
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "photoTaken"), object: nil)
            }
            
            self.dismiss(animated: true, completion: {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Profile"), object: nil)
                
            })
        }
        else{
            dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func dismissView(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
    func loadImageFromPath(_ path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }
    
    func loadPdfFromPath(_ path: URL) -> UIDocument? {
        let pdf = UIDocument(fileURL: path)
        //        if pdf == nil{
        //            print("missing pdf at: \(path)")
        //        }
        if !FileManager.default.fileExists(atPath: path.path){
            print("missing pdf at: \(path)")
            return nil
        }
        print("Loading pdf from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return pdf
    }
    
    //MARK: pdf related methods
    @available(iOS 8.0, *)
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        let cico = url as URL
        print("The Url is : \(cico)")
        
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        var paths = documentsDirectory.appendingPathComponent("21Doc")
        //            paths.appendPathComponent("DL")
        if triggeredFrom == "DL"{
            paths.appendPathComponent("DL")
        }
        else{
            paths.appendPathComponent("\(DataCreator.sharedInstance.selectedVehicleNumber)")
        }
        
        if !FileManager.default.fileExists(atPath: paths.path){
            do {
                try FileManager.default.createDirectory(atPath: paths.path, withIntermediateDirectories: true, attributes: nil)
            } catch let error as NSError {
                print(error.localizedDescription);
            }
        }
        //        let pdfFileName = url.lastPathComponent
        var imgPath = pdfPath.deletingLastPathComponent?.appendingPathComponent("\(fileName).jpg")
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("21Doc/DL/\(fileName).pdf") as NSURL
        do {
            //                 If file with same name exists remove it (replace file with new one)
            if FileManager.default.fileExists(atPath: pdfPath.path!) {
                try FileManager.default.removeItem(atPath: pdfPath.path!)
            }
            // Move file from app_id-Inbox to tmp/filename
            try FileManager.default.moveItem(atPath: url.path, toPath: pdfPath.path!)
            try FileManager.default.removeItem(atPath: imgPath!.path)
            if #available(iOS 10.0, *) {
                pdfImg = drawPDFfromURL(url: pdfPath as URL)
            } else {
                // Fallback on earlier versions
            }
            imageScrollView.display(image: pdfImg!)
            saveCount = 1
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @available(iOS 8.0, *)
    public func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("Cancelled")
        dismiss(animated: true, completion: nil)
    }
    
}

