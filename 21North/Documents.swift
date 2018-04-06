//
//  Documents.swift
//  21North
//
//  Created by Sachin Tomar on 05/10/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation
import MobileCoreServices

class Documents:BaseViewController, UIImagePickerControllerDelegate, UITableViewDelegate, UINavigationControllerDelegate, UITableViewDataSource, UIDocumentMenuDelegate,UIDocumentPickerDelegate {
    let shapes = Shapes()
    let drawservicing = DrawServicing()
    let style = Style()
    let saveDL = LocateAmbassador()
    var triggeredFrom: String!
    var superViewWidth: CGFloat!
    var superViewHeight: CGFloat!
    let scrollView = UIScrollView()
    let contentView = UIView()
    let profileImageView = UIImageView()
    var networkView  = UIView()
    var activeTag:Int!
    var activeTagstring:String!
    var docTypeExt = ["RC", "INS", "PUC"]
    var docType = ["RC BOOK", "INSURANCE", "PUC"]
    var fileURLs = [URL]()
    var dlArray = [[String]]()
    var docArray: [Bool] = [false, false, false]
    var fileName = ""
    var numberOfRows = 0
    var selectedCell = DocumentCustomCell()
    var userId = ""
    var documentsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = DataCreator.sharedInstance.signupResponse.userId
        if userId.isEmpty{
            userId = DataCreator.sharedInstance.loginResponse.userId
        }
        setupUI()
        NotificationCenter.default.addObserver(self, selector: #selector(checkPhoto), name: NSNotification.Name(rawValue: "photoTaken"), object: nil)
    }
    
    //MARK: UI setup
    func setupUI(){
        view.backgroundColor = UIColor.white
        
        //fetch DL data
        if triggeredFrom == "DL"{
            populateDLArray()
        }
        else if triggeredFrom == "Documents"{
            populateDocArray()
        }
        //Navigation button setup
        let closeButtonItem = NavigationItemModel(title: nil, image: shapes.drawShapes(type: "cross"), highlitedImage: nil, action: #selector(cancelButtonClicked), type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        //Profile imageView setup
        profileImageView.layer.cornerRadius = 41
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = UIColor.gray
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.image = Helper.loadImageFromPath()
        profileImageView.autoSetDimension(.width, toSize: 82.0)
        profileImageView.autoSetDimension(.height, toSize: 82.0)
        profileImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 70.0)
        profileImageView.autoAlignAxis(.vertical, toSameAxisOf: view)
        
        view.addSubview(documentsTableView)
        documentsTableView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(70+82+30, 20, 0, 20), excludingEdge: .bottom)
        documentsTableView.delegate = self
        documentsTableView.dataSource = self
        documentsTableView.separatorStyle = .none
        documentsTableView.register(DocumentCustomCell.self, forCellReuseIdentifier: "cell")
        
        if triggeredFrom == "DL" {
            let addButtonItem = NavigationItemModel(title: nil, image: shapes.drawShapes(type: "blackPlus"), highlitedImage: nil, action: #selector(addDLButtonClicked), type: NavigationItemType.imageOnly)
            setRightButtonItems(addButtonItem)
        }
        else{
            numberOfRows = 3
        }
        documentsTableView.autoSetDimension(.height, toSize: CGFloat(numberOfRows*70+40), relation: .greaterThanOrEqual)
    }
    
    func addDLView(name:String){
        dlArray.append([name, "no"])
        reloadTableData()
    }
    
    //MARK: Data handling
    func populateDLArray(){
        let fileManager = FileManager.default
        let documentsURL = try! fileManager.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("21Doc/DL") as URL
        do {
            fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            numberOfRows = fileURLs.count
            // process files
        } catch {
            print("Error while enumerating files  \(error.localizedDescription)")
        }
        dlArray.removeAll()
        for i in 0 ..< fileURLs.count {
            let file = fileURLs[i].path
            if let pos1 = file.range(of: "DL-"), let pos2 = file.range(of: ".jpg"){
                dlArray.append([String(file[pos1.upperBound..<pos2.lowerBound]),"yes"])
            }
            else if let pos1 = file.range(of: "DL-"), let pos2 = file.range(of: ".pdf"){
                dlArray.append([String(file[pos1.upperBound..<pos2.lowerBound]),"yes"])
            }
        }
    }
    
    func populateDocArray(){
        let fileManager = FileManager.default
        let documentsURL = try! fileManager.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("21Doc/\(DataCreator.sharedInstance.selectedVehicleNumber)") as URL
        var docUrls = [URL]()
        do {
            docUrls = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            // process files
        } catch {
            print("Error while enumerating files  \(error.localizedDescription)")
        }
        for i in 0 ..< docUrls.count {
            let file = docUrls[i].path
            
            if file.range(of: "RC") != nil{
                docArray[0] = true
            }
            else if file.range(of: "INS") != nil{
                docArray[1] = true
            }
            else if file.range(of: "PUC") != nil{
                docArray[2] = true
            }
        }
    }
    
    func reloadTableData(){
        numberOfRows = dlArray.count
        documentsTableView.reloadData()
        documentsTableView.autoSetDimension(.height, toSize: CGFloat(numberOfRows*70+40), relation: .greaterThanOrEqual)
    }
    
    //MARK: Action handling
    func handleTap(index: Int){
        var fileExtension = "-"
        if triggeredFrom == "Documents" {
            fileExtension += docTypeExt[index]
            activeTagstring = userId + fileExtension
        }
        else {
            fileExtension += "DL"
            activeTagstring = userId + fileExtension + "-" + dlArray[index][0]
        }
        
        let check = checkForPhoto(fileName: activeTagstring)
        if(check == true){
            let vc = Camera()
            vc.delegate1 = self
            vc.triggeredFrom = triggeredFrom
            vc.fileName = activeTagstring
            Helper.topMostController().present(vc, animated: true, completion: nil)
        }
        else{
            fileName = activeTagstring
            showAlert(index: index)
        }
    }
    
    @objc func addDLButtonClicked(){
        let alert = UIAlertController(title: NSLocalizedString("Driving Licence", comment: ""), message: NSLocalizedString("Enter Name", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (textField) in
            textField.placeholder = NSLocalizedString("Name", comment: "")
        }
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Continue", comment: ""), style: UIAlertActionStyle.default, handler: { action in
            let name = (alert.textFields![0].text)!
            self.addDLView(name: name)
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        Helper.topMostController().present(alert, animated: true, completion: nil)
    }
    
    
    @objc func cancelButtonClicked(){
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Image handling
    @objc func checkPhoto(_ notification: Notification){
        let check1 = checkForPhoto(fileName: activeTagstring)
        if activeTagstring.range(of:"INS") != nil || activeTagstring.range(of:"RC") != nil || activeTagstring.range(of:"DL") != nil || activeTagstring.range(of:"PUC") != nil{
            if(check1 == true){
                selectedCell.cellImage = shapes.right()
            }
            else{
                selectedCell.cellImage = shapes.upload()
            }
        }
    }
    
    func checkForPhoto(fileName: String)->Bool{
        var pdfPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("21Doc/\(DataCreator.sharedInstance.selectedVehicleNumber)/\(fileName).pdf")
        var imagePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc/\(DataCreator.sharedInstance.selectedVehicleNumber)") as String
        if triggeredFrom == "DL"{
            imagePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc/DL") as String
            pdfPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("21Doc/DL/\(fileName).pdf")
        }
        if loadImageFromPath(imagePath + "/" + fileName + ".jpg") != nil || loadPdfFromPath(pdfPath) != nil {
            return true
        }
        return false
    }
    
    func loadPdfFromPath(_ path: URL) -> UIDocument? {
        let pdf = UIDocument(fileURL: path)
        if !FileManager.default.fileExists(atPath: path.path){
            print("missing pdf at: \(path)")
            return nil
        }
        //        if pdf == nil{
        //            print("missing pdf at: \(path)")
        //        }
        return pdf
    }
    
    func loadImageFromPath(_ path: String) -> UIImage? {
        let image = UIImage(contentsOfFile: path)
        if image == nil{
            print("missing image at: \(path)")
        }
        return image
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
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = false
            Helper.topMostController().present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func deleteDL(index: Int){
        if fileURLs.count > index{
            fileURLs.remove(at: index)
        }
        numberOfRows = dlArray.count
        
        let fileManager = FileManager.default
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        guard let dirPath = paths.first else {
            return
        }
        let filePath = "\(dirPath)/21Doc/DL/\(userId)-DL-\(dlArray[index][0])"
        do {
            try fileManager.removeItem(atPath: filePath+".jpg")
            try fileManager.removeItem(atPath: filePath+".pdf")
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        dlArray.remove(at: index)
        reloadTableData()
    }
    
    func setTickImage(){
        
        
        let check1 = self.checkForPhoto(fileName: self.activeTagstring)
        if self.activeTagstring.range(of:"INS") != nil{
            if(check1 == true){
                self.selectedCell.cellImage = self.shapes.right()
            }
            else{
                self.selectedCell.cellImage = self.shapes.upload()
            }
        }
        if self.activeTagstring.range(of:"RC") != nil{
            if(check1 == true){
                self.selectedCell.cellImage = self.shapes.right()
            }
            else{
                self.selectedCell.cellImage = self.shapes.upload()
            }
        }
        if self.activeTagstring.range(of:"PUC") != nil{
            if(check1 == true){
                self.selectedCell.cellImage = self.shapes.right()
            }
            else{
                self.selectedCell.cellImage = self.shapes.upload()
            }
        }
        if self.activeTagstring.range(of:"DL") != nil{
            if(check1 == true){
                self.selectedCell.cellImage = self.shapes.right()
            }
            else{
                self.selectedCell.cellImage = self.shapes.upload()
            }
        }
    }
    
    //MARK: ImagePicker delegate
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!) {
        if(image != nil){
            let imageData = UIImageJPEGRepresentation(image!, 1)
            let compressedJPGImage = UIImage(data: imageData!)
            
            let fileManager = FileManager.default
            let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            var paths = documentsDirectory.appendingPathComponent("21Doc")
            //            var paths =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc/\(DataCreator.sharedInstance.selectedVehicleNumber)")
            
            if triggeredFrom == "DL"{
                //                paths =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0].stringByAppendingPathComponent("21Doc/DL")
                paths.appendPathComponent("/DL")
            }
            else{
                paths.appendPathComponent("/\(DataCreator.sharedInstance.selectedVehicleNumber)")
            }
            
            //            paths.appendPathComponent("DL")
            
            if !fileManager.fileExists(atPath: paths.path){
                do {
                    try FileManager.default.createDirectory(atPath: paths.path, withIntermediateDirectories: true, attributes: nil)
                } catch let error as NSError {
                    print(error.localizedDescription);
                }
                
                
                
                
                //            if !fileManager.fileExists(atPath: paths){
                //                do {
                //                    try FileManager.default.createDirectory(atPath: paths, withIntermediateDirectories: false, attributes: nil)
                //                } catch let error as NSError {
                //                    print(error.localizedDescription);
                //                }
            }
            DispatchQueue.main.async {
                let jpgImageData = UIImageJPEGRepresentation(compressedJPGImage!, 1.0)   // if you want to save as JPEG
                let result = (try? jpgImageData!.write(to: URL(fileURLWithPath: (paths.path)+"/\(self.fileName).jpg"), options: [.atomic])) != nil
                
                self.setTickImage()
            }
        }
        self.dismiss(animated: true, completion: nil);
    }
    
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Alert controller for uploading photo
    func showAlert(index: Int) {
        let importMenu = UIDocumentMenuViewController(documentTypes: [String(kUTTypePDF)], in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        if triggeredFrom == "DL"{
            importMenu.addOption(withTitle: NSLocalizedString("Delete DL", comment: ""), image: nil, order: .first, handler: { self.deleteDL(index: index)})
        }
        importMenu.addOption(withTitle: NSLocalizedString("Take Photo", comment: ""), image: nil, order: .first, handler: { self.openCamera() })
        importMenu.addOption(withTitle: NSLocalizedString("Choose Photo", comment: ""), image: nil, order: .first, handler: { self.openGallery()})
        importMenu.addOption(withTitle: NSLocalizedString("What do you want to do?", comment: ""), image: nil, order: .first, handler: { print("New Doc Requested") })
        Helper.topMostController().present(importMenu, animated: true, completion: nil)
    }
    
    //MARK: tableView delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DocumentCustomCell
        if triggeredFrom == "DL"{
            cell.cellTitle = NSLocalizedString("Driving Licence", comment: "") + " - "+dlArray[indexPath.row][0]
            if dlArray[indexPath.row][1] == "yes"{
                cell.cellImage = shapes.right()
            }
            else{
                cell.cellImage = shapes.upload()
            }
        }
        else{
            cell.cellTitle = docType[indexPath.row] + " - " + DataCreator.sharedInstance.selectedVehicleNumber
            if docArray[indexPath.row]{
                cell.cellImage = shapes.right()
            }
            else{
                cell.cellImage = shapes.upload()
            }
        }
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
        selectedCell = (tableView.cellForRow(at: indexPath) as? DocumentCustomCell)!
        handleTap(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && triggeredFrom == "DL"{
            if fileURLs.count > indexPath.row{
                fileURLs.remove(at: indexPath.row)
            }
            numberOfRows = dlArray.count
            
            let fileManager = FileManager.default
            let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
            let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
            let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
            guard let dirPath = paths.first else {
                return
            }
            let filePath = "\(dirPath)/21Doc/DL/\(userId)-DL-\(dlArray[indexPath.row][0])"
            do {
                try fileManager.removeItem(atPath: filePath+".jpg")
                try fileManager.removeItem(atPath: filePath+".pdf")
            } catch let error as NSError {
                print(error.debugDescription)
            }
            
            dlArray.remove(at: indexPath.row)
            reloadTableData()
            //            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
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
        
        let fileName = url.lastPathComponent
        
        ////        let newUrls = url.flatMap { (url: URL) -> URL? in
        //            // Create file URL to temporary folder
        //            var tempURL = URL(fileURLWithPath: NSTemporaryDirectory())
        //            // Apend filename (name+extension) to URL
        //            tempURL.appendPathComponent(url.lastPathComponent)
        do {
            //                 If file with same name exists remove it (replace file with new one)
            if FileManager.default.fileExists(atPath: paths.path+"/"+activeTagstring+".pdf") {
                try FileManager.default.removeItem(atPath: paths.path+"/"+activeTagstring+".pdf")
            }
            // Move file from app_id-Inbox to tmp/filename
            try FileManager.default.moveItem(atPath: url.path, toPath: paths.path+"/"+activeTagstring+".pdf")
        } catch {
            print(error.localizedDescription)
        }
        
        setTickImage()
        //optional, case PDF -> render
        //        displayPDFweb.loadRequest(NSURLRequest(url: cico) as URLRequest)
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

extension Documents: CameraDelegate {
    func updateData(_ data: String) {
        //        conn!.send(data)
    }
}

