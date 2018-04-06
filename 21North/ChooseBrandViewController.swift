//
//  ChooseBrandViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 16/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

protocol ChooseBrandVCDelegate {
    func dismissAddNoVC()
}
protocol ChooseBrandVCDelegate1 {
    func updateBrandModel()
}

class ChooseBrandViewController: BaseViewController, iCarouselDataSource, iCarouselDelegate, SocketManagerDelegate3, ChooseModelSubModelVCDelegate {
    var drawservicing = DrawServicing()
    var shapes = Shapes()
    var carousel = iCarousel()
    let appdelegate = UIApplication.shared.delegate as? AppDelegate
    var imageViewHt: CGFloat!
    var imageViewWt: CGFloat!
    var newHt: CGFloat!
    var newWt: CGFloat!
    var chooseBrandVCDelegate: ChooseBrandVCDelegate?
    var chooseBrandVCDelegate1: ChooseBrandVCDelegate1?
    var selectedBrand = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedBrand = DataCreator.sharedInstance.brandArray[0].id
        setupUI()
        //        let recvDouble = NSDate().timeIntervalSince1970*1000
        //        print("TimeLapse -1: 5:",recvDouble)
    }
    
    //MARK: UI setup
    func setupUI(){
        view.backgroundColor = UIColor(red: 242.0/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        
        appdelegate?.conn.delegate3 = self
        
        let style = Style()
        subTitle = NSLocalizedString("ChooseBrandText", comment: "")
        subTitleFont = style.firstLineFont!
        subTitleColor = UIColor.white
        pageTitle = DataCreator.sharedInstance.selectedVehicleNumber
        titleFont = style.titleFont!
        titleColor = UIColor.white
        
        
        let backButton = shapes.drawShapes(type: "backButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        let nextButtonItem = NavigationItemModel(title: "NEXT", image: nil, highlitedImage: nil, action: #selector(nextButtonClicked), type: NavigationItemType.titleOnly)
        setRightButtonItems(nextButtonItem)
        
        headerImage = UIImage(named: "servicing")
        
        view.addSubview(carousel)
        carousel.autoSetDimension(.height, toSize: 300, relation: .greaterThanOrEqual)
        carousel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake((headerImage?.size.height)!+100, 20.0, 0.0, 20.0), excludingEdge: .bottom)
        carousel.dataSource = self
        carousel.delegate = self
        carousel.type = .coverFlow
        if !DataCreator.sharedInstance.fullVehicleData.vehiclemake_id.isEmpty{
            for i in 0 ..< DataCreator.sharedInstance.brandArray.count{
                if DataCreator.sharedInstance.fullVehicleData.vehiclemake_id == DataCreator.sharedInstance.brandArray[i].id{
                    carousel.currentItemIndex = i
                    break
                }
            }
        }
        
        //        carousel.selectitem
        //        carousel.selectRow(0, inComponent: 0, animated: true)
    }
    
    //MARK: Action handling
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        DataCreator.sharedInstance.modelPageTriggeredFrom = ""
        //        passData.clickTrack(dataString: "59")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func nextButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        if DataCreator.sharedInstance.modelPageTriggeredFrom.isEmpty{
            DataCreator.sharedInstance.modelPageTriggeredFrom = "BrandsPage"
        }
        DataCreator.sharedInstance.shouldReloadSubModel = false
        if DataCreator.sharedInstance.networkCheck == "1"{
            DataCreator.sharedInstance.fullVehicleData.vehiclemake_id  = selectedBrand
            appdelegate?.conn.send("\(Constants.RequestStates.VehicleModels)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemake_id)|")
        }
        else{
            ToastManager.internetError()
        }
    }
    
    //MARK: Carousel delegate
    func numberOfItems(in carousel: iCarousel) -> Int {
        return DataCreator.sharedInstance.brandArray.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let brandImgView: UIImageView
        var brandImage: UIImage!
        let imageName: String
        imageName = "BrandImages/Logo" + DataCreator.sharedInstance.brandArray[index].id + ".png"
        brandImage = UIImage(named: imageName)
        if(brandImage != nil)
        {
            brandImage = resizeImage(image: UIImage(named: imageName)!, targetSize: CGSize(width: 200*3, height: 320*3))
        }
        else{
            brandImage = resizeImage(image: UIImage(named: "Home-Insurance")!, targetSize: CGSize(width: 200*3, height: 320*3))
        }
        brandImgView = UIImageView(frame: CGRect(x: 40, y: 20, width: newWt/3, height: newHt/3))
        
        brandImgView.image = brandImage
        brandImgView.isUserInteractionEnabled = true
        
        let carouselView = UIView()
        carouselView.frame = CGRect(x: 0, y: (headerImage?.size.height)!+30.0, width: newWt/3+80, height: newHt/3+40)
        carouselView.addSubview(brandImgView)
        
        return carouselView
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        if(DataCreator.sharedInstance.brandArray.count>0){
            selectedBrand = DataCreator.sharedInstance.brandArray[carousel.currentItemIndex].id
            print(DataCreator.sharedInstance.brandArray[carousel.currentItemIndex].brandname)
        }
    }
    
    //MARK: Image handling
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        newHt = newSize.height
        newWt = newSize.width
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    //MARK: Delegate methods
    func presentChooseModel(){
        let chooseModelSubModelVC = ChooseModelSubModelViewController()
        chooseModelSubModelVC.chooseModelVCDelegate = self
        Helper.topMostController().present(chooseModelSubModelVC, animated: true, completion: nil)
    }
    
    func dismissChooseBrandVC(){
        chooseBrandVCDelegate1?.updateBrandModel()
    }
}

