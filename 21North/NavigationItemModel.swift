//
//  NavigationItemModel.swift
//  21North
//
//  Created by Aruna Elangovan on 29/12/17.
//  Copyright © 2017 Sachin Tomar. All rights reserved.
//

import UIKit
import Foundation

enum NavigationItemType {
    case imageAndTitle
    case imageOnly
    case titleOnly
}

class NavigationItemModel: NSObject {
    var title: String?
    var image: UIImage?
    var highlitedImage: UIImage?
    var action: Selector?
    var itemType: NavigationItemType!
    
    override init() {
        super.init()
    }
    
    /** If NavgiationItemType is ImageAndTitle then title, image, action and type parameters must be provided. For ImageOnly image, action and type parameters required */
    init(title: String?, image: UIImage?, highlitedImage: UIImage?, action: Selector!, type: NavigationItemType!) {
        super.init()
        
        self.title = title
        self.image = image
        self.highlitedImage = highlitedImage
        self.action = action
        self.itemType = type
    }
}
