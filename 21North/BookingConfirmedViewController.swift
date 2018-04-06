//
//  BookingConfirmedViewController.swift
//  21North
//
//  Created by Aruna Elangovan on 27/03/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import UIKit

class BookingConfirmedViewController: UIViewController {
    
    var check: CheckMarkView!
    var successLabel = UILabel()
    var okButton = UIButton()
    var containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        addMask()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissBookingForm(){
        //        self.parent?.dismiss(animated: true, completion: nil)
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        //        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.presentingViewController?.presentedViewController?.dismiss(animated: false, completion: nil)
        self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    func addMask(){
        if(check==nil){
            self.containerView.frame = CGRect(x: (self.presentingViewController?.view.bounds.width)!/2-130, y: (self.presentingViewController?.view.bounds.height)!/2-130, width: 260, height: 260)
            view.backgroundColor = UIColor(white: 0, alpha: 0.7)
            containerView.backgroundColor = UIColor.white
            containerView.layer.cornerRadius = 20
            self.view.addSubview(containerView)
            check = CheckMarkView.init(point: CGPoint(x: 100, y: 60), tickImage: UIImage(named: "red-tick.png")!)
            self.containerView.addSubview(check)
            successLabel = UILabel.init(frame: CGRect(x: containerView.bounds.width/2-100, y: 160, width: 200, height: 20))
            successLabel.textAlignment = .center
            successLabel.text = "Successfully booked!"
            successLabel.textColor = UIColor.black
            self.containerView.addSubview(successLabel)
            okButton = UIButton.init(frame: CGRect(x: containerView.bounds.width/2-50, y: 200, width: 100, height: 30))
            okButton.titleLabel?.textAlignment = .center
            okButton.setTitle("OK", for: .normal)
            okButton.backgroundColor = UIColor.orange
            okButton.layer.cornerRadius = 5
            okButton.titleLabel?.textColor = UIColor.white
            self.containerView.addSubview(okButton)
            okButton.addTarget(self, action: #selector(dismissBookingForm), for: .touchUpInside)
            okButton.isHidden = true
        }
        check.AnimateCheckMark()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            // Put your code which should be executed with a delay here
            //            self.dismiss(animated: true, completion: nil)
            self.dismissBookingForm()
        })
    }
}

