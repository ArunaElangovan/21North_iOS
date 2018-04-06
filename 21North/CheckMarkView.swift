//
//  CheckMarkView.swift
//  CheckMarkAnimation
//
//  Created by Aruna Elangovan on 27/03/18.
//  Copyright © 2018 Jitendra Gochhayat. All rights reserved.
//

import UIKit

class CheckMarkView: UIView{
    var maskingView: UIView!
    var tickImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    init(point: CGPoint, tickImage: UIImage) {
        let frame = CGRect(x: point.x, y: point.y, width: tickImage.size.width, height: tickImage.size.height)
        super.init(frame: frame)
        maskingView = UIView (frame: CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: 0, height: 0))
        self.addSubview(maskingView)
        tickImageView = UIImageView(image: tickImage)
        maskingView.addSubview(tickImageView)
        tickImageView.frame = self.bounds
        maskingView.clipsToBounds = true
        self.clipsToBounds = true
    }
    
    func AnimateCheckMark(){
        UIView.animateKeyframes(withDuration: 1.2, delay: 0, options: .beginFromCurrentState, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6, animations: {
                self.maskingView.frame=CGRect(x: self.bounds.origin.x,y: self.bounds.origin.y,width: self.bounds.size.width/2,height: self.bounds.size.height)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.6, animations: {
                self.maskingView.frame=CGRect(x: self.bounds.origin.x,y: self.bounds.origin.y,width: self.bounds.size.width,height: self.bounds.size.height)
            })
        }, completion: nil)
    }
}

