//
//  RightViewController.swift
//  21North
//
//  Created by Sachin Tomar on 21/12/16.
//  Copyright © 2016 Sachin Tomar. All rights reserved.
//

import Foundation
import UIKit

class RightViewController : UIViewController {
    
    var width: CGFloat!
    var height: CGFloat!
    
    let drawservicing = DrawServicing()
    let style = Style()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        
        let networkView = UIView()
        networkView.frame = CGRect(x: 0, y: 0, width: width, height: 100)
        networkView.backgroundColor = UIColor.black
        view.addSubview(networkView)
        
        let companyLogo = Companylogo()
        let logo21 = companyLogo.net()
        logo21.translatesAutoresizingMaskIntoConstraints = false
        networkView.addSubview(logo21)
        logo21.autoAlignAxis(toSuperviewAxis: .vertical)
        logo21.autoSetDimension(.width, toSize: 44.0)
        logo21.autoSetDimension(.height, toSize: 20.0)
        logo21.autoPinEdge(toSuperviewEdge: .top, withInset: 17.0)
        
        
        let line = drawservicing.drawLine(-3, y: 22, width: 50, color: "service")
        logo21.layer.addSublayer(line)
        
        
        let contentString1 = NSLocalizedString("We are unable to reach the network at the moment.", comment: "")
        let contentString2 = NSLocalizedString("Please try again after sometime alternatively.", comment: "")
        let contentString3 = NSLocalizedString("Please disable wifi and retry.", comment: "")
        
        let contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.text = contentString1 + contentString2 + contentString3
        contentLabel.font = style.networkFont
        contentLabel.textColor = style.networkFontColor
        contentLabel.textAlignment = .center
        networkView.addSubview(contentLabel)
        contentLabel.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0))
        
        //        let contentLabel2 = drawservicing.makeLabel("Please try again after sometime alternatively", screenWidth: width, heading: "heading")
        //        contentLabel2.font = style.networkFont
        //        contentLabel2.textColor = style.networkFontColor
        //        contentLabel2.textAlignment = .center
        //        networkView.addSubview(contentLabel2)
        //        networkView.addConstraintsWithFormat("H:|[v0]|", views: contentLabel2)
        //
        //        let contentLabel3 = drawservicing.makeLabel("please disable wifi and retry", screenWidth: width, heading: "heading")
        //        contentLabel3.font = style.networkFont
        //        contentLabel3.textColor = style.networkFontColor
        //        contentLabel3.textAlignment = .center
        //        networkView.addSubview(contentLabel3)
        //        networkView.addConstraintsWithFormat("H:|[v0]|", views: contentLabel3)
        //
        //        networkView.addConstraintsWithFormat("V:|-17-[v0(20)]-11-[v1][v2][v3]", views: logo21, contentLabel1, contentLabel2, contentLabel3)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

