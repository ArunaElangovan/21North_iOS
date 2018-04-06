//
//  ImageCollectionViewCell.swift
//  Parallax
//
//  Created by Sree Kumar on 07/06/16.
//  Copyright © 2016 DevedUpLtd. All rights reserved.
//

import UIKit
import AVFoundation



class ImageCollectionViewCell: UICollectionViewCell,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var backgroundImageView1: UIImageView!
    var backgroundImageView2: UIImageView!
    var backgroundImageView3: UIImageView!
    var backgroundImageView4: UIImageView!
    var backgroundImageView5: UIImageView!
    var backgroundImageView6: UIImageView!
    var label: UILabel!
    var collectionViewLayout: imageCollectionViewLayout!
    var collectionView: UICollectionView!
    var vc:ViewController = ViewController()
    let edgeSwipe = UIScreenEdgePanGestureRecognizer()
    let leftSwipe = UISwipeGestureRecognizer()
    var line: CAShapeLayer!
    let drawservicing = DrawServicing()
    var vehicleNumberLabel = UILabel()
    var vehicleNumberLabelWhite = UILabel()
    var numValue = ""
    var addVehicleView:UIView!
    var delegate = UIApplication.shared.delegate as! AppDelegate
    let homePageIcon = HomePageIcon()
    var width = CGFloat()
    var vehicleNumberBackView = UIView()
    
    var arrImageName = ["Home-Servicing", "Home-ESTIMATOR", "Home-Chauffeur", "Home-RSA", "", "Home-Expenses", "Home-Insurance", "footer"]
    var arrImageLabel = ["EXPENSE TRACKER","SERVICING", "REPAIR ESTIMATOR", "CHAUFFEUR", "Spons","ROAD SIDE ASSISTANCE", "INSURANCE", ""]
    var subHeadingLabel = [NSLocalizedString("Transparent | Convenient | Save Big", comment: ""), NSLocalizedString("Know your Bill | No Surprises", comment: ""), NSLocalizedString("Your Vehicle | Our Driver | Pay by the Minute", comment: ""),NSLocalizedString("Help is One Touch Away | Drive Stress free", comment: ""), "Check", NSLocalizedString("Fuel Management | Maintain Records of Spends", comment: ""), NSLocalizedString("New | Renew and Manage Claims | Save Big", comment: ""), ""]
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if(DataCreator.sharedInstance.homePageCheck == 0){
            arrImageLabel = [NSLocalizedString("Vehicle Servicing", comment: ""), NSLocalizedString("Service Cost Estimator", comment: ""), NSLocalizedString("Chauffeur On Demand", comment: ""), NSLocalizedString("Road Side / Emergency Assistance", comment: ""), " " , NSLocalizedString("Track Vehicle Expenses", comment: ""), NSLocalizedString("Insurance Management", comment: ""), ""]
        }
        width = UIScreen.main.bounds.width
        backgroundImageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        backgroundImageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        backgroundImageView3 = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        backgroundImageView4 = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        backgroundImageView5 = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        backgroundImageView6 = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        
        collectionViewLayout = imageCollectionViewLayout()
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 30, width: frame.size.width, height: frame.size.height+10), collectionViewLayout: collectionViewLayout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.cellPadding = 0.0
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        if let layout = collectionView?.collectionViewLayout as? imageCollectionViewLayout {
            layout.delegate = self
        }
        collectionView.register(verticalCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(imgCell.self, forCellWithReuseIdentifier: "Cell1")
        collectionView.register(sponsorCell.self, forCellWithReuseIdentifier: "Cell2")
        if #available(iOS 10.0, *) {
            collectionView.isPrefetchingEnabled = false
        } else {
            // Fallback on earlier versions
        }
        collectionView.isPagingEnabled = false
        if(DataCreator.sharedInstance.homePageCheck == 0){
            collectionView.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1.0)
        }
        else{
            collectionView.backgroundColor = UIColor.black
        }
        contentView.addSubview(collectionView)
        
        let shapes = Shapes()
        vehicleNumberLabel = UILabel(frame: CGRect(x: 20, y: 27, width: 200, height: 30))
        if(DataCreator.sharedInstance.homePageCheck == 0){
            vehicleNumberBackView.backgroundColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1.0)
            vehicleNumberBackView.layer.shadowColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1.0).cgColor
            vehicleNumberBackView.layer.shadowOffset = CGSize(width: -10, height: 15)
            vehicleNumberBackView.translatesAutoresizingMaskIntoConstraints = false
            vehicleNumberBackView.layer.borderColor = UIColor(red: 214/255.0, green: 214/255.0, blue: 214/255.0, alpha: 1.0).cgColor
            vehicleNumberBackView.layer.borderWidth = 1
            vehicleNumberBackView.layer.shadowRadius = 4
            vehicleNumberBackView.layer.shadowOpacity = 80
            contentView.addSubview(vehicleNumberBackView)
            contentView.addConstraintsWithFormat("H:|[v0(\(width+20))]", views: vehicleNumberBackView)
            contentView.addConstraintsWithFormat("V:|[v0(30)]", views: vehicleNumberBackView)
            vehicleNumberLabel.textColor = UIColor(red: 74/225, green: 74/225, blue: 74/225, alpha: 1)
            
            vehicleNumberLabelWhite.textAlignment = .center
            vehicleNumberLabelWhite.font = UIFont(name: "HelveticaNeue-CondensedBold", size:24)
            vehicleNumberLabelWhite.translatesAutoresizingMaskIntoConstraints = false
            vehicleNumberLabelWhite.layer.shadowColor = UIColor.black.cgColor
            vehicleNumberLabelWhite.textColor = UIColor.white
            vehicleNumberLabelWhite.layer.shadowOffset = CGSize.zero
            vehicleNumberLabelWhite.layer.shadowRadius = 3.0
            vehicleNumberLabelWhite.layer.masksToBounds = false
            vehicleNumberLabelWhite.layer.opacity = 0.9
            contentView.addSubview(vehicleNumberLabelWhite)
            
        }else{
            vehicleNumberLabel.textColor = UIColor.white
        }
        vehicleNumberLabel.textAlignment = .center
        vehicleNumberLabel.font = UIFont(name: "HelveticaNeue-CondensedBold", size:24)
        vehicleNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        vehicleNumberLabel.layer.shadowColor = UIColor.black.cgColor
        vehicleNumberLabel.layer.shadowOffset = CGSize.zero
        vehicleNumberLabel.layer.shadowRadius = 3.0
        vehicleNumberLabel.layer.masksToBounds = false
        vehicleNumberLabel.layer.opacity = 0.9
        vehicleNumberLabel.isUserInteractionEnabled = true
        let tapOnVehicleNumber = UITapGestureRecognizer(target: self, action: #selector(tapOnVehicleNo))
        vehicleNumberLabel.addGestureRecognizer(tapOnVehicleNumber)
        contentView.addSubview(vehicleNumberLabel)
        
        let typeImage = UIImageView(frame: CGRect(x: 90, y: 10, width: 30, height: 30))
        typeImage.image = UIImage(named: "bike.png")
        contentView.addSubview(typeImage)
        
        let imView = shapes.drawShapes(contentView, type: "menu")
        imView.translatesAutoresizingMaskIntoConstraints = false
        imView.isUserInteractionEnabled = true
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(ImageCollectionViewCell.leftMenuOpen))
        imView.addGestureRecognizer(tap1)
        contentView.addSubview(imView)
        
        let imageview2 = shapes.drawShapes(contentView, type: "plus")
        imageview2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageview2)
        imageview2.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(ImageCollectionViewCell.plusfunction))
        imageview2.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(menuTapped), name: NSNotification.Name(rawValue: "CarNo"), object: nil)
        
        contentView.addConstraintsWithFormat("V:|-8-[v0]", views: imView)
        contentView.addConstraintsWithFormat("V:|-11-[v0]", views: vehicleNumberLabel)
        contentView.addConstraintsWithFormat("V:|-12-[v0]", views: vehicleNumberLabelWhite)
        contentView.addConstraintsWithFormat("V:|-5-[v0]", views: imageview2)
        contentView.addConstraintsWithFormat("H:|[v0]", views: imView)
        contentView.addConstraintsWithFormat("H:|[v0]|", views: vehicleNumberLabel)
        contentView.addConstraintsWithFormat("H:|-1-[v0]|", views: vehicleNumberLabelWhite)
        contentView.addConstraintsWithFormat("H:[v0]|", views: imageview2)
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshCollection), name: NSNotification.Name(rawValue: "REFCOL"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(scrollToTop), name: NSNotification.Name(rawValue: "ScrollToTop"), object: nil)
    }
    @objc func scrollToTop(){
        self.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    @objc func refreshCollection(){
        DispatchQueue.main.async{
            self.collectionView.reloadData()
        }
    }
    @objc func tapOnVehicleNo(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ScrollToTop"), object: nil)
    }
    
    @objc func leftMenuOpen(){
        //        passData.clickTrack(dataString: "14")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "openLeft"), object: nil)
    }
    @objc func plusfunction(){
        NotificationCenter.default.post(name: Notification.Name(rawValue: "openCar"), object: nil)
    }
    
    @objc func menuTapped(_ notification: Notification){
        let pin = (notification as NSNotification).userInfo!["CarNo"] as! String
        vehicleNumberLabel.text = pin
        vehicleNumberLabelWhite.text = pin
        collectionView.reloadData()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func parallaxTheImageViewScrollOffset(_ offsetPoint:CGPoint, scrollDirection:UICollectionViewScrollDirection) {
        // Horizontal? If not, it's vertical
        let isHorizontal = .horizontal == scrollDirection
        
        // Choose the amount of parallax, one might say the distance from the viewer
        // 1 would mean the image wont move at all ie. very far away, 0.1 it moves a little i.e. very close
        let factor: CGFloat = 0.5
        let parallaxFactorX: CGFloat = isHorizontal ? factor : 0.0
        let parallaxFactorY: CGFloat = isHorizontal ? 0.0 : factor
        
        // Calculate the image position and apply the parallax factor
        let finalX = (offsetPoint.x - self.frame.origin.x) * parallaxFactorX
        let finalY = (offsetPoint.y - self.frame.origin.y) * parallaxFactorY
        
        
        // Now we have final position, set the offset of the frame of the background iamge
        if (backgroundImageView1 != nil){
            let frame = backgroundImageView1.bounds
            var offsetFame = frame
            if(DataCreator.sharedInstance.homePageCheck == 0){
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY) + 90)
            }
            else{
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY))
            }
            backgroundImageView1.frame = offsetFame
        }
        if (backgroundImageView2 != nil){
            let frame = backgroundImageView2.bounds
            var offsetFame = frame
            if(DataCreator.sharedInstance.homePageCheck == 0){
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY) + 90)
            }
            else{
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY))
            }
            backgroundImageView2.frame = offsetFame
        }
        if (backgroundImageView3 != nil){
            let frame = backgroundImageView3.bounds
            var offsetFame = frame
            if(DataCreator.sharedInstance.homePageCheck == 0){
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY) + 90)
            }
            else{
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY))
            }
            backgroundImageView3.frame = offsetFame
        }
        
        if (backgroundImageView4 != nil){
            let frame = backgroundImageView4.bounds
            var offsetFame = frame
            if(DataCreator.sharedInstance.homePageCheck == 0){
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY) + 90)
            }
            else{
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY))
            }
            backgroundImageView4.frame = offsetFame
        }
        if (backgroundImageView5 != nil){
            let frame = backgroundImageView5.bounds
            var offsetFame = frame
            if(DataCreator.sharedInstance.homePageCheck == 0){
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY) + 90)
            }
            else{
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY))
            }
            backgroundImageView5.frame = offsetFame
        }
        if (backgroundImageView6 != nil){
            let frame = backgroundImageView5.bounds
            var offsetFame = frame
            if(DataCreator.sharedInstance.homePageCheck == 0){
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY)+90)
            }
            else{
                offsetFame = frame.offsetBy(dx: CGFloat(finalX), dy: CGFloat(finalY))
            }
            backgroundImageView6.frame = offsetFame
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    //Vertcal cat
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8;
    }
    let style = Style()
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: verticalCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! verticalCollectionViewCell
        let cell1: imgCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! imgCell
        let cell2: sponsorCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! sponsorCell
        if(DataCreator.sharedInstance.homePageCheck == 0){
            cell.subHeadingLabel.text = subHeadingLabel[(indexPath as NSIndexPath).row]
        }
        
        if (indexPath as NSIndexPath).row==0{
            //            print(delegate.selectedBrandID)
            cell.brandImageView.image = nil
            let tap = UITapGestureRecognizer(target: self, action: #selector(ImageCollectionViewCell.tappedServicing))
            cell.backgroundImageView.addGestureRecognizer(tap)
            cell.label.text = arrImageLabel[(indexPath as NSIndexPath).row]
            backgroundImageView2 = cell.backgroundImageView
            cell.comingSoonLabel.text = DataCreator.sharedInstance.servicingLabel
            cell.backgroundImageView.image = UIImage(named:arrImageName[(indexPath as NSIndexPath).row])
            cell.backgroundImageView.isUserInteractionEnabled = true
            cell.addGestureRecognizer(tap)
            cell.isUserInteractionEnabled = true
            //            print(delegate.servicingLabelCheck)
            if(DataCreator.sharedInstance.servicingLabelCheck == 0){
                cell.grad.image = UIImage(named:"")
                cell.comingSoonLabel.textColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 1.0)
                cell.comingSoonLabel.adjustsFontSizeToFitWidth = true
                cell.comingSoonLabel.font = style.thirdLineInAFont//UIFont(name: ".SFUIDisplay", size: 12)
                cell.activeLed.image = nil
                cell.comingSoonLabel.layer.shadowRadius = 0
            }
            else{
                
                cell.grad.image = homePageIcon.grad()
                cell.comingSoonLabel.font = style.thirdLineAFont//UIFont(name: ".SFUIDisplay-Bold", size: 14)
                let attributedString = NSMutableAttributedString(string: DataCreator.sharedInstance.servicingLabel)
                attributedString.addAttribute(NSAttributedStringKey.kern, value: CGFloat(1.4), range: NSRange(location: 0, length: DataCreator.sharedInstance.servicingLabel.count))
                cell.comingSoonLabel.attributedText = attributedString
                
                let text = attributedString.string// as NSString
                let font = style.thirdLineAFont//UIFont(name: ".SFUIDisplay-Bold", size: 14)
                let size = text.size(withAttributes: [NSAttributedStringKey.font:font!])
                //                print(size)
                cell.comingSoonLabel.textColor = UIColor.white
                cell.comingSoonLabel.layer.shadowColor = UIColor.black.cgColor
                cell.comingSoonLabel.layer.shadowOffset = CGSize.zero
                cell.comingSoonLabel.layer.shadowRadius = 3.0
                cell.comingSoonLabel.layer.shadowOpacity = 0.5
                cell.activeLed.image = UIImage(named: "green")
                var addLength = Double(text.count-1) * 1.4
                if((width+size.width)/2 + CGFloat(addLength) > width-10){
                    addLength = addLength - 10
                }
                cell.activeLed.frame = CGRect(x: (width+size.width)/2 + CGFloat(addLength), y: 3, width: 8, height: 8)
            }
            
            if(DataCreator.sharedInstance.homePageCheck == 0){
                var imCheck: UIImage!
                var im1 = UIImage()
                var imageName: String!
                if(DataCreator.sharedInstance.vehicleArray.count>0){
                    imageName = "BrandImages/Logo" + DataCreator.sharedInstance.fullVehicleData.vehiclemake_id + ".png"
                }
                else{
                    imageName = "BrandImages/Logo0.png"
                }
                imCheck = UIImage(named: imageName)!
                cell.brandImageView.removeFromSuperview()
                cell.addSubview(cell.brandImageView)
                if(imCheck != nil){
                    if((imCheck?.size.height)! > (imCheck?.size.width)!){
                        var imGap: CGFloat!
                        var newwidth: CGFloat!
                        if(DataCreator.sharedInstance.vehicleArray.count>0){
                            im1 = ResizeImage(UIImage(named: imageName)!, targetHeight: 45*3)
                            cell.brandImageView.image = im1
                            imGap = (width - im1.size.width/3)/2
                            newwidth = ((imCheck?.size.width)!/(imCheck?.size.height)!)*45
                            cell.addConstraintsWithFormat("V:|-(-45)-[v0(45)]", views: cell.brandImageView)
                        }
                        else{
                            im1 = ResizeImage(UIImage(named: imageName)!, targetHeight: 80*3)
                            cell.brandImageView.image = im1
                            imGap = (width - im1.size.width/3)/2
                            newwidth = ((imCheck?.size.width)!/(imCheck?.size.height)!)*80
                            cell.addConstraintsWithFormat("V:|-(-70)-[v0(80)]", views: cell.brandImageView)
                        }
                        cell.addConstraintsWithFormat("H:|-(\(imGap!))-[v0("+(NSString(format: "%.0f", newwidth) as String)+")]", views: cell.brandImageView)
                        
                    }
                    else{
                        im1 = ResizeImage1(UIImage(named: imageName)!, targetWidth: 60*3)
                        cell.brandImageView.image = im1
                        let imGap = (width - im1.size.width/3)/2
                        let newheight = ((imCheck?.size.height)!/(imCheck?.size.width)!)*60
                        cell.addConstraintsWithFormat("H:|-(\(imGap))-[v0(60)]", views: cell.brandImageView)
                        cell.addConstraintsWithFormat("V:|-(-"+(NSString(format: "%.0f", newheight) as String)+")-[v0("+(NSString(format: "%.0f", newheight) as String)+")]", views: cell.brandImageView)
                    }
                }
            }
            else{
                cell.comingSoonLabel.textColor = UIColor.orange//(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
            }
        }
            
        else if (indexPath as NSIndexPath).row==1{
            let tap = UITapGestureRecognizer(target: self, action: #selector(ImageCollectionViewCell.tappedCostEst))
            cell.brandImageView.image = nil
            cell.backgroundImageView.addGestureRecognizer(tap)
            cell.label.text = arrImageLabel[(indexPath as NSIndexPath).row]
            backgroundImageView3 = cell.backgroundImageView
            cell.comingSoonLabel.text = NSLocalizedString("Browse", comment: "")
            cell.backgroundImageView.image = UIImage(named:arrImageName[(indexPath as NSIndexPath).row])
            cell.backgroundImageView.isUserInteractionEnabled = true
            cell.addGestureRecognizer(tap)
            cell.isUserInteractionEnabled = true
            cell.grad.image = UIImage(named: "")
            cell.comingSoonLabel.textColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 1.0)
            cell.comingSoonLabel.font = style.thirdLineInAFont//UIFont(name: ".SFUIDisplay", size: 12)
            cell.comingSoonLabel.layer.shadowRadius = 0
            cell.activeLed.image = nil
        }
            
        else if (indexPath as NSIndexPath).row==2{
            let tap = UITapGestureRecognizer(target: self, action: #selector(ImageCollectionViewCell.tappedChauffeur))
            cell.brandImageView.image = nil
            cell.backgroundImageView.addGestureRecognizer(tap)
            cell.label.text = arrImageLabel[(indexPath as NSIndexPath).row]
            backgroundImageView4 = cell.backgroundImageView
            cell.comingSoonLabel.text = DataCreator.sharedInstance.chauffeurLabel
            cell.backgroundImageView.image = UIImage(named:arrImageName[(indexPath as NSIndexPath).row])
            cell.backgroundImageView.isUserInteractionEnabled = true
            cell.addGestureRecognizer(tap)
            cell.isUserInteractionEnabled = true
            if(DataCreator.sharedInstance.homePageCheck == 0){
                if(DataCreator.sharedInstance.chaufferLabelCheck == 0){
                    cell.grad.image = UIImage(named: "")
                    cell.comingSoonLabel.textColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 1.0)
                    cell.comingSoonLabel.font = style.thirdLineInAFont//UIFont(name: ".SFUIDisplay", size: 12)
                    cell.comingSoonLabel.layer.shadowRadius = 0
                    cell.activeLed.image = nil
                }
                else{
                    cell.grad.image = homePageIcon.grad()
                    cell.comingSoonLabel.font = style.thirdLineAFont//UIFont(name: ".SFUIDisplay-Bold", size: 14)
                    let attributedString = NSMutableAttributedString(string: DataCreator.sharedInstance.chauffeurLabel)
                    attributedString.addAttribute(NSAttributedStringKey.kern, value: CGFloat(1.4), range: NSRange(location: 0, length: DataCreator.sharedInstance.chauffeurLabel.count))
                    cell.comingSoonLabel.attributedText = attributedString
                    
                    let text = cell.comingSoonLabel.text! as NSString
                    let font = UIFont(name: ".SFUIDisplay-Bold", size: 14)
                    let size = text.size(withAttributes: [NSAttributedStringKey.font:font!])
                    //                    print(size)
                    cell.comingSoonLabel.textColor = UIColor.white
                    cell.comingSoonLabel.layer.shadowColor = UIColor.black.cgColor
                    cell.comingSoonLabel.layer.shadowOffset = CGSize.zero
                    cell.comingSoonLabel.layer.shadowRadius = 3.0
                    cell.comingSoonLabel.layer.shadowOpacity = 0.5
                    cell.activeLed.image = UIImage(named: "green")
                    //                    cell.activeLed.translatesAutoresizingMaskIntoConstraints = true
                    cell.activeLed.frame = CGRect(x: (width+size.width)/2+20, y: 3, width: 8, height: 8)
                    //                    cell.comingSoonLabel.addConstraintsWithFormat("H:|-\((width+size.width)/2+20)-[v0(8)]", views: cell.activeLed)
                    
                }
            }
        }
        else if (indexPath as NSIndexPath).row==3{
            let tap = UITapGestureRecognizer(target: self, action: #selector(ImageCollectionViewCell.tappedRSA))
            cell.backgroundImageView.addGestureRecognizer(tap)
            cell.brandImageView.image = nil
            cell.label.text = arrImageLabel[(indexPath as NSIndexPath).row]
            backgroundImageView5 = cell.backgroundImageView
            cell.comingSoonLabel.text = DataCreator.sharedInstance.rsaLabel
            cell.backgroundImageView.image = UIImage(named:arrImageName[(indexPath as NSIndexPath).row])
            cell.backgroundImageView.isUserInteractionEnabled = true
            cell.addGestureRecognizer(tap)
            cell.isUserInteractionEnabled = true
            if(DataCreator.sharedInstance.rsaLabelCheck == 0){
                cell.grad.image = UIImage(named: "")
                cell.comingSoonLabel.textColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 1.0)
                cell.comingSoonLabel.font = style.thirdLineInAFont//UIFont(name: ".SFUIDisplay", size: 12)
                cell.activeLed.image = nil
            }
            else{
                cell.grad.image = homePageIcon.grad()
                cell.comingSoonLabel.font = style.thirdLineAFont//UIFont(name: ".SFUIDisplay-Bold", size: 14)
                let attributedString = NSMutableAttributedString(string: DataCreator.sharedInstance.rsaLabel)
                attributedString.addAttribute(NSAttributedStringKey.kern, value: CGFloat(1.4), range: NSRange(location: 0, length: DataCreator.sharedInstance.rsaLabel.count))
                cell.comingSoonLabel.attributedText = attributedString
                
                let text = cell.comingSoonLabel.text! as NSString
                let font = style.thirdLineAFont//UIFont(name: ".SFUIDisplay-Bold", size: 14)
                let size = text.size(withAttributes: [NSAttributedStringKey.font:font!])
                //                print(size)
                cell.comingSoonLabel.textColor = UIColor.white
                cell.comingSoonLabel.layer.shadowColor = UIColor.black.cgColor
                cell.comingSoonLabel.layer.shadowOffset = CGSize.zero
                cell.comingSoonLabel.layer.shadowRadius = 3.0
                cell.comingSoonLabel.layer.shadowOpacity = 0.5
                cell.activeLed.image = UIImage(named: "green")
                cell.activeLed.frame = CGRect(x: (width+size.width)/2+20, y: 3, width: 8, height: 8)
                //                cell.comingSoonLabel.addConstraintsWithFormat("H:|-\((width+size.width)/2+20)-[v0(8)]", views: cell.activeLed)
            }
        }
        else if (indexPath as NSIndexPath).row==4{
            cell2.sponsorLabel.text = NSLocalizedString("Sponsored", comment: "")
            let str = DataCreator.sharedInstance.sponserImageLink
            if(str != nil){
                cell2.backgroundImageView.image = str
                
                cell2.backgroundImageView.isUserInteractionEnabled = true
                let tapOnBackG = UITapGestureRecognizer(target: self, action: #selector(tapOnSpon))
                cell2.backgroundImageView.addGestureRecognizer(tapOnBackG)
            }
            else{
                let url = URL(string: "http://m.21north.in/advert/bmw.jpg")
                let adImageURL = try? Data(contentsOf: url!)
                cell2.backgroundImageView.image = UIImage(data: adImageURL!)!
            }
            
            return cell2
        }
        else if (indexPath as NSIndexPath).row==5{
            let tap = UITapGestureRecognizer(target: self, action: #selector(ImageCollectionViewCell.tappedExpenses))
            cell.backgroundImageView.addGestureRecognizer(tap)
            cell.label.text = arrImageLabel[(indexPath as NSIndexPath).row]
            backgroundImageView1 = cell.backgroundImageView
            cell.comingSoonLabel.text = NSLocalizedString("Coming Soon To Your City", comment: "")
            if(DataCreator.sharedInstance.homePageCheck == 0){
                cell.comingSoonLabel.textColor = UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
                cell.comingSoonLabel.font = style.thirdLineInAFont//UIFont(name: ".SFUIDisplay", size: 12)
            }
            else{
                cell.comingSoonLabel.textColor = UIColor.orange//(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
            }
            cell.backgroundImageView.image = UIImage(named:arrImageName[(indexPath as NSIndexPath).row])
            cell.backgroundImageView.isUserInteractionEnabled = true
            cell.addGestureRecognizer(tap)
            cell.isUserInteractionEnabled = true
            cell.activeLed.image = nil
        }
        else if (indexPath as NSIndexPath).row==6{
            backgroundImageView6 = cell.backgroundImageView
            cell.label.text = arrImageLabel[(indexPath as NSIndexPath).row]
            cell.brandImageView.image = nil
            let tap = UITapGestureRecognizer(target: self, action: #selector(ImageCollectionViewCell.tappedInsu))
            cell.backgroundImageView.addGestureRecognizer(tap)
            cell.comingSoonLabel.text = NSLocalizedString("Coming Soon To Your City", comment: "")
            cell.comingSoonLabel.textColor = UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
            cell.backgroundImageView.image = UIImage(named:arrImageName[(indexPath as NSIndexPath).row])
            cell.backgroundImageView.isUserInteractionEnabled = true
            cell.addGestureRecognizer(tap)
            cell.isUserInteractionEnabled = true
            cell.grad.image = UIImage(named: "")
            cell.comingSoonLabel.textColor = UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
            cell.comingSoonLabel.font = style.thirdLineInAFont//UIFont(name: ".SFUIDisplay", size: 12)
            cell.activeLed.image = nil
        }
        else if (indexPath as NSIndexPath).row==7{
            cell1.editImageView.image = homePageIcon.editIcon("edit")
            
            cell1.editView.isUserInteractionEnabled = true
            let tapOnEdit = UITapGestureRecognizer(target: self, action: #selector(edit))
            cell1.editView.addGestureRecognizer(tapOnEdit)
            
            cell1.viewHistoryImageView.image = homePageIcon.editIcon("history")
            cell1.historyView.isUserInteractionEnabled = true
            let tapOnHistory = UITapGestureRecognizer(target: self, action: #selector(viewHistory))
            cell1.historyView.addGestureRecognizer(tapOnHistory)
            let attributedString = NSMutableAttributedString(string: NSLocalizedString("Edit", comment: ""))
            attributedString.addAttribute(NSAttributedStringKey.kern, value: CGFloat(1.4), range: NSRange(location: 0, length: attributedString.length))
            
            cell1.editLabelWhite.attributedText = attributedString
            cell1.editLabel.attributedText = attributedString
            
            cell1.docImageView.image = homePageIcon.editIcon("documents")
            cell1.docImageView.isUserInteractionEnabled = true
            let tapOnDoc = UITapGestureRecognizer(target: self, action: #selector(showDoc))
            cell1.addGestureRecognizer(tapOnDoc)
            
            cell1.documentsLabelWhite.text = NSLocalizedString("Documents", comment: "")
            cell1.documentsLabel.text = NSLocalizedString("Documents", comment: "")
            
            let attributedString1 = NSMutableAttributedString(string: NSLocalizedString("History", comment: ""))
            attributedString1.addAttribute(NSAttributedStringKey.kern, value: CGFloat(1.4), range: NSRange(location: 0, length: attributedString1.length))
            cell1.viewHistoryLabel.attributedText = attributedString1
            cell1.viewHistoryLabelWhite.attributedText = attributedString1
            
            return cell1
        }
        // Parallax cell setup
        //cell.parallaxTheImageViewScrollOffset(self.collectionView.contentOffset, scrollDirection: self.collectionViewLayout.scrollDirection)
        if(DataCreator.sharedInstance.homePageCheck == 0){
            let textRightBorder = CALayer()
            textRightBorder.frame = CGRect(x: 0, y: -1, width: cell.backgroundImageView.frame.width, height: 1)
            textRightBorder.backgroundColor = UIColor.white.cgColor
            cell.backgroundImageView.layer.addSublayer(textRightBorder)
            
            let textRightBorder1 = CALayer()
            textRightBorder1.frame = CGRect(x: 0, y: cell.backgroundImageView.frame.height, width: cell.backgroundImageView.frame.width, height: 1)
            textRightBorder1.backgroundColor = UIColor.white.cgColor
            cell.backgroundImageView.layer.addSublayer(textRightBorder1)
        }
        return cell
    }
    
    
    // MARK: Delegate
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
    //        if(indexPath as NSIndexPath).row == 0{
    //
    //            return CGSize(width: contentView.frame.width, height: contentView.frame.height + 100)
    //        }
    //        return contentView.frame.size;
    //    }
    func ResizeImage1(_ image: UIImage, targetWidth: CGFloat) -> UIImage {
        let size = image.size
        
        //        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetWidth / image.size.width
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        //        if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        //        } else {
        //            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        //        }
        
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
        
        //        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetHeight / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        //        if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        //        } else {
        //            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        //        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    @objc func tapOnSpon(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "OpenAd"), object: nil)
        //        let url : NSURL = NSURL(string: delegate.sponserRed)!
        //        if UIApplication.shared.canOpenURL(url as URL) {
        //            UIApplication.shared.openURL(url as URL)
        //        }
    }
    @objc func edit(){
        print("Edit")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "EDITCAR"), object: nil)
    }
    @objc func viewHistory(){
        print("View History")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "VIEWHIS"), object: nil)
        
    }
    @objc func tappedServicing()
    {
        print("Tapped on Servicing")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "SHOWSER"), object: nil)
    }
    
    @objc func tappedExpenses(){
        print("Tapped on Expenses")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SHOWEXP"), object: nil)
    }
    @objc func tappedInsu(){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SHOWINSU"), object: nil)
    }
    @objc func showDoc(){
        //        passData.clickTrack(dataString: "23")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ShowDoc"), object: nil)
    }
    @objc func tappedChauffeur(){
        print("Chauffeur")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "SHOWCHAUFFEUR"), object: nil)
    }
    
    func tappedInsurance(){
        print("Insurance")
    }
    
    @objc func tappedRSA(){
        print("RSA")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "SHOWRSA"), object: nil)
    }
    @objc func tappedCostEst(){
        print("CostEst")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "SHOWESTI"), object: nil)
    }
}

extension ImageCollectionViewCell : imageCollectionViewLayoutDelegate {
    
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        //let photo = arrImageName[indexPath.item]
        
        let image = UIImage(named: arrImageName[(indexPath as NSIndexPath).item])?.decompressedImage
        if(image != nil){
            let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
            let rect  = AVMakeRect(aspectRatio: image!.size, insideRect: boundingRect)
            return rect.size.height
        }
        else{
            return 100
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        //        let annotationPadding = CGFloat(4)
        //        let annotationHeaderHeight = CGFloat(17)
        //        let photo = photos[indexPath.item]
        //        let font = UIFont(name: "AvenirNext-Regular", size: 10)!
        //        let commentHeight = photo.heightForComment(font, width: width)
        //        let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
        return 0
    }
    
    
}
class imgCell: UICollectionViewCell{
    
    var editView = UIView()
    var editImageView = UIImageView()
    var viewHistoryImageView = UIImageView()
    var editLabel = UILabel()
    var editLabelWhite = UILabel()
    var historyView = UIView()
    var viewHistoryLabel = UILabel()
    var viewHistoryLabelWhite = UILabel()
    let drawservicing = DrawServicing()
    let style = Style()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var docImageView = UIImageView()
    var documentsLabel = UILabel()
    var documentsLabelWhite = UILabel()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        editImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(editImageView)
        contentView.addConstraintsWithFormat("H:|-38-[v0]", views: editImageView)
        
        editView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(editView)
        contentView.addConstraintsWithFormat("H:|-38-[v0(30)]", views: editView)
        contentView.addConstraintsWithFormat("V:|-8-[v0]|", views: editView)
        
        viewHistoryImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(viewHistoryImageView)
        contentView.addConstraintsWithFormat("H:[v0]-38-|", views: viewHistoryImageView)
        
        editLabelWhite = drawservicing.makeLabel("", screenWidth: 320, heading: "subHeading")
        editLabelWhite.font = UIFont(name: "HelveticaNeue-Thin", size: 18)//style.editLabelFont
        editLabelWhite.textColor = UIColor.white
        contentView.addSubview(editLabelWhite)
        contentView.addConstraintsWithFormat("H:|-38-[v0]", views: editLabelWhite)
        
        editLabel = drawservicing.makeLabel("", screenWidth: 320, heading: "subHeading")
        editLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)//style.editLabelFont
        editLabelWhite.addSubview(editLabel)
        editLabelWhite.addConstraintsWithFormat("H:|-(-1)-[v0]", views: editLabel)
        editLabelWhite.addConstraintsWithFormat("V:|-(-1)-[v0]", views: editLabel)
        
        viewHistoryLabelWhite = drawservicing.makeLabel("", screenWidth: 320, heading: "subHeading")
        viewHistoryLabelWhite.font = UIFont(name: "HelveticaNeue-Thin", size: 18)//style.editLabelFont
        viewHistoryLabelWhite.textColor = UIColor.white
        contentView.addSubview(viewHistoryLabelWhite)
        contentView.addConstraintsWithFormat("H:[v0]-28-|", views: viewHistoryLabelWhite)
        
        viewHistoryLabel = drawservicing.makeLabel("", screenWidth: 320, heading: "subHeading")
        viewHistoryLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)//style.editLabelFont
        viewHistoryLabelWhite.addSubview(viewHistoryLabel)
        viewHistoryLabelWhite.addConstraintsWithFormat("H:|-(-1)-[v0]", views: viewHistoryLabel)
        viewHistoryLabelWhite.addConstraintsWithFormat("V:|-(-1)-[v0]", views: viewHistoryLabel)
        
        docImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(docImageView)
        let gap = (UIScreen.main.bounds.width-30)/2
        contentView.addConstraintsWithFormat("H:|-(\(gap))-[v0]", views: docImageView)
        
        documentsLabelWhite = drawservicing.makeLabel("", screenWidth: 320, heading: "subHeading")
        documentsLabelWhite.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        documentsLabelWhite.textColor = UIColor.white
        contentView.addSubview(documentsLabelWhite)
        let docGap = (UIScreen.main.bounds.width-90)/2
        contentView.addConstraintsWithFormat("H:|-(\(docGap))-[v0(90)]", views: documentsLabelWhite)
        
        documentsLabel = drawservicing.makeLabel("", screenWidth: 320, heading: "subHeading")
        documentsLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        documentsLabelWhite.addSubview(documentsLabel)
        documentsLabelWhite.addConstraintsWithFormat("H:|-(-1)-[v0]", views: documentsLabel)
        documentsLabelWhite.addConstraintsWithFormat("V:|-(-1)-[v0]", views: documentsLabel)
        
        
        if(DataCreator.sharedInstance.homePageCheck == 0){
            contentView.addConstraintsWithFormat("V:|-40-[v0][v1]", views: editImageView, editLabelWhite)
            contentView.addConstraintsWithFormat("V:|-40-[v0][v1]", views: viewHistoryImageView, viewHistoryLabelWhite)
            contentView.addConstraintsWithFormat("V:|-40-[v0][v1]", views: docImageView, documentsLabelWhite)
        }
        else{
            contentView.addConstraintsWithFormat("V:|-8-[v0]-5-[v1]", views: editImageView, editLabel)
            contentView.addConstraintsWithFormat("V:|-8-[v0]-5-[v1]", views: viewHistoryImageView, viewHistoryLabel)
            contentView.addConstraintsWithFormat("V:|-8-[v0]-5-[v1]", views: docImageView, documentsLabelWhite)
        }
        
        historyView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(historyView)
        contentView.addConstraintsWithFormat("H:[v0(60)]-28-|", views: historyView)
        contentView.addConstraintsWithFormat("V:|-8-[v0]|", views: historyView)
    }
    
}
class sponsorCell: UICollectionViewCell{
    
    
    let drawservicing = DrawServicing()
    let homePageIcon = HomePageIcon()
    let style = Style()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var sponsorLabel = UILabel()
    var backgroundImageView = UIImageView()
    var bottomLine = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        setupView()
        sponsorLabel.translatesAutoresizingMaskIntoConstraints = false
        sponsorLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 14)
        contentView.addSubview(sponsorLabel)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backgroundImageView)
        
        contentView.addConstraintsWithFormat("H:|-7-[v0]", views: sponsorLabel)
        contentView.addConstraintsWithFormat("H:|[v0]|", views: backgroundImageView)
        contentView.addConstraintsWithFormat("V:|-10-[v0(15)]-5-[v1]-30-|", views: sponsorLabel, backgroundImageView)
        
        //        let textRightBorder2 = CALayer()
        //        textRightBorder2.frame = CGRect(x: 0, y: contentView.frame.height, width: contentView.frame.width, height: 1)
        //        textRightBorder2.backgroundColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1).cgColor
        //        contentView.layer.addSublayer(textRightBorder2)
        
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.image = homePageIcon.bottomLine()
        contentView.addSubview(bottomLine)
        contentView.addConstraintsWithFormat("H:|[v0]|", views: bottomLine)
        contentView.addConstraintsWithFormat("V:[v0]|", views: bottomLine)
    }
}
