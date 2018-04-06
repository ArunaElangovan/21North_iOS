//
//  UITextFieldWithPadding.swift
//  21North
//
//  Created by Aruna Elangovan on 28/12/17.
//  Copyright © 2017 Sachin Tomar. All rights reserved.
//

import UIKit

class UITextFieldWithPadding: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10.0, dy: 8.0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10.0, dy: 8.0)
    }
}

