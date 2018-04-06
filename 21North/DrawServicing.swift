//
//  DrawServicing.swift
//  21North
//
//  Created by Sachin Tomar on 21/05/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import UIKit
var fsize = CGFloat(0)
class DrawServicing: UIViewController{
    //colors
    
    let lineColor = UIColor(red: 242.0/255.0, green: 103.0/255.0, blue: 33.0/255.0, alpha: 1.0)
    let background1 = UIColor(red: 215.0/255.0, green: 213.0/255.0, blue: 213.0/255.0, alpha: 1.0)
    let background2 = UIColor(red: 236.0/255.0, green: 236.0/255.0, blue: 236.0/255.0, alpha: 1.0)
    let subHeadingColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
    let promocodeColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1.0)
    let lineColor2 = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1.0)
    
    
    func drawLine(_ x:CGFloat,y:CGFloat,width:CGFloat, color:String) -> (CAShapeLayer) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x, y: y+fsize))
        path.addLine(to: CGPoint(x: width, y: y+fsize))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        if(color == "service"){
            shapeLayer.strokeColor = lineColor.cgColor
        }
        else if(color == "account"){
            shapeLayer.strokeColor = lineColor2.cgColor
        }
        else if(color == "setting"){
            shapeLayer.strokeColor = UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0).cgColor
        }
        shapeLayer.lineWidth = 1.0
        path.close()
        return shapeLayer
        
    }
    
    func drawLineUnderLabel(_ x:CGFloat,y:CGFloat, width: CGFloat) -> (CAShapeLayer) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: (width+x), y: y))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        let lineColor = UIColor.white
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 2.0
        path.close()
        return shapeLayer
        
    }
    func drawButton(_ title:String)->(UIButton){
        let button = UIButton()
        button.backgroundColor = lineColor
        button.setTitle(NSLocalizedString(title, comment: ""), for: UIControlState())
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    func backButton(_ header: UIImageView, view1:UIView){
        let shapes = Shapes()
        let backButtonImage = (shapes.drawShapes(header, type: "back"))
        backButtonImage.translatesAutoresizingMaskIntoConstraints = true
        backButtonImage.frame = CGRect(x: 6, y: 22, width: 25, height: 25)
        header.addSubview(backButtonImage)
        
        let backButton = UIButton(frame: CGRect(x: 10, y: 20, width: 60, height: 20))
        backButton.setTitle("Back", for: UIControlState())
        backButton.titleLabel?.textColor = UIColor.white
        //        backButton.addTarget(self, action: #selector(PickupDrop.back_btn_clicked(_:)), forControlEvents: .TouchUpInside)
        view1.addSubview(backButton)
    }
    func makeLabel(_ value:String, screenWidth:CGFloat, heading:String) -> (UILabel){
        
        let label = UILabel()
        if(heading == "mainHeading"){
            label.font = UIFont(name: "HelveticaNeue-CondensedBold" , size: 17)
            label.textColor = UIColor.white
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowOffset = CGSize(width: 0, height: 0)
            label.layer.shadowOpacity = 1
            label.layer.shadowRadius = 6
        }
        else if(heading == "serviceName"){
            label.font = UIFont(name: "HelveticaNeue-CondensedBold" , size: 26)
            label.textColor = UIColor.white
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowOffset = CGSize(width: 0, height: 0)
            label.layer.shadowOpacity = 1
            label.layer.shadowRadius = 6
        }
        else if(heading == "heading"){
            label.font = UIFont(name: "HelveticaNeue" , size: 15)
            label.textColor = UIColor(white: 0, alpha: 1)
        }
        else if(heading == "subHeading"){
            label.font = UIFont(name: "HelveticaNeue" , size: 12)
            label.textColor = subHeadingColor
        }
        else if(heading == "promocode"){
            label.textColor = promocodeColor
        }
        
        label.textAlignment = NSTextAlignment.left
        
        label.text = NSLocalizedString(value, comment: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func addView(_ backGroundColor: CGFloat) -> (UIView){
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        if(backGroundColor==1){
            view1.backgroundColor = background1
        }
        else{
            view1.backgroundColor = background2
            
        }
        
        return view1
        
    }
    ///////////////////////////////////////////////////////////////////////////////////////
    func drawTextField(_ text: String)-> UITextField{
        
        let textField = UITextField();
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString(text, comment: ""), attributes: [NSAttributedStringKey.foregroundColor : UIColor(red: 155/255.0, green: 155/255.0, blue: 155/255.0, alpha: 1.0)])
        
        return textField
    }
    func drawHeader()->UIImageView{
        let screenSize: CGRect = UIScreen.main.bounds
        let width = screenSize.width
        view.backgroundColor = UIColor(red: 242.0/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        let imageName = "servicing"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: width, height: 100)
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 2
        imageView.layer.shadowOffset = CGSize.zero
        imageView.layer.shadowRadius = 5
        
        return imageView
    }
    func touchView()->UIView{
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.isUserInteractionEnabled = true
        return view1
    }
}

