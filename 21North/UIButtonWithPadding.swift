//
//  UIButtonWithPadding.swift
//  21North
//
//  Created by Aruna Elangovan on 09/02/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

class UIButtonWithPadding: UIButton {
    
    let topInset = CGFloat(2)
    let bottomInset = CGFloat(2)
    let leftInset = CGFloat(10)
    let rightInset = CGFloat(10)
    
    override func draw(_ rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.draw(UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override public var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
}

