////
////  ExpenseTrackerHome.swift
////  21North
////
////  Created by Sachin Tomar on 26/08/16.
////  Copyright © 2016 Sachin Tomar. All rights reserved.
////
//
//import UIKit
//import BAFluidView
//import CoreMotion
//
//class ExpenseTrackerHome: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
//    
//    let delegate = UIApplication.shared.delegate as! AppDelegate
//    let constraints = Constraints()
//    let drawservicing = DrawServicing()
//    let shapes = Shapes()
//    
//    var width: CGFloat!
//    var height: CGFloat!
//    
//    var carNumberValue: String!
//    var backButtonImage: UIImageView!
//    var backButton = UIButton()
//    
//    var expenseAmountLabel: UILabel!
//    var avgAmountLabel: UILabel!
//    
//    let graphView = UIView()
//    var fuelCollectionView: UICollectionView!
//    var otherExpCollectionView: UICollectionView!
//    var mileageCollectionView: UICollectionView!
//    
//    let scrollView = UIScrollView()
//    
//    var viewToScroll: UIView!
//    
//    var addFuelView: UIView!
//    var showDateLabel: UILabel!
//    
//    var dateViewForPicker: UIView!
//    var navigationBar: UINavigationBar!
//    
//    var expensesView: UIView!
//    var dateView: UIView!
//    
//    var viewsDictionary = Dictionary<String, UIView>()
//    var metric = Dictionary<String, CGFloat>()
//    var horConstExp:NSArray!
//    var horConstDateView:NSArray!
//    var stationNameLabel: UILabel!
//    
//    var databasePath = NSString()
//    
//    var collectionViewWidth:CGFloat!
//    
//    let readingTextField = UILabel()
//    
//    let litresPickerView = UIPickerView()
//    let stationPickerView = UIPickerView()
//    let amountPickerView = UIPickerView()
//    let expTypePickerView = UIPickerView()
//    let OtherExpPickerView = UIPickerView()
//    let amountTextField = UITextField()
//    
//    let odometerPickerView = UIPickerView()
//    var readingView: UIView!
//    
//    var fuelArray = [[String]]()
//    var expensesArray = [["Date", "Type", "Amount"]]
//    var mileageArray = [["Name", "Mileage"]]
//    var litresArray = ["1", "2", "3", "4", "5"]
//    var amountArray = ["250", "300", "350", "400"]
//    var expenseTypeArray = ["Wash", "Servicing", "Tyre", "Body"]
//    var stationArray = ["HP", "Shell", "Indian Oil"]
//    var odoReading: Array<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
//    var plusCheck = 0
//    var horConstFuelView = NSArray()
//    let expStyle = expFontColor()
//    let motionManager = CMMotionManager()
//    let datePickerView = UIDatePicker()
//    let dateLabelOnTop = UILabel()
//    
//    let date = Date()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        fuelArray = [["Date", "Station", "Litres", "Amount"]]
//        
//        width = UIScreen.main.bounds.width
//        height = UIScreen.main.bounds.height
//        collectionViewWidth = width-50
//        
//        let header = drawservicing.drawHeader()
//        header.image = UIImage(named: "ExpHeader")
//        view.addSubview(header)
//        
//        view.backgroundColor = UIColor(red: 215.0/255.0, green: 213.0/255.0, blue: 213.0/255.0, alpha: 1.0)
//        
//        carNumberValue = delegate.selectedCarNumber
//        
//        let carNumber = drawservicing.makeLabel(carNumberValue, screenWidth: width!, heading: "mainHeading")
//        carNumber.textAlignment = .center
//        header.addSubview(carNumber)
//        
//        if self.motionManager.isDeviceMotionAvailable {
//            self.motionManager.deviceMotionUpdateInterval = 0.3
//        }
//        constraints.labelConstraints(carNumber, view1: header, labelType: "carConstraints")
//        
//        let serviceLabel = drawservicing.makeLabel("", screenWidth: width!, heading: "serviceName")
//        serviceLabel.textAlignment = .center
//        header.addSubview(serviceLabel)
//        
//        constraints.labelConstraints(serviceLabel, view1: header, labelType: "serviceName")
//        
//        let backButton1 = shapes.drawShapes(view, type: "backButton")
//        backButton1.isUserInteractionEnabled = true
//        backButton1.translatesAutoresizingMaskIntoConstraints = false
//        let tapOnBack = UITapGestureRecognizer(target: self, action: #selector(back_btn_clicked))
//        backButton1.addGestureRecognizer(tapOnBack)
//        view.addSubview(backButton1)
//        
//        view.addConstraintsWithFormat("H:|[v0]", views: backButton1)
//        view.addConstraintsWithFormat("V:|-5-[v0]", views: backButton1)
//        
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(scrollView)
//        
//        viewToScroll = drawservicing.addView(1)
//        viewToScroll.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.addSubview(viewToScroll)
//        
//        let fuelTankImageView = UIView()
//        fuelTankImageView.backgroundColor = expStyle.backGroundColor
//        fuelTankImageView.translatesAutoresizingMaskIntoConstraints = false
//        viewToScroll.addSubview(fuelTankImageView)
//        
//        
//        readingTextField.frame = CGRect(x: (width-133)/2, y: 10, width: 133, height: 34)
//        readingTextField.backgroundColor = UIColor.white
//        readingTextField.font = expStyle.odometerFont
//        readingTextField.textColor = expStyle.odometerFontColor
//        readingTextField.textAlignment = .center
//        readingTextField.layer.borderWidth = 1
//        readingTextField.isUserInteractionEnabled = true
//        let tapOnReading = UITapGestureRecognizer(target: self, action: #selector(tapOnReadingFunction))
//        readingTextField.addGestureRecognizer(tapOnReading)
//        let attributedString = NSMutableAttributedString(string: "123456")
//        attributedString.addAttribute(NSAttributedStringKey.kern, value: 4.1, range: NSRange(location: 0, length: attributedString.length - 1))
//        readingTextField.attributedText = attributedString
//        readingTextField.layer.borderColor = expStyle.speedoMeterBorderColor.cgColor
//        fuelTankImageView.addSubview(readingTextField)
//        
//        for i in 0..<5 {
//            let x = 133/6 * (i+1)
//            let path = UIBezierPath()
//            path.move(to: CGPoint(x: x, y: 0))
//            path.addLine(to: CGPoint(x: x, y: 34))
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.path = path.cgPath
//            
//            shapeLayer.lineWidth = 1.0
//            shapeLayer.strokeColor = expStyle.speedoMeterBorderColor.cgColor
//            path.close()
//            readingTextField.layer.addSublayer(shapeLayer)
//        }
//        
//        let beakerView = UIView()
//        beakerView.frame = CGRect(x: 18, y: 52, width: width-36, height: 262)
//        beakerView.layer.borderWidth = 1
//        beakerView.layer.borderColor = expStyle.beakerColor.cgColor
//        beakerView.layer.cornerRadius = 10
//        fuelTankImageView.addSubview(beakerView)
//        
//        let view1 = BAFluidView(frame: CGRect(x: 22, y: 52, width: width-44, height: 258), startElevation: 0.5)
//        view1?.translatesAutoresizingMaskIntoConstraints = false
//        view1?.strokeColor = UIColor(red:0.98, green:0.83, blue:0.23, alpha:1.0)
//        view1?.fillAutoReverse = false
//        view1?.fillRepeatCount = 1
//        view1?.fillColor = UIColor(red:0.98, green:0.83, blue:0.23, alpha:1.0)
//        view1?.fill(to: 0.98)
//        view1?.startAnimation()
//        view1?.startTiltAnimation()
//        view1?.layer.cornerRadius = 10
//        fuelTankImageView.addSubview(view1!)
//        
//        fuelTankImageView.addConstraintsWithFormat("H:|-22-[v0]-22-|", views: view1!)
//        fuelTankImageView.addConstraintsWithFormat("V:|-56-[v0]-10-|", views: view1!)
//        
//        let expenseAndAvgView = drawservicing.addView(1)
//        expenseAndAvgView.backgroundColor = expStyle.backGroundColor
//        viewToScroll.addSubview(expenseAndAvgView)
//        
//        expenseAmountLabel = drawservicing.makeLabel("13011", screenWidth: width, heading: "heading")
//        expenseAmountLabel.textColor = expStyle.ExpFontColor
//        expenseAmountLabel.font = expStyle.expFont
//        expenseAmountLabel.textAlignment = .center
//        expenseAndAvgView.addSubview(expenseAmountLabel)
//        
//        avgAmountLabel = drawservicing.makeLabel("3501", screenWidth: width, heading: "heading")
//        avgAmountLabel.textColor = expStyle.ExpFontColor
//        avgAmountLabel.font = expStyle.expFont
//        avgAmountLabel.textAlignment = .center
//        avgAmountLabel.translatesAutoresizingMaskIntoConstraints = false
//        expenseAndAvgView.addSubview(avgAmountLabel)
//        
//        let expenceThisMonthLabel = drawservicing.makeLabel("Expenses This Month", screenWidth: width, heading: "heading")
//        expenceThisMonthLabel.textColor = expStyle.ExpFontColor
//        expenceThisMonthLabel.font = expStyle.expLabelFont
//        expenceThisMonthLabel.textAlignment = .center
//        expenceThisMonthLabel.numberOfLines = 0
//        expenseAmountLabel.addSubview(expenceThisMonthLabel)
//        
//        let avgLabel = drawservicing.makeLabel("Average", screenWidth: width, heading: "heading")
//        avgLabel.textColor = expStyle.ExpFontColor
//        avgLabel.font = expStyle.expLabelFont
//        avgLabel.textAlignment = .center
//        avgAmountLabel.addSubview(avgLabel)
//        
//        
//        dateLabelOnTop.backgroundColor = expStyle.tilesColor
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM dd, yyyy"
//        let result = formatter.string(from: date)
//        dateLabelOnTop.text = result
//        dateLabelOnTop.textColor = expStyle.ExpFontColor
//        dateLabelOnTop.font = expStyle.dateLabelFont
//        dateLabelOnTop.textAlignment = .center
//        dateLabelOnTop.isUserInteractionEnabled = true
//        let tapOnCurrentDate = UITapGestureRecognizer(target: self, action: #selector(changeDate))
//        dateLabelOnTop.addGestureRecognizer(tapOnCurrentDate)
//        expenseAndAvgView.addSubview(dateLabelOnTop)
//        expenseAndAvgView.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: dateLabelOnTop)
//        
//        expenseAndAvgView.addConstraintsWithFormat("V:|-10-[v0]-5-[v1]-10-[v2(28)]", views: avgAmountLabel, avgLabel, dateLabelOnTop)
//        
//        let addFeulView = drawservicing.addView(2)
//        viewToScroll.addSubview(addFeulView)
//        
//        let fuelLabel = drawservicing.makeLabel("Fuel Expenses", screenWidth: width, heading: "heading")
//        fuelLabel.textColor = expStyle.ExpFontColor
//        fuelLabel.font = expStyle.dateLabelFont
//        fuelLabel.textAlignment = .center
//        fuelLabel.translatesAutoresizingMaskIntoConstraints = false
//        addFeulView.addSubview(fuelLabel)
//        
//        let addFuelTile = UIView()
//        addFuelTile.backgroundColor = expStyle.tilesColor
//        addFuelTile.translatesAutoresizingMaskIntoConstraints = false
//        addFeulView.addSubview(addFuelTile)
//        addFeulView.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: addFuelTile)
//        
//        readingView = drawservicing.addView(1)
//        readingView.isUserInteractionEnabled = true
//        let tapOnReadingView = UITapGestureRecognizer(target: self, action: #selector(hideReadingView))
//        readingView.addGestureRecognizer(tapOnReadingView)
//        readingView.backgroundColor = UIColor(white: 0, alpha: 0.7)
//        view.addSubview(readingView)
//        
//        odometerPickerView.translatesAutoresizingMaskIntoConstraints = false
//        odometerPickerView.delegate = self
//        odometerPickerView.dataSource = self
//        odometerPickerView.backgroundColor = UIColor.white
//        readingView.addSubview(odometerPickerView)
//        readingView.addConstraintsWithFormat("H:|[v0]|", views: odometerPickerView)
//        
//        let navigationBar1 = UINavigationBar(frame: CGRect(x: 0, y: height-190, width: width, height: 40))
//        
//        navigationBar1.backgroundColor = UIColor.white
//        navigationBar1.delegate = self as? UINavigationBarDelegate
//        navigationBar1.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
//        
//        UIBarButtonItem.appearance().tintColor = UIColor.white
//        navigationBar1.backgroundColor = UIColor.brown
//        
//        let navigationItem1 = UINavigationItem()
//        
//        navigationItem1.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(hideReadingView))
//        // Assign the navigation item to the navigation bar
//        navigationBar1.items = [navigationItem1]
//        readingView.addSubview(navigationBar1)
//        
//        litresPickerView.translatesAutoresizingMaskIntoConstraints = false
//        litresPickerView.delegate = self
//        addFuelTile.addSubview(litresPickerView)
//        
//        stationPickerView.translatesAutoresizingMaskIntoConstraints = false
//        stationPickerView.delegate = self
//        addFuelTile.addSubview(stationPickerView)
//        addFuelTile.addConstraintsWithFormat("V:|[v0]|", views: stationPickerView)
//        
//        amountPickerView.translatesAutoresizingMaskIntoConstraints = false
//        amountPickerView.delegate = self
//        addFuelTile.addSubview(amountPickerView)
//        addFuelTile.addConstraintsWithFormat("V:|[v0]|", views: amountPickerView)
//        
//        addFuelTile.addConstraintsWithFormat("H:|[v0(100)][v1(100)][v2(100)]", views: litresPickerView, stationPickerView, amountPickerView)
//        addFuelTile.addConstraintsWithFormat("V:|[v0]|", views: litresPickerView)
//        readingView.addConstraintsWithFormat("V:[v0(150)]|", views: odometerPickerView)
//        
//        
//        let expClass = ExpIcon()
//        
//        let plusFuelIcon = expClass.addFuelExp(buttonText: "Add Fuel Expenses")//shapes.drawShapes(viewToScroll, type: "plus1")
//        plusFuelIcon.isUserInteractionEnabled = true
//        let tapOnFuelIcon = UITapGestureRecognizer(target: self, action: #selector(addFuel))
//        plusFuelIcon.addGestureRecognizer(tapOnFuelIcon)
//        addFeulView.addSubview(plusFuelIcon)
//        
//        let otherExpLabel = drawservicing.makeLabel("Other Expenses", screenWidth: width, heading: "heading")
//        otherExpLabel.textColor = expStyle.ExpFontColor
//        otherExpLabel.font = expStyle.dateLabelFont
//        otherExpLabel.textAlignment = .center
//        otherExpLabel.translatesAutoresizingMaskIntoConstraints = false
//        addFeulView.addSubview(otherExpLabel)
//        
//        let otherExpTile = UIView()
//        otherExpTile.backgroundColor = expStyle.tilesColor
//        otherExpTile.translatesAutoresizingMaskIntoConstraints = false
//        addFeulView.addSubview(otherExpTile)
//        addFeulView.addConstraintsWithFormat("H:|-20-[v0]-20-|", views: otherExpTile)
//        
//        expTypePickerView.translatesAutoresizingMaskIntoConstraints = false
//        expTypePickerView.delegate = self
//        otherExpTile.addSubview(expTypePickerView)
//        otherExpTile.addConstraintsWithFormat("V:|[v0]|", views: expTypePickerView)
//        
//        OtherExpPickerView.translatesAutoresizingMaskIntoConstraints = false
//        OtherExpPickerView.delegate = self
//        otherExpTile.addSubview(OtherExpPickerView)
//        otherExpTile.addConstraintsWithFormat("V:|[v0]|", views: OtherExpPickerView)
//        
//        otherExpTile.addConstraintsWithFormat("H:|[v0(100)][v1(100)]", views: expTypePickerView, OtherExpPickerView)
//        
//        let plusExpIcon = expClass.addFuelExp(buttonText: "Add Other Expenses")//shapes.drawShapes(viewToScroll, type: "plus1")
//        plusExpIcon.isUserInteractionEnabled = true
//        let tapOnAddExp = UITapGestureRecognizer(target: self, action: #selector(addExpenses))
//        plusExpIcon.addGestureRecognizer(tapOnAddExp)
//        addFeulView.addSubview(plusExpIcon)
//        
//        addFeulView.addConstraintsWithFormat("V:|-10-[v0]-5-[v1(66)]-5-[v2]-10-[v3]-[v4(66)]-5-[v5]", views: fuelLabel, addFuelTile, plusFuelIcon, otherExpLabel, otherExpTile, plusExpIcon)
//        
//        graphView.frame = CGRect(x: 25, y: 50, width: width-50, height: 150)
//        graphView.layer.cornerRadius = 8
//        graphView.layer.masksToBounds = true
//        graphView.translatesAutoresizingMaskIntoConstraints = false
//        graphView.backgroundColor = UIColor.gray
//        viewToScroll.addSubview(graphView)
//        
//        drawLine(CGPoint(x: 20.0, y: 10.0), b: CGPoint(x: 20, y: 140), check: 0)
//        drawLine(CGPoint(x: 20.0, y: 140.0), b: CGPoint(x: width-60, y: 140), check: 0)
//        drawLine(CGPoint(x: 20, y: 140), b: CGPoint(x: 50, y: 120), check: 1)
//        
//        let fuelCollView = drawservicing.addView(2)
//        viewToScroll.addSubview(fuelCollView)
//        
//        let fuelCollectionLabel = drawservicing.makeLabel("Fuel", screenWidth: width, heading: "heading")
//        fuelCollectionLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
//        fuelCollectionLabel.textColor = UIColor(white: 0, alpha: 0.7)
//        fuelCollectionLabel.translatesAutoresizingMaskIntoConstraints = false
//        fuelCollView.addSubview(fuelCollectionLabel)
//        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width-50, height: 40)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        
//        let layout1: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout1.itemSize = CGSize(width: UIScreen.main.bounds.width-50, height: 30)
//        layout1.minimumInteritemSpacing = 0
//        layout1.minimumLineSpacing = 0
//        
//        let layout2: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout2.itemSize = CGSize(width: UIScreen.main.bounds.width-50, height: 30)
//        layout2.minimumInteritemSpacing = 0
//        layout2.minimumLineSpacing = 0
//        
//        fuelCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: width!, height: 350), collectionViewLayout: layout)
//        fuelCollectionView.register(expCell.self, forCellWithReuseIdentifier: "Cell")
//        fuelCollectionView.backgroundColor = UIColor.white
//        fuelCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        fuelCollectionView.delegate = self
//        fuelCollectionView.dataSource = self
//        fuelCollView.addSubview(fuelCollectionView)
//        
//        let otherExpView = drawservicing.addView(1)
//        viewToScroll.addSubview(otherExpView)
//        
//        let otherExpensesLabel = drawservicing.makeLabel("Other Expenses", screenWidth: width, heading: "heading")
//        otherExpensesLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
//        otherExpensesLabel.textColor = UIColor(white: 0, alpha: 0.7)
//        otherExpensesLabel.translatesAutoresizingMaskIntoConstraints = false
//        otherExpView.addSubview(otherExpensesLabel)
//        
//        otherExpCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: width!, height: 350), collectionViewLayout: layout1)
//        otherExpCollectionView.register(expCell.self, forCellWithReuseIdentifier: "Cell")
//        otherExpCollectionView.backgroundColor = UIColor.white
//        otherExpCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        otherExpCollectionView.delegate = self
//        otherExpCollectionView.dataSource = self
//        otherExpView.addSubview(otherExpCollectionView)
//        
//        let socialView = drawservicing.addView(2)
//        viewToScroll.addSubview(socialView)
//        
//        let mileageLeaderView = drawservicing.addView(1)
//        viewToScroll.addSubview(mileageLeaderView)
//        
//        let mileageLabel = drawservicing.makeLabel("Mileage Leader", screenWidth: width, heading: "heading")
//        mileageLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
//        mileageLabel.textColor = UIColor(white: 0, alpha: 0.7)
//        mileageLeaderView.addSubview(mileageLabel)
//        
//        mileageCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: width!, height: 350), collectionViewLayout: layout2)
//        mileageCollectionView.register(expCell.self, forCellWithReuseIdentifier: "Cell")
//        mileageCollectionView.backgroundColor = UIColor.white
//        mileageCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        mileageCollectionView.delegate = self
//        mileageCollectionView.dataSource = self
//        mileageLeaderView.addSubview(mileageCollectionView)
//        
//        addFuelView = drawservicing.addView(1)
//        scrollView.addSubview(addFuelView)
//        
//        let litresView = drawservicing.addView(1)
//        addFuelView.addSubview(litresView)
//        
//        let litresLabel = drawservicing.makeLabel("Litres", screenWidth: width, heading: "heading")
//        litresLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
//        litresLabel.textColor = UIColor.orange
//        litresView.addSubview(litresLabel)
//        
//        let line1 = drawservicing.drawLine(0, y: 20, width: width!-23, color: "service")
//        litresLabel.layer.addSublayer(line1)
//        
//        
//        
////////////////////////////////////// Amount View//////////////////////////////////
//        
//        let amountView = drawservicing.addView(2)
//        addFuelView.addSubview(amountView)
//        
//        let amountLabel = drawservicing.makeLabel("Amount", screenWidth: width, heading: "heading")
//        amountLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
//        amountLabel.textColor = UIColor.orange
//        amountView.addSubview(amountLabel)
//        
//        dateView = drawservicing.addView(1)
//        scrollView.addSubview(dateView)
//        
//        let dateLabel = drawservicing.makeLabel("Date", screenWidth: width, heading: "heading")
//        dateLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
//        dateLabel.textColor = UIColor.orange
//        dateView.addSubview(dateLabel)
//        
//        showDateLabel = drawservicing.makeLabel("24th May, 2016", screenWidth: width, heading: "heading")
//        showDateLabel.font = UIFont(name: "HelveticaNeue", size: 12)
//        showDateLabel.textColor = UIColor(white: 0, alpha: 0.7)
//        dateLabel.addSubview(showDateLabel)
//        
//        let changeDateIcon = shapes.drawShapes(dateView, type: "edit")
//        changeDateIcon.isUserInteractionEnabled = true
//        let tapChangeDate = UITapGestureRecognizer(target: self, action: #selector(changeDate))
//        changeDateIcon.addGestureRecognizer(tapChangeDate)
//        dateView.addSubview(changeDateIcon)
//        
//        let stationLabel = drawservicing.makeLabel("Station", screenWidth: width, heading: "heading")
//        stationLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
//        stationLabel.textColor = UIColor(white: 0, alpha: 0.7)
//        showDateLabel.addSubview(stationLabel)
//        
//        stationNameLabel = drawservicing.makeLabel("HP India", screenWidth: width, heading: "subHeading")
//        stationLabel.addSubview(stationNameLabel)
//        
//        let pickFuelStationIcon = shapes.drawShapes(dateView, type: "locationIcon")
//        pickFuelStationIcon.isUserInteractionEnabled = true
//        let fuelStation = UITapGestureRecognizer(target: self, action: #selector(pickFuelStation))
//        pickFuelStationIcon.addGestureRecognizer(fuelStation)
//        dateView.addSubview(pickFuelStationIcon)
//        
//        let addButton = UIButton()
//        addButton.translatesAutoresizingMaskIntoConstraints = false
//        addButton.setTitle("ADD", for: UIControlState())
//        addButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
//        addButton.addTarget(self, action: #selector(addFuelData), for: .touchUpInside)
//        addButton.backgroundColor = UIColor.orange
//        dateView.addSubview(addButton)
//        
////////////////////////////////////// Expenses View//////////////////////////////////
//        
//        expensesView = drawservicing.addView(1)
//        expensesView.isUserInteractionEnabled = true
//        let tap1 = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        expensesView.addGestureRecognizer(tap1)
//        scrollView.addSubview(expensesView)
//        
//        let typeOfExpView = drawservicing.addView(1)
//        expensesView.addSubview(typeOfExpView)
//        
//        let typeOfExpLabel = drawservicing.makeLabel("Type Of Expense", screenWidth: width, heading: "heading")
//        typeOfExpLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
//        typeOfExpLabel.textColor = UIColor(white: 0, alpha: 0.7)
//        typeOfExpView.addSubview(typeOfExpLabel)
//        
//        
//        
//        let amountExpView = drawservicing.addView(2)
//        expensesView.addSubview(amountExpView)
//        
//        let amountLabel1 = drawservicing.makeLabel("Amount", screenWidth: width, heading: "heading")
//        amountLabel1.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
//        amountLabel1.textColor = UIColor(white: 0, alpha: 0.7)
//        amountExpView.addSubview(amountLabel1)
//        
//        amountTextField.translatesAutoresizingMaskIntoConstraints = false
//        amountTextField.layer.borderWidth = 1.0
//        amountTextField.layer.borderColor = UIColor.black.cgColor
//        amountExpView.addSubview(amountTextField)
//        
////////////////////////////////////// Date PickerView//////////////////////////////////
//        
//        dateViewForPicker = drawservicing.addView(1)
//        dateViewForPicker.backgroundColor = UIColor(white: 0, alpha: 0.7)
//        view.addSubview(dateViewForPicker)
//        
//        
//        datePickerView.datePickerMode = .date
//        datePickerView.maximumDate = Date()
//        datePickerView.translatesAutoresizingMaskIntoConstraints = false
//        
//        datePickerView.backgroundColor = UIColor.white
//        dateViewForPicker.addSubview(datePickerView)
//        
//        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: height-190, width: width, height: 40))
//        
//        navigationBar.backgroundColor = UIColor.white
//        navigationBar.delegate = self as? UINavigationBarDelegate
//        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
//        
//        UIBarButtonItem.appearance().tintColor = UIColor.white
//        navigationBar.backgroundColor = UIColor.brown
//        
//        let navigationItem = UINavigationItem()
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(hidePickerView))
//        // Assign the navigation item to the navigation bar
//        navigationBar.items = [navigationItem]
//        dateViewForPicker.addSubview(navigationBar)
//        
//        let viewHt = height - 100
//        
//        viewsDictionary = ["dateViewForPicker": dateViewForPicker, "expensesView": expensesView, "addFuelView": addFuelView, "dateView": dateView, "readingView": readingView]
//        metric = ["height": height, "viewHt" : viewHt, "width": width]
//        
//        viewToScroll.addConstraintsWithFormat("V:|[v0(320)][v1(100)][v2(280)]-10-[v3(150)]-10-[v4(190)][v5(190)][v6(60)][v7(190)]", views: fuelTankImageView, expenseAndAvgView, addFeulView, graphView, fuelCollView, otherExpView, socialView, mileageLeaderView)
//        viewToScroll.addConstraintsWithFormat("H:|[v0]|", views: fuelTankImageView)
//        viewToScroll.addConstraintsWithFormat("H:|[v0]|", views: expenseAndAvgView)
//        viewToScroll.addConstraintsWithFormat("H:|[v0]|", views: addFeulView)
//        viewToScroll.addConstraintsWithFormat("H:|-25-[v0]-25-|", views: graphView)
//        viewToScroll.addConstraintsWithFormat("H:|[v0]|", views: fuelCollView)
//        viewToScroll.addConstraintsWithFormat("H:|[v0]|", views: otherExpView)
//        viewToScroll.addConstraintsWithFormat("H:|[v0]|", views: socialView)
//        viewToScroll.addConstraintsWithFormat("H:|[v0]|", views: mileageLeaderView)
//        
//        expenseAndAvgView.addConstraintsWithFormat("V:|-10-[v0]-5-[v1]", views: expenseAmountLabel, expenceThisMonthLabel)
//        expenseAndAvgView.addConstraintsWithFormat("H:|-30-[v0]-(>=40)-[v1]-70-|", views: expenseAmountLabel, avgAmountLabel)
//        
//        avgAmountLabel.addConstraintsWithFormat("H:|[v0]|", views: avgLabel)
//        expenseAmountLabel.addConstraintsWithFormat("H:|[v0]|", views: expenceThisMonthLabel)
//        
//        
//        addFeulView.addConstraintsWithFormat("H:|-23-[v0]", views: fuelLabel)
//        addFeulView.addConstraintsWithFormat("H:|-20-[v0]", views: plusFuelIcon)
//        
//        addFeulView.addConstraintsWithFormat("H:|-23-[v0]", views: otherExpLabel)
//        addFeulView.addConstraintsWithFormat("H:|-20-[v0]", views: plusExpIcon)
//        
//        fuelCollView.addConstraintsWithFormat("V:|-10-[v0]-5-[v1(150)]", views: fuelCollectionLabel, fuelCollectionView)
//        fuelCollView.addConstraintsWithFormat("H:|-23-[v0]", views: fuelCollectionLabel)
//        fuelCollView.addConstraintsWithFormat("H:|-25-[v0]-25-|", views: fuelCollectionView)
//        
//        otherExpView.addConstraintsWithFormat("V:|-10-[v0]-5-[v1(150)]", views: otherExpensesLabel, otherExpCollectionView)
//        otherExpView.addConstraintsWithFormat("H:|-23-[v0]", views: otherExpensesLabel)
//        otherExpView.addConstraintsWithFormat("H:|-25-[v0]-25-|", views: otherExpCollectionView)
//        
//        mileageLeaderView.addConstraintsWithFormat("V:|-10-[v0]-5-[v1(150)]", views: mileageLabel, mileageCollectionView)
//        mileageLeaderView.addConstraintsWithFormat("H:|-23-[v0]", views: mileageLabel)
//        mileageLeaderView.addConstraintsWithFormat("H:|-25-[v0]-25-|", views: mileageCollectionView)
//        
//        view.addConstraintsWithFormat("H:|[v0]|", views: scrollView)
//        view.addConstraintsWithFormat("V:|-100-[v0]|", views: scrollView)
//        horConstFuelView = NSLayoutConstraint.constraints(withVisualFormat: "H:|-width-[addFuelView(width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric, views: viewsDictionary) as NSArray
//        scrollView.addConstraints(horConstFuelView as! [NSLayoutConstraint])
//        
//        horConstExp = NSLayoutConstraint.constraints(withVisualFormat: "H:|-width-[expensesView(width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric, views: viewsDictionary) as NSArray!
//        scrollView.addConstraints(horConstExp as! [NSLayoutConstraint])
//        scrollView.addConstraintsWithFormat("V:|-100-[v0(300)]", views: expensesView)
//        scrollView.addConstraintsWithFormat("V:|-100-[v0(300)]", views: addFuelView)
//        scrollView.addConstraintsWithFormat("V:|-400-[v0]|", views: dateView)
//        horConstDateView = NSLayoutConstraint.constraints(withVisualFormat: "H:|-width-[dateView(width)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: metric, views: viewsDictionary) as NSArray!
//        scrollView.addConstraints(horConstDateView as! [NSLayoutConstraint])
//        
//        scrollView.addConstraintsWithFormat("H:|[v0(\(width!))]|", views: viewToScroll)
//        scrollView.addConstraintsWithFormat("V:|[v0(1600)]|", views: viewToScroll)
//        
//        addFuelView.addConstraintsWithFormat("V:|[v0(150)][v1(150)]", views: litresView, amountView)
//        addFuelView.addConstraintsWithFormat("H:|[v0]|", views: litresView)
//        addFuelView.addConstraintsWithFormat("H:|[v0]|", views: amountView)
//        
//        litresView.addConstraintsWithFormat("V:|-10-[v0]", views: litresLabel)
//        litresView.addConstraintsWithFormat("H:|-23-[v0]", views: litresLabel)
//        
//        amountView.addConstraintsWithFormat("V:|-10-[v0]", views: amountLabel)
//        amountView.addConstraintsWithFormat("H:|-23-[v0]|", views: amountLabel)
//        
//        dateView.addConstraintsWithFormat("V:|-10-[v0]-10-[v1]-10-[v2]-5-[v3]-20-[v4(23)]", views: dateLabel, showDateLabel, stationLabel, stationNameLabel, addButton)
//        dateView.addConstraintsWithFormat("H:|-23-[v0]", views: dateLabel)
//        dateLabel.addConstraintsWithFormat("H:|[v0]", views: showDateLabel)
//        dateView.addConstraintsWithFormat("V:|-35-[v0]-5-[v1]", views: changeDateIcon, pickFuelStationIcon)
//        dateView.addConstraintsWithFormat("H:[v0]-15-|", views: changeDateIcon)
//        dateView.addConstraintsWithFormat("H:[v0]-15-|", views: pickFuelStationIcon)
//        dateView.addConstraintsWithFormat("H:|-23-[v0(60)]", views: addButton)
//        showDateLabel.addConstraintsWithFormat("H:|[v0]|", views: stationLabel)
//        stationLabel.addConstraintsWithFormat("H:|[v0]|", views: stationNameLabel)
//
//        let const = constraintForView("V:|-height-[dateViewForPicker(height)]", metric: metric as [String : AnyObject], viewsDictionary: viewsDictionary)
//        view.addConstraints(const as! [NSLayoutConstraint])
//        view.addConstraintsWithFormat("H:|[v0]|", views: dateViewForPicker)
//        
//        let const1 = constraintForView("V:|-height-[readingView(height)]", metric: metric as [String : AnyObject], viewsDictionary: viewsDictionary)
//        view.addConstraints(const1 as! [NSLayoutConstraint])
//        view.addConstraintsWithFormat("H:|[v0]|", views: readingView)
//        
//        dateViewForPicker.addConstraintsWithFormat("H:|[v0]|", views: datePickerView)
//        dateViewForPicker.addConstraintsWithFormat("V:[v0(150)]|", views: datePickerView)
//        
//        expensesView.addConstraintsWithFormat("V:|[v0(190)][v1(100)]", views: typeOfExpView, amountExpView)
//        expensesView.addConstraintsWithFormat("H:|[v0]|", views: typeOfExpView)
//        expensesView.addConstraintsWithFormat("H:|[v0]|", views: amountExpView)
//        
//        typeOfExpView.addConstraintsWithFormat("V:|-10-[v0]", views: typeOfExpLabel)
//        typeOfExpView.addConstraintsWithFormat("H:|-23-[v0]", views: typeOfExpLabel)
//        
//        amountExpView.addConstraintsWithFormat("V:|-10-[v0]-10-[v1(23)]", views: amountLabel1, amountTextField)
//        amountExpView.addConstraintsWithFormat("H:|-23-[v0]", views: amountLabel1)
//        amountExpView.addConstraintsWithFormat("H:|-23-[v0(100)]", views: amountTextField)
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(mapLocationSet), name: NSNotification.Name(rawValue: "Location"), object: nil)
//        
//        query()
//        queryForExp()
//        expAmountCheck()
//    }
//    func expAmountCheck(){
//        let calendarcur = Calendar.current
//        let componentscur = (calendarcur as NSCalendar).components([.day , .month , .year], from: date)
//        let curMonthInt = componentscur.month
//        let monthNameArray = calendarcur.monthSymbols
//        var avgAmount:Int = 0
//        for i in 0..<fuelArray.count{
//            let dateOfFuelAdded = fuelArray[i][0]
//            let datebreakUp = dateOfFuelAdded.split(separator: " ").map(String.init)
//            if(datebreakUp[0] == monthNameArray[curMonthInt!-1]){
//                avgAmount += Int(fuelArray[i][3])!
//            }
//        }
//        for i in 0..<expensesArray.count{
//            let dateOfFuelAdded = expensesArray[i][0]
//            let datebreakUp = dateOfFuelAdded.split(separator: " ").map(String.init)
//            if(datebreakUp[0] == monthNameArray[curMonthInt!-1]){
//                avgAmount += Int(expensesArray[i][2])!
//            }
//        }
//        expenseAmountLabel.text = String(avgAmount)
//    }
//    func tapOnFirstDate(){
//        
//    }
//    var insertSQL:String!
//    func saveData(){
//        let contactDB = FMDatabase(path: delegate.databasePath as String)
//        
//        if (contactDB?.open())! {
//            let result = contactDB?.executeUpdate(insertSQL,
//                                                 withArgumentsIn: nil)
//            
//            if !result! {
//                print("Error: \(String(describing: contactDB?.lastErrorMessage()))")
//            } else {
//                print("Contact Added")
//            }
//        } else {
//            print("Error: \(String(describing: contactDB?.lastErrorMessage()))")
//        }
//    }
//    @objc func tapOnReadingFunction(){
//        var readingCharArray = Array(readingTextField.text!.characters)
//        
//        odometerPickerView.selectRow(Int(String(readingCharArray[0]))!, inComponent: 0, animated: false)
//        odometerPickerView.selectRow(Int(String(readingCharArray[1]))!, inComponent: 1, animated: false)
//        odometerPickerView.selectRow(Int(String(readingCharArray[2]))!, inComponent: 2, animated: false)
//        odometerPickerView.selectRow(Int(String(readingCharArray[3]))!, inComponent: 3, animated: false)
//        odometerPickerView.selectRow(Int(String(readingCharArray[4]))!, inComponent: 4, animated: false)
//        odometerPickerView.selectRow(Int(String(readingCharArray[5]))!, inComponent: 5, animated: false)
//        
//        UIView.animate(withDuration: 0.20, animations: {
//            self.readingView.frame.origin.y = 0
//        }, completion: nil)
//        
//    }
//    func query() {
//        let contactDB = FMDatabase(path: delegate.databasePath as String)
//        print(delegate.databasePath)
//        if (contactDB?.open())! {
//            let querySQL = "SELECT * FROM FUEL;"
////            let querySQL = "DROP TABLE FUEL"
//            let results:FMResultSet? = contactDB?.executeQuery(querySQL,
//                                                              withArgumentsIn: nil)
//            fuelArray.removeAll()
//            if((results?.next()) != nil){
//                if(results!.string(forColumn: "CarID") != nil){
//                fuelArray.append([results!.string(forColumn: "Date"), results!.string(forColumn: "Station"), results!.string(forColumn: "Litres"), results!.string(forColumn: "Amount")])
//                
//                while results!.next(){
//                    fuelArray.append([results!.string(forColumn: "Date"), results!.string(forColumn: "Station"), results!.string(forColumn: "Litres"), results!.string(forColumn: "Amount")])
//                    print([results!.string(forColumn: "Date"), results!.string(forColumn: "Station"), results!.string(forColumn: "Litres"), results!.string(forColumn: "Amount")])
//                }
//                }
//            }
//            fuelCollectionView.reloadData()
//            contactDB?.close()
//        } else {
//            print("Error: \(contactDB?.lastErrorMessage())")
//        }
//    }
//    func queryForExp() {
//        let contactDB = FMDatabase(path: delegate.databasePath as String)
//        print(delegate.databasePath)
//        if (contactDB?.open())! {
//            let querySQL = "SELECT * FROM Expenses;"
//            //            let querySQL = "DROP TABLE FUEL"
//            let results:FMResultSet? = contactDB?.executeQuery(querySQL,
//                                                               withArgumentsIn: nil)
//            expensesArray.removeAll()
//            if((results?.next()) != nil){
//                if(results!.string(forColumn: "CarID") != nil){
//                    expensesArray.append([results!.string(forColumn: "Date"), results!.string(forColumn: "Type"), results!.string(forColumn: "Amount")])
//                    
//                    while results!.next(){
//                        expensesArray.append([results!.string(forColumn: "Date"), results!.string(forColumn: "Type"), results!.string(forColumn: "Amount")])
//
//                    }
//                }
//            }
//            fuelCollectionView.reloadData()
//            contactDB?.close()
//        } else {
//            print("Error: \(contactDB?.lastErrorMessage())")
//        }
//    }
//    @objc func mapLocationSet(_ notification: Notification){
//        print("location")
//        let pin = (notification as NSNotification).userInfo!["Location"] as! String
//        stationNameLabel.text = pin
//        stationNameLabel.reloadInputViews()
//    }
//    @objc func pickFuelStation(){
//        let newVC = MapView()
//        newVC.from = 2
//        self.present(newVC, animated: true, completion: nil)
//    }
//    @objc func addFuel(){
//        insertSQL = "INSERT INTO FUEL (CarID, Date, Station, Litres, Amount) VALUES ('\(delegate.selectedCarID)', '\(dateLabelOnTop.text!)', '\(stationArray[stationPickerView.selectedRow(inComponent: 0)])','\(litresArray[litresPickerView.selectedRow(inComponent: 0)])','\(amountArray[amountPickerView.selectedRow(inComponent: 0)])')"
//        saveData()
//        query()
//        expAmountCheck()
//        fuelCollectionView.reloadData()
//    }
//    @objc func addExpenses(){
//        insertSQL = "INSERT INTO Expenses (CarID, Date, Type, Amount) VALUES ('\(delegate.selectedCarID)', '\(dateLabelOnTop.text!)', '\(expenseTypeArray[expTypePickerView.selectedRow(inComponent: 0)])','\(amountArray[OtherExpPickerView.selectedRow(inComponent: 0)])')"
//        saveData()
//        queryForExp()
//        expAmountCheck()
//        otherExpCollectionView.reloadData()
//    }
//    @objc func addFuelData(){
//        UIView.animate(withDuration: 0.20, animations: {
//            self.addFuelView.frame.origin.x = -self.width
//            self.dateView.frame.origin.x = -self.width
//            }, completion: nil)
//        saveData()
//    }
//    @objc func changeDate(){
//        UIView.animate(withDuration: 0.20, animations: {
//                self.dateViewForPicker.frame.origin.y = 0
//            }, completion: nil)
//    }
//    @objc func back_btn_clicked(){
//        self.dismiss(animated: true, completion: nil)
//    }
//    @objc func hideReadingView(){
//        UIView.animate(withDuration: 0.20, animations: {
//            self.readingView.frame.origin.y = self.height
//        }, completion: nil)
//    }
//    @objc func hidePickerView(){
//        UIView.animate(withDuration: 0.20, animations: {
//            self.dateViewForPicker.frame.origin.y = self.height
//            }, completion: nil)
//        let loading = LoadingPage()
//        let d = String(describing: datePickerView.date)
//        let d1 = d.characters.split(separator: " ").map(String.init)
//        let dateForTop = loading.dateFormateChange(d1[0])
//        dateLabelOnTop.text = dateForTop
//    }
//    func drawLine(_ a: CGPoint, b: CGPoint, check:Int){
//        
//        let path1 = UIBezierPath()
//        path1.move(to: a)
//        path1.addLine(to: b)
//        
//        let shapeLayer1 = CAShapeLayer()
//        shapeLayer1.path = path1.cgPath
//        shapeLayer1.strokeColor = UIColor.white.cgColor
//        shapeLayer1.lineWidth = 1.0
//        graphView.layer.addSublayer(shapeLayer1)
//        
//        if(check == 1){
//            shapeLayer1.lineWidth = 2.0
//            let circlePath = UIBezierPath(arcCenter: b, radius: CGFloat(1), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.path = circlePath.cgPath
//            
//            //you can change the stroke color
//            shapeLayer.strokeColor = UIColor.white.cgColor
//            //you can change the line width
//            shapeLayer.lineWidth = 3.0
//            graphView.layer.addSublayer(shapeLayer)
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! expCell
//        let textLeftBorder = rightBorder(0, y: 0, width: 1, height: cell.frame.height)
//        cell.layer.addSublayer(textLeftBorder)
//        viewsDictionary = ["messageTextView": cell.messageTextView, "messageTextView1": cell.messageTextView1, "messageTextView2": cell.messageTextView2, "messageTextView3": cell.messageTextView3]
//        var cellWidth:CGFloat = collectionViewWidth/4
//        metric = ["cellWidth": cellWidth]
//        
//        if(collectionView == fuelCollectionView){
//            
//            let const = constraintForView("H:|[messageTextView(cellWidth)][messageTextView1(cellWidth)][messageTextView2(cellWidth)][messageTextView3]|", metric: metric as [String : AnyObject], viewsDictionary: viewsDictionary)
//            cell.addConstraints(const as! [NSLayoutConstraint])
//            cell.addConstraintsWithFormat("V:|[v0(40)]|", views: cell.messageTextView)
//            cell.addConstraintsWithFormat("V:|[v0(40)]|", views: cell.messageTextView1)
//            cell.addConstraintsWithFormat("V:|[v0(40)]|", views: cell.messageTextView2)
//            cell.addConstraintsWithFormat("V:|[v0(40)]|", views: cell.messageTextView3)
//            
//            cell.messageTextView.text = fuelArray[(indexPath as NSIndexPath).item][0]
//            cell.messageTextView1.text = fuelArray[(indexPath as NSIndexPath).item][1]
//            cell.messageTextView2.text = fuelArray[(indexPath as NSIndexPath).item][2] + " l"
//            cell.messageTextView3.text = "Rs " + fuelArray[(indexPath as NSIndexPath).item][3]
//        
//            let rightBorder1 = rightBorder(cellWidth-1, y: 0, width: 1, height: 40)
//            cell.messageTextView1.layer.addSublayer(rightBorder1)
//        
//            let textRightBorder1 = rightBorder(cellWidth-1, y: 0, width: 1, height: 40)
//            cell.messageTextView2.layer.addSublayer(textRightBorder1)
//        }
//        else if(collectionView == otherExpCollectionView){
//            
//            cellWidth = collectionViewWidth/3
//             metric = ["cellWidth": cellWidth]
//            let const = constraintForView("H:|[messageTextView(cellWidth)][messageTextView1(cellWidth)][messageTextView2]|", metric: metric as [String : AnyObject], viewsDictionary: viewsDictionary)
//            cell.addConstraints(const as! [NSLayoutConstraint])
//            cell.addConstraintsWithFormat("V:|[v0(30)]|", views: cell.messageTextView)
//            cell.addConstraintsWithFormat("V:|[v0(30)]|", views: cell.messageTextView1)
//            cell.addConstraintsWithFormat("V:|[v0(30)]|", views: cell.messageTextView2)
//            
//            cell.messageTextView.text = expensesArray[(indexPath as NSIndexPath).item][0]
//            cell.messageTextView1.text = expensesArray[(indexPath as NSIndexPath).item][1]
//            cell.messageTextView2.text = expensesArray[(indexPath as NSIndexPath).item][2]
//            
//            let rightBorder1 = rightBorder(cellWidth-1, y: 0, width: 1, height: 40)
//            cell.messageTextView1.layer.addSublayer(rightBorder1)
//        }
//        else if(collectionView == mileageCollectionView){
//            cellWidth = collectionViewWidth/2
//            metric = ["cellWidth": cellWidth]
//            
//            let const = constraintForView("H:|[messageTextView(cellWidth)][messageTextView1]|", metric: metric as [String : AnyObject], viewsDictionary: viewsDictionary)
//            cell.addConstraints(const as! [NSLayoutConstraint])
//            cell.addConstraintsWithFormat("V:|[v0(30)]|", views: cell.messageTextView)
//            cell.addConstraintsWithFormat("V:|[v0(30)]|", views: cell.messageTextView1)
//            cell.messageTextView.text = mileageArray[0][0]
//            cell.messageTextView1.text = mileageArray[0][1]
//        }
//        
//        let textRightBorder = rightBorder(cellWidth, y: 0, width: 1, height: cell.frame.height)
//        cell.layer.addSublayer(textRightBorder)
//        
//        let viewRightBorder = rightBorder(cell.frame.width-1, y: 0, width: 1, height: cell.frame.height)
//        cell.layer.addSublayer(viewRightBorder)
//        
//        if((indexPath as NSIndexPath).item == 0){
//            let textBottomBorder = rightBorder(0, y: 0, width: cell.frame.width, height: 1)
//            cell.layer.addSublayer(textBottomBorder)
//        }
//        if (((indexPath as NSIndexPath).item)%2 == 0) {
//            cell.backgroundColor = UIColor.lightGray
//        }
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if(collectionView == fuelCollectionView){
//            return fuelArray.count
//        }
//        else if(collectionView == otherExpCollectionView){
//            return expensesArray.count
//        }
//        else{
//            return fuelArray.count
//        }
//    }
//    func rightBorder(_ x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)->CALayer{
//        
//        let textRightBorder = CALayer()
//        textRightBorder.frame = CGRect(x: x, y: y, width: width, height: height)
//        textRightBorder.backgroundColor = UIColor.black.cgColor
//        return textRightBorder
//    }
//    func numberOfComponents(in pickerView: UIPickerView) -> Int{
//        if(pickerView == odometerPickerView){
//            return 6
//        }
//        return 1
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if(pickerView == litresPickerView){
//            return litresArray.count
//        }
//        else if(pickerView == amountPickerView){
//            return amountArray.count
//        }
//        else if(pickerView == stationPickerView){
//            return stationArray.count
//        }
//        else if(pickerView == OtherExpPickerView){
//            return amountArray.count
//        }
//        else if(pickerView == odometerPickerView){
//            return odoReading.count
//        }
//        else{
//            return expenseTypeArray.count
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if(pickerView == litresPickerView){
//            return litresArray[row] + " ltrs"
//        }
//        else if(pickerView == amountPickerView){
//            return amountArray[row]
//        }
//        else if(pickerView == stationPickerView){
//            return stationArray[row]
//        }
//        else if(pickerView == OtherExpPickerView){
//            return amountArray[row]
//        }
//        else if(pickerView == odometerPickerView){
//            return String(odoReading[row])
//        }
//        else{
//            return expenseTypeArray[row]
//        }
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if(pickerView == litresPickerView){
//            print(litresArray[row])
//        }
//        else if(pickerView == amountPickerView){
//            print(amountArray[row])
//        }
//        else if(pickerView == odometerPickerView){
//            var readingCharArray = Array(readingTextField.text!.characters)
//            switch component {
//            case 0:
//                readingCharArray[0] = odoReading[row]
//                break
//                
//            case 1:
//                readingCharArray[1] = odoReading[row]
//                break
//                
//            case 2:
//                readingCharArray[2] = odoReading[row]
//                break
//                
//            case 3:
//                readingCharArray[3] = odoReading[row]
//                break
//                
//            case 4:
//                readingCharArray[4] = odoReading[row]
//                break
//                
//            case 5:
//                readingCharArray[5] = odoReading[row]
//            default:
//                readingTextField.text = "000000"
//                break
//            }
//            let readingAfterChange = String(readingCharArray)
//            let attributedString = NSMutableAttributedString(string: readingAfterChange)
//            attributedString.addAttribute(NSAttributedStringKey.kern, value: 4.1, range: NSRange(location: 0, length: attributedString.length - 1))
//            readingTextField.attributedText = attributedString
//        }
//    }
//
//    func constraintForView(_ format: String, metric: [String : AnyObject], viewsDictionary: [String: AnyObject])-> NSArray{
//        let horConst:NSArray = NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(rawValue: 0), metrics: metric, views: viewsDictionary) as NSArray
//        return horConst
//    }
//    @objc func hideKeyboard(){
//        view.endEditing(true)
//    }
//}
//class expCell: UICollectionViewCell{
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//    let messageTextView: UITextView = {
//        let messageTextView1 = UITextView()
//        messageTextView1.translatesAutoresizingMaskIntoConstraints = false
//        messageTextView1.backgroundColor = UIColor(white: 0, alpha: 0)
//        messageTextView1.font = UIFont.systemFont(ofSize: 12)
//        messageTextView1.isUserInteractionEnabled = false
//        messageTextView1.textAlignment = .center
//        messageTextView1.isEditable = false
//        return messageTextView1
//    }()
//    
//    let messageTextView1: UITextView = {
//        let messageTextView1 = UITextView()
//        messageTextView1.translatesAutoresizingMaskIntoConstraints = false
//        messageTextView1.backgroundColor = UIColor(white: 0, alpha: 0)
//        messageTextView1.font = UIFont.systemFont(ofSize: 12)
//        messageTextView1.isUserInteractionEnabled = false
//        messageTextView1.textAlignment = .center
//        messageTextView1.isEditable = false
//        return messageTextView1
//    }()
//    let messageTextView2: UITextView = {
//        let messageTextView1 = UITextView()
//        messageTextView1.translatesAutoresizingMaskIntoConstraints = false
//        messageTextView1.backgroundColor = UIColor(white: 0, alpha: 0)
//        messageTextView1.font = UIFont.systemFont(ofSize: 12)
//        messageTextView1.isUserInteractionEnabled = false
//        messageTextView1.textAlignment = .center
//        messageTextView1.isEditable = false
//        return messageTextView1
//    }()
//    let messageTextView3: UITextView = {
//        let messageTextView1 = UITextView()
//        messageTextView1.translatesAutoresizingMaskIntoConstraints = false
//        messageTextView1.backgroundColor = UIColor(white: 0, alpha: 0)
//        messageTextView1.font = UIFont.systemFont(ofSize: 12)
//        messageTextView1.isUserInteractionEnabled = false
//        messageTextView1.textAlignment = .center
//        messageTextView1.isEditable = false
//        return messageTextView1
//    }()
//    func setupView(){
//        addSubview(messageTextView)
//        addSubview(messageTextView1)
//        addSubview(messageTextView2)
//        addSubview(messageTextView3)
//    }
//}

