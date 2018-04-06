//
//  Awaiting.swift
//
//  Code generated using QuartzCode 1.55.0 on 11/01/17.
//  www.quartzcodeapp.com
//

import UIKit


class Awaiting: UIView, CAAnimationDelegate {
    
    var layers : Dictionary<String, AnyObject> = [:]
    var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
    var updateLayerValueForCompletedAnimation : Bool = true
    
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperties()
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupProperties()
        setupLayers()
    }
    
    override var frame: CGRect{
        didSet{
            setupLayerFrames()
        }
    }
    
    override var bounds: CGRect{
        didSet{
            setupLayerFrames()
        }
    }
    
    func setupProperties(){
        
    }
    
    func setupLayers(){
        let rectangle = CAShapeLayer()
        self.layer.addSublayer(rectangle)
        rectangle.anchorPoint = CGPoint(x: 0, y: 0)
        rectangle.frame       = CGRect(x: 0, y: 0, width: 0.46875 * rectangle.superlayer!.bounds.width, height:  rectangle.superlayer!.bounds.height)
        rectangle.fillColor   = UIColor(red:1, green: 0.502, blue:0, alpha:1).cgColor
        rectangle.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).cgColor
        rectangle.lineWidth   = 0
        layers["rectangle"] = rectangle
        
        let rectangle2 = CAShapeLayer()
        self.layer.addSublayer(rectangle2)
        rectangle2.anchorPoint = CGPoint(x: 0, y: 0)
        rectangle2.frame       = CGRect(x: 0.53125 * rectangle2.superlayer!.bounds.width, y: 0, width: 0.46875 * rectangle2.superlayer!.bounds.width, height:  rectangle2.superlayer!.bounds.height)
        rectangle2.fillColor   = UIColor(red:1, green: 0.502, blue:0, alpha:1).cgColor
        rectangle2.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).cgColor
        rectangle2.lineWidth   = 0
        layers["rectangle2"] = rectangle2
        setupLayerFrames()
    }
    
    func setupLayerFrames(){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if let rectangle : CAShapeLayer = layers["rectangle"] as? CAShapeLayer{
            rectangle.frame = CGRect(x: 0, y: 0, width: 0.46875 * rectangle.superlayer!.bounds.width, height:  rectangle.superlayer!.bounds.height)
            rectangle.path  = rectanglePath(bounds: (layers["rectangle"] as! CAShapeLayer).bounds).cgPath
        }
        
        if let rectangle2 : CAShapeLayer = layers["rectangle2"] as? CAShapeLayer{
            rectangle2.frame = CGRect(x: 0.53125 * rectangle2.superlayer!.bounds.width, y: 0, width: 0.46875 * rectangle2.superlayer!.bounds.width, height:  rectangle2.superlayer!.bounds.height)
            rectangle2.path  = rectangle2Path(bounds: (layers["rectangle2"] as! CAShapeLayer).bounds).cgPath
        }
        
        CATransaction.commit()
    }
    
    //MARK: - Animation Setup
    
    func addUntitled1Animation(){
        let fillMode : String = kCAFillModeForwards
        
        ////An infinity animation
        
        let rectangle = layers["rectangle"] as! CAShapeLayer
        
        ////Rectangle animation
        let rectanglePositionAnim            = CAKeyframeAnimation(keyPath:"position")
        rectanglePositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0, y: 0)), NSValue(cgPoint: CGPoint(x: -0.39849 * rectangle.superlayer!.bounds.width, y: 0))]
        rectanglePositionAnim.keyTimes       = [0, 1]
        rectanglePositionAnim.duration       = 1.52
        rectanglePositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        rectanglePositionAnim.repeatCount    = Float.infinity
        
        let rectangleUntitled1Anim : CAAnimationGroup = QCMethod.group(animations: [rectanglePositionAnim], fillMode:fillMode)
        rectangle.add(rectangleUntitled1Anim, forKey:"rectangleUntitled1Anim")
        
        let rectangle2 = layers["rectangle2"] as! CAShapeLayer
        
        ////Rectangle2 animation
        let rectangle2PositionAnim            = CAKeyframeAnimation(keyPath:"position")
        rectangle2PositionAnim.values         = [NSValue(cgPoint: CGPoint(x: 0.53125 * rectangle2.superlayer!.bounds.width, y: 0)), NSValue(cgPoint: CGPoint(x: 0.85339 * rectangle2.superlayer!.bounds.width, y: 0))]
        rectangle2PositionAnim.keyTimes       = [0, 1]
        rectangle2PositionAnim.duration       = 1.52
        rectangle2PositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        rectangle2PositionAnim.repeatCount    = Float.infinity
        
        let rectangle2Untitled1Anim : CAAnimationGroup = QCMethod.group(animations: [rectangle2PositionAnim], fillMode:fillMode)
        rectangle2.add(rectangle2Untitled1Anim, forKey:"rectangle2Untitled1Anim")
    }
    
    //MARK: - Animation Cleanup
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        if let completionBlock = completionBlocks[anim]{
            completionBlocks.removeValue(forKey: anim)
            if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
                updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
                removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
            }
            completionBlock(flag)
        }
    }
    
    func updateLayerValues(forAnimationId identifier: String){
        if identifier == "Untitled1"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["rectangle"] as! CALayer).animation(forKey: "rectangleUntitled1Anim"), theLayer:(layers["rectangle"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["rectangle2"] as! CALayer).animation(forKey: "rectangle2Untitled1Anim"), theLayer:(layers["rectangle2"] as! CALayer))
        }
    }
    
    func removeAnimations(forAnimationId identifier: String){
        if identifier == "Untitled1"{
            (layers["rectangle"] as! CALayer).removeAnimation(forKey: "rectangleUntitled1Anim")
            (layers["rectangle2"] as! CALayer).removeAnimation(forKey: "rectangle2Untitled1Anim")
        }
    }
    
    func removeAllAnimations(){
        for layer in layers.values{
            (layer as! CALayer).removeAllAnimations()
        }
    }
    
    //MARK: - Bezier Path
    
    func rectanglePath(bounds: CGRect) -> UIBezierPath{
        let rectanglePath = UIBezierPath(rect:bounds)
        return rectanglePath
    }
    
    func rectangle2Path(bounds: CGRect) -> UIBezierPath{
        let rectangle2Path = UIBezierPath(rect:bounds)
        return rectangle2Path
    }
    
    
}

