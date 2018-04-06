//
//  ChooseModelSubModelViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 17/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

protocol ChooseModelSubModelVCDelegate {
    func dismissChooseBrandVC()
}
protocol ChooseModelSubModelVCDelegate1 {
    func updateModel()
}

class ChooseModelSubModelViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource, SocketManagerDelegate4{
    var scrollView  = UIScrollView.newAutoLayout()
    var contentView = UIView.newAutoLayout()
    var modelPicker = UIPickerView()
    var subModelPicker = UIPickerView()
    var addVehicleButton = UIButtonWithPadding()
    var drawservicing = DrawServicing()
    var shapes = Shapes()
    var width: CGFloat!
    var height: CGFloat!
    let appdelegate = UIApplication.shared.delegate as? AppDelegate
    var imageViewHt: CGFloat!
    var imageViewWt: CGFloat!
    var newHt: CGFloat!
    var newWt: CGFloat!
    var chooseModelVCDelegate: ChooseModelSubModelVCDelegate?
    var chooseModelVCDelegate1: ChooseModelSubModelVCDelegate1?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appdelegate?.conn.delegate4 = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Set default value for selected submodel
        if DataCreator.sharedInstance.fullVehicleData.vehiclemodelid.isEmpty{
            DataCreator.sharedInstance.fullVehicleData.model = DataCreator.sharedInstance.modelArray[0].model
            DataCreator.sharedInstance.fullVehicleData.vehiclemodelid = DataCreator.sharedInstance.modelArray[0].id
            DataCreator.sharedInstance.fullVehicleData.sub_model_name = DataCreator.sharedInstance.subModelArray[0].submodel
            DataCreator.sharedInstance.fullVehicleData.sub_model_id = DataCreator.sharedInstance.subModelArray[0].id
        }
        //        appdelegate?.conn.delegate4 = self
        setupUI()
    }
    
    //MARK: UI setup
    func setupUI(){
        let style = Style()
        subTitle = NSLocalizedString("ChooseModelText", comment: "")
        subTitleFont = style.firstLineFont!
        subTitleColor = UIColor.white
        pageTitle = DataCreator.sharedInstance.selectedVehicleNumber
        titleFont = style.titleFont!
        titleColor = UIColor.white
        
        let backButton = shapes.drawShapes(type: "backButton")
        let closeButtonItem = NavigationItemModel(title: "", image: backButton, highlitedImage: nil, action: #selector(backButtonClicked) , type: NavigationItemType.imageOnly)
        setLeftButtonItems(closeButtonItem)
        
        headerImage = UIImage(named: "servicing")
        view.backgroundColor = UIColor(red: 242.0/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.autoPinEdgesToSuperviewEdges(with: (UIEdgeInsetsMake((headerImage?.size.height)!, 0.0, 0.0, 0.0)))
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.autoPinEdgesToSuperviewEdges()
        contentView.autoMatch(.width, to: .width, of: view)
        contentView.isUserInteractionEnabled = true
        
        contentView.addSubview(modelPicker)
        modelPicker.translatesAutoresizingMaskIntoConstraints = false
        modelPicker.backgroundColor = UIColor.white
        modelPicker.showsSelectionIndicator = true
        modelPicker.autoSetDimension(.height, toSize: 100)
        modelPicker.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(30, 20, 0, 20), excludingEdge: .bottom)
        modelPicker.delegate = self
        modelPicker.dataSource = self
        
        contentView.addSubview(subModelPicker)
        subModelPicker.translatesAutoresizingMaskIntoConstraints = false
        subModelPicker.backgroundColor = UIColor.white
        subModelPicker.showsSelectionIndicator = true
        subModelPicker.autoPinEdge(.top, to: .bottom, of: modelPicker, withOffset: 30)
        subModelPicker.autoSetDimension(.height, toSize: 100)
        subModelPicker.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        subModelPicker.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        subModelPicker.delegate = self
        subModelPicker.dataSource = self
        
        contentView.addSubview(addVehicleButton)
        addVehicleButton.backgroundColor = UIColor.orange
        if DataCreator.sharedInstance.modelPageTriggeredFrom == "EditPage" || DataCreator.sharedInstance.modelPageTriggeredFrom == "EditBrandPage"{
            addVehicleButton.setTitle(NSLocalizedString("UpdateVehicleText", comment: ""), for: UIControlState())
        }
        else{
            addVehicleButton.setTitle(NSLocalizedString("AddVehicleText", comment: ""), for: UIControlState())
        }
        addVehicleButton.titleLabel?.textColor = UIColor.white
        addVehicleButton.translatesAutoresizingMaskIntoConstraints = false
        addVehicleButton.addTarget(self, action: #selector(addVehicleButtonClicked), for: UIControlEvents.touchUpInside)
        addVehicleButton.autoPinEdge(.top, to: .bottom, of: subModelPicker, withOffset: 30)
        addVehicleButton.autoSetDimension(.width, toSize: 100, relation: .greaterThanOrEqual)
        addVehicleButton.autoAlignAxis(toSuperviewAxis: .vertical)
        addVehicleButton.autoPinEdge(.bottom, to: .bottom, of: contentView, withOffset: -20)
        addVehicleButton.layer.cornerRadius = 5
        addVehicleButton.clipsToBounds = true
        
        if !DataCreator.sharedInstance.fullVehicleData.sub_model_id.isEmpty{
            for i in 0 ..< DataCreator.sharedInstance.subModelArray.count{
                if DataCreator.sharedInstance.fullVehicleData.sub_model_id == DataCreator.sharedInstance.subModelArray[i].id{
                    subModelPicker.selectRow(i, inComponent: 0, animated: true)
                    break
                }
            }
            for i in 0 ..< DataCreator.sharedInstance.modelArray.count{
                if DataCreator.sharedInstance.fullVehicleData.vehiclemodelid == DataCreator.sharedInstance.modelArray[i].id{
                    modelPicker.selectRow(i, inComponent: 0, animated: true)
                    break
                }
            }
        }
        else{
            subModelPicker.reloadAllComponents()
            subModelPicker.selectRow(0, inComponent: 0, animated: true)
        }
    }
    
    //MARK: Action handling
    @objc func backButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            
        }
        DataCreator.sharedInstance.modelPageTriggeredFrom = ""
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addVehicleButtonClicked(){
        if #available(iOS 10.0, *) {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            
        }
        if DataCreator.sharedInstance.fullVehicleData.sub_model_id.isEmpty{
            DataCreator.sharedInstance.fullVehicleData.sub_model_id = DataCreator.sharedInstance.subModelArray[0].id
        }
        
        if DataCreator.sharedInstance.networkCheck == "1"{
            if DataCreator.sharedInstance.modelPageTriggeredFrom == "EditPage" || DataCreator.sharedInstance.modelPageTriggeredFrom == "EditBrandPage"{
                appdelegate?.conn.send("\(Constants.RequestStates.UpdateVehicleBrand)|\(DataCreator.sharedInstance.selectedVehicleID)|\(DataCreator.sharedInstance.selectedVehicleNumber)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemake_id)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemodelid)|\(DataCreator.sharedInstance.fullVehicleData.sub_model_id)|")
                return
            }
            appdelegate?.conn.send("\(Constants.RequestStates.AddVehicle)|\(DataCreator.sharedInstance.selectedVehicleNumber)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemake_id)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemodelid)|\(DataCreator.sharedInstance.fullVehicleData.sub_model_id)|")
        }
        else{
            ToastManager.internetError()
        }
    }
    
    //MARK: PickerView delegate
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == modelPicker){
            return DataCreator.sharedInstance.modelArray.count
        }
        else{
            return DataCreator.sharedInstance.subModelArray.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == modelPicker{
            DataCreator.sharedInstance.fullVehicleData.vehiclemodelid = DataCreator.sharedInstance.modelArray[row].id
            DataCreator.sharedInstance.fullVehicleData.model = DataCreator.sharedInstance.modelArray[row].model
            DataCreator.sharedInstance.shouldReloadSubModel = true
            if DataCreator.sharedInstance.networkCheck == "1"{
                appdelegate?.conn.send("\(Constants.RequestStates.VehicleSubModels)|\(DataCreator.sharedInstance.fullVehicleData.vehiclemodelid)|")
            }
            else{
                ToastManager.internetError()
            }
            return
        }
        DataCreator.sharedInstance.fullVehicleData.sub_model_id = DataCreator.sharedInstance.subModelArray[row].id
        DataCreator.sharedInstance.fullVehicleData.sub_model_name = DataCreator.sharedInstance.subModelArray[row].submodel
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.adjustsFontSizeToFitWidth = true
        pickerLabel.textAlignment = .center
        var titleData: String
        if pickerView == modelPicker{
            titleData = DataCreator.sharedInstance.modelArray[row].model
        }
        else{
            titleData = DataCreator.sharedInstance.subModelArray[row].submodel
        }
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "HelveticaNeue", size: 20)!,NSAttributedStringKey.foregroundColor:UIColor.black])
        pickerLabel.attributedText = myTitle
        return pickerLabel
    }
    
    func reloadSubModel(){
        subModelPicker.reloadAllComponents()
        DataCreator.sharedInstance.fullVehicleData.sub_model_id = DataCreator.sharedInstance.subModelArray[0].id
        DataCreator.sharedInstance.fullVehicleData.sub_model_name = DataCreator.sharedInstance.subModelArray[0].submodel
    }
    
    func dismissChooseModelSubModelVC(){
        if DataCreator.sharedInstance.modelPageTriggeredFrom == "BrandsPage"{
            var userId = DataCreator.sharedInstance.signupResponse.userId
            if userId.isEmpty{
                userId = DataCreator.sharedInstance.loginResponse.userId
            }
            if userId == "-1"{
                self.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
            }
            else{
                self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
            }
        }
        else if DataCreator.sharedInstance.modelPageTriggeredFrom == "EditPage"{
            chooseModelVCDelegate1?.updateModel()
            self.dismiss(animated: true, completion: nil)
        }
        else if DataCreator.sharedInstance.modelPageTriggeredFrom == "EditBrandPage"{
            self.chooseModelVCDelegate?.dismissChooseBrandVC()
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }
        DataCreator.sharedInstance.modelPageTriggeredFrom = ""
    }
}

