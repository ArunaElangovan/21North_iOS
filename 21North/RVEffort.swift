//
//  RVEffort.swift
//
//  Code generated using QuartzCode 1.55.0 on 02/02/17.
//  www.quartzcodeapp.com
//

import UIKit


class RVEffort: UIView, CAAnimationDelegate {
	
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
		let Group = CALayer()
		self.layer.addSublayer(Group)
		
		layers["Group"] = Group
		let rectangle = CAShapeLayer()
		Group.addSublayer(rectangle)
		rectangle.anchorPoint = CGPoint(x: 1, y: 1)
		rectangle.frame       = CGRect(x: 0, y: 0.76837 * rectangle.superlayer!.bounds.height, width: 0.11955 * rectangle.superlayer!.bounds.width, height: 0.23163 * rectangle.superlayer!.bounds.height)
		rectangle.opacity     = 0
		rectangle.fillColor   = UIColor.orange.cgColor
		rectangle.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).cgColor
		rectangle.lineWidth   = 0
		layers["rectangle"] = rectangle
		let rectangle2 = CAShapeLayer()
		Group.addSublayer(rectangle2)
		rectangle2.anchorPoint = CGPoint(x: 1, y: 1)
		rectangle2.frame       = CGRect(x: 0.21519 * rectangle2.superlayer!.bounds.width, y: 0.61395 * rectangle2.superlayer!.bounds.height, width: 0.11955 * rectangle2.superlayer!.bounds.width, height: 0.38605 * rectangle2.superlayer!.bounds.height)
		rectangle2.opacity     = 0
		rectangle2.fillColor   = UIColor.orange.cgColor
		rectangle2.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).cgColor
		rectangle2.lineWidth   = 0
		layers["rectangle2"] = rectangle2
		let rectangle3 = CAShapeLayer()
		Group.addSublayer(rectangle3)
		rectangle3.anchorPoint = CGPoint(x: 1, y: 1)
		rectangle3.frame       = CGRect(x: 0.44023 * rectangle3.superlayer!.bounds.width, y: 0.45273 * rectangle3.superlayer!.bounds.height, width: 0.11955 * rectangle3.superlayer!.bounds.width, height: 0.54727 * rectangle3.superlayer!.bounds.height)
		rectangle3.opacity     = 0
		rectangle3.fillColor   = UIColor.orange.cgColor
		rectangle3.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).cgColor
		rectangle3.lineWidth   = 0
		layers["rectangle3"] = rectangle3
		let rectangle4 = CAShapeLayer()
		Group.addSublayer(rectangle4)
		rectangle4.anchorPoint = CGPoint(x: 1, y: 1)
		rectangle4.frame       = CGRect(x: 0.66526 * rectangle4.superlayer!.bounds.width, y: 0.30355 * rectangle4.superlayer!.bounds.height, width: 0.11955 * rectangle4.superlayer!.bounds.width, height: 0.69645 * rectangle4.superlayer!.bounds.height)
		rectangle4.opacity     = 0
		rectangle4.fillColor   = UIColor.orange.cgColor
		rectangle4.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).cgColor
		rectangle4.lineWidth   = 0
		layers["rectangle4"] = rectangle4
		let rectangle5 = CAShapeLayer()
		Group.addSublayer(rectangle5)
		rectangle5.anchorPoint = CGPoint(x: 1, y: 1)
		rectangle5.frame       = CGRect(x: 0.88045 * rectangle5.superlayer!.bounds.width, y: 0.15068 * rectangle5.superlayer!.bounds.height, width: 0.11955 * rectangle5.superlayer!.bounds.width, height: 0.84932 * rectangle5.superlayer!.bounds.height)
		rectangle5.opacity     = 0
		rectangle5.fillColor   = UIColor.orange.cgColor
		rectangle5.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).cgColor
		rectangle5.lineWidth   = 0
		layers["rectangle5"] = rectangle5
		let oval = CAShapeLayer()
		Group.addSublayer(oval)
		oval.fillColor   = UIColor.white.cgColor
		oval.strokeColor = UIColor(red:0.329, green: 0.329, blue:0.329, alpha:1).cgColor
		oval.lineWidth   = 0
		layers["oval"] = oval
		let path = CAShapeLayer()
		Group.addSublayer(path)
		path.fillColor   = nil
		path.strokeColor = UIColor.black.cgColor
		path.lineWidth   = 0
		layers["path"] = path
		setupLayerFrames()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let Group : CALayer = layers["Group"] as? CALayer{
			Group.frame = CGRect(x: 0.22191 * Group.superlayer!.bounds.width, y: 0.38216 * Group.superlayer!.bounds.height, width: 0.31368 * Group.superlayer!.bounds.width, height: 0.48569 * Group.superlayer!.bounds.height)
		}
		
		if let rectangle : CAShapeLayer = layers["rectangle"] as? CAShapeLayer{
			rectangle.frame = CGRect(x: 0, y: 0.76837 * rectangle.superlayer!.bounds.height, width: 0.11955 * rectangle.superlayer!.bounds.width, height: 0.23163 * rectangle.superlayer!.bounds.height)
			rectangle.path  = rectanglePath(bounds: (layers["rectangle"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let rectangle2 : CAShapeLayer = layers["rectangle2"] as? CAShapeLayer{
			rectangle2.frame = CGRect(x: 0.21519 * rectangle2.superlayer!.bounds.width, y: 0.61395 * rectangle2.superlayer!.bounds.height, width: 0.11955 * rectangle2.superlayer!.bounds.width, height: 0.38605 * rectangle2.superlayer!.bounds.height)
			rectangle2.path  = rectangle2Path(bounds: (layers["rectangle2"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let rectangle3 : CAShapeLayer = layers["rectangle3"] as? CAShapeLayer{
			rectangle3.frame = CGRect(x: 0.44023 * rectangle3.superlayer!.bounds.width, y: 0.45273 * rectangle3.superlayer!.bounds.height, width: 0.11955 * rectangle3.superlayer!.bounds.width, height: 0.54727 * rectangle3.superlayer!.bounds.height)
			rectangle3.path  = rectangle3Path(bounds: (layers["rectangle3"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let rectangle4 : CAShapeLayer = layers["rectangle4"] as? CAShapeLayer{
			rectangle4.frame = CGRect(x: 0.66526 * rectangle4.superlayer!.bounds.width, y: 0.30355 * rectangle4.superlayer!.bounds.height, width: 0.11955 * rectangle4.superlayer!.bounds.width, height: 0.69645 * rectangle4.superlayer!.bounds.height)
			rectangle4.path  = rectangle4Path(bounds: (layers["rectangle4"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let rectangle5 : CAShapeLayer = layers["rectangle5"] as? CAShapeLayer{
			rectangle5.frame = CGRect(x: 0.88045 * rectangle5.superlayer!.bounds.width, y: 0.15068 * rectangle5.superlayer!.bounds.height, width: 0.11955 * rectangle5.superlayer!.bounds.width, height: 0.84932 * rectangle5.superlayer!.bounds.height)
			rectangle5.path  = rectangle5Path(bounds: (layers["rectangle5"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let oval : CAShapeLayer = layers["oval"] as? CAShapeLayer{
			oval.frame = CGRect(x: 0.01195 * oval.superlayer!.bounds.width, y: 0.66459 * oval.superlayer!.bounds.height, width: 0.09564 * oval.superlayer!.bounds.width, height: 0.06177 * oval.superlayer!.bounds.height)
			oval.path  = ovalPath(bounds: (layers["oval"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let path : CAShapeLayer = layers["path"] as? CAShapeLayer{
			path.frame = CGRect(x: 0.05881 * path.superlayer!.bounds.width, y: 0, width: 0.8622 * path.superlayer!.bounds.width, height: 0.74401 * path.superlayer!.bounds.height)
			path.path  = pathPath(bounds: (layers["path"] as! CAShapeLayer).bounds).cgPath
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addStartAnimation(){
		let fillMode : String = kCAFillModeForwards
		
		////An infinity animation
		
		let Group = layers["Group"] as! CALayer
		
		////Group animation
		let GroupPositionAnim          = CAKeyframeAnimation(keyPath:"position")
		GroupPositionAnim.values       = [NSValue(cgPoint: CGPoint(x: 0.37875 * Group.superlayer!.bounds.width, y: 0.625 * Group.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.37875 * Group.superlayer!.bounds.width, y: 0.625 * Group.superlayer!.bounds.height))]
		GroupPositionAnim.keyTimes     = [0, 1]
		GroupPositionAnim.duration     = 4.02
		GroupPositionAnim.autoreverses = true
		
		let GroupStartAnim : CAAnimationGroup = QCMethod.group(animations: [GroupPositionAnim], fillMode:fillMode)
		Group.add(GroupStartAnim, forKey:"GroupStartAnim")
		
		////Rectangle animation
		let rectangleOpacityAnim          = CAKeyframeAnimation(keyPath:"opacity")
		rectangleOpacityAnim.values       = [0, 1, 1]
		rectangleOpacityAnim.keyTimes     = [0, 0.107, 1]
		rectangleOpacityAnim.duration     = 4
		rectangleOpacityAnim.repeatCount  = Float.infinity
		rectangleOpacityAnim.autoreverses = true
		
		let rectangleStartAnim : CAAnimationGroup = QCMethod.group(animations: [rectangleOpacityAnim], fillMode:fillMode)
		layers["rectangle"]?.add(rectangleStartAnim, forKey:"rectangleStartAnim")
		
		////Rectangle2 animation
		let rectangle2OpacityAnim            = CAKeyframeAnimation(keyPath:"opacity")
		rectangle2OpacityAnim.values         = [0, 0, 1, 1]
		rectangle2OpacityAnim.keyTimes       = [0, 0.179, 0.354, 1]
		rectangle2OpacityAnim.duration       = 4.01
		rectangle2OpacityAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionDefault)
		rectangle2OpacityAnim.repeatCount    = Float.infinity
		rectangle2OpacityAnim.autoreverses   = true
		
		let rectangle2StartAnim : CAAnimationGroup = QCMethod.group(animations: [rectangle2OpacityAnim], fillMode:fillMode)
		layers["rectangle2"]?.add(rectangle2StartAnim, forKey:"rectangle2StartAnim")
		
		////Rectangle3 animation
		let rectangle3OpacityAnim          = CAKeyframeAnimation(keyPath:"opacity")
		rectangle3OpacityAnim.values       = [0, 0, 1, 1]
		rectangle3OpacityAnim.keyTimes     = [0, 0.463, 0.561, 1]
		rectangle3OpacityAnim.duration     = 4.01
		rectangle3OpacityAnim.repeatCount  = Float.infinity
		rectangle3OpacityAnim.autoreverses = true
		
		let rectangle3StartAnim : CAAnimationGroup = QCMethod.group(animations: [rectangle3OpacityAnim], fillMode:fillMode)
		layers["rectangle3"]?.add(rectangle3StartAnim, forKey:"rectangle3StartAnim")
		
		////Rectangle4 animation
		let rectangle4OpacityAnim          = CAKeyframeAnimation(keyPath:"opacity")
		rectangle4OpacityAnim.values       = [0, 0, 1, 1]
		rectangle4OpacityAnim.keyTimes     = [0, 0.612, 0.742, 1]
		rectangle4OpacityAnim.duration     = 4.01
		rectangle4OpacityAnim.repeatCount  = Float.infinity
		rectangle4OpacityAnim.autoreverses = true
		
		let rectangle4StartAnim : CAAnimationGroup = QCMethod.group(animations: [rectangle4OpacityAnim], fillMode:fillMode)
		layers["rectangle4"]?.add(rectangle4StartAnim, forKey:"rectangle4StartAnim")
		
		////Rectangle5 animation
		let rectangle5OpacityAnim          = CAKeyframeAnimation(keyPath:"opacity")
		rectangle5OpacityAnim.values       = [0, 0, 1, 1]
		rectangle5OpacityAnim.keyTimes     = [0, 0.788, 0.933, 1]
		rectangle5OpacityAnim.duration     = 4.01
		rectangle5OpacityAnim.repeatCount  = Float.infinity
		rectangle5OpacityAnim.autoreverses = true
		
		let rectangle5StartAnim : CAAnimationGroup = QCMethod.group(animations: [rectangle5OpacityAnim], fillMode:fillMode)
		layers["rectangle5"]?.add(rectangle5StartAnim, forKey:"rectangle5StartAnim")
		
		let oval = layers["oval"] as! CAShapeLayer
		
		////Oval animation
		let ovalPositionAnim            = CAKeyframeAnimation(keyPath:"position")
		ovalPositionAnim.path           = pathPath(bounds: (layers["path"]?.superlayer??.convert((layers["path"] as! CAShapeLayer).frame, to:layers["oval"]?.superlayer))!).cgPath
		ovalPositionAnim.duration       = 3.99
		ovalPositionAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		ovalPositionAnim.repeatCount    = Float.infinity
		ovalPositionAnim.autoreverses   = true
		
		let ovalStartAnim : CAAnimationGroup = QCMethod.group(animations: [ovalPositionAnim], fillMode:fillMode)
		oval.add(ovalStartAnim, forKey:"ovalStartAnim")
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
		if identifier == "start"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["Group"] as! CALayer).animation(forKey: "GroupStartAnim"), theLayer:(layers["Group"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["rectangle"] as! CALayer).animation(forKey: "rectangleStartAnim"), theLayer:(layers["rectangle"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["rectangle2"] as! CALayer).animation(forKey: "rectangle2StartAnim"), theLayer:(layers["rectangle2"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["rectangle3"] as! CALayer).animation(forKey: "rectangle3StartAnim"), theLayer:(layers["rectangle3"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["rectangle4"] as! CALayer).animation(forKey: "rectangle4StartAnim"), theLayer:(layers["rectangle4"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["rectangle5"] as! CALayer).animation(forKey: "rectangle5StartAnim"), theLayer:(layers["rectangle5"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["oval"] as! CALayer).animation(forKey: "ovalStartAnim"), theLayer:(layers["oval"] as! CALayer))
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "start"{
			(layers["Group"] as! CALayer).removeAnimation(forKey: "GroupStartAnim")
			(layers["rectangle"] as! CALayer).removeAnimation(forKey: "rectangleStartAnim")
			(layers["rectangle2"] as! CALayer).removeAnimation(forKey: "rectangle2StartAnim")
			(layers["rectangle3"] as! CALayer).removeAnimation(forKey: "rectangle3StartAnim")
			(layers["rectangle4"] as! CALayer).removeAnimation(forKey: "rectangle4StartAnim")
			(layers["rectangle5"] as! CALayer).removeAnimation(forKey: "rectangle5StartAnim")
			(layers["oval"] as! CALayer).removeAnimation(forKey: "ovalStartAnim")
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
	
	func rectangle3Path(bounds: CGRect) -> UIBezierPath{
		let rectangle3Path = UIBezierPath(rect:bounds)
		return rectangle3Path
	}
	
	func rectangle4Path(bounds: CGRect) -> UIBezierPath{
		let rectangle4Path = UIBezierPath(rect:bounds)
		return rectangle4Path
	}
	
	func rectangle5Path(bounds: CGRect) -> UIBezierPath{
		let rectangle5Path = UIBezierPath(rect:bounds)
		return rectangle5Path
	}
	
	func ovalPath(bounds: CGRect) -> UIBezierPath{
		let ovalPath = UIBezierPath(ovalIn:bounds)
		return ovalPath
	}
	
	func pathPath(bounds: CGRect) -> UIBezierPath{
		let pathPath = UIBezierPath()
		let minX = CGFloat(bounds.minX), minY = bounds.minY, w = bounds.width, h = bounds.height;
		
		pathPath.move(to: CGPoint(x:minX + 0.00041 * w, y: minY + 0.99625 * h))
		pathPath.addCurve(to: CGPoint(x:minX + 0.23063 * w, y: minY + 0.74972 * h), controlPoint1:CGPoint(x:minX + -0.00877 * w, y: minY + 0.95557 * h), controlPoint2:CGPoint(x:minX + 0.13814 * w, y: minY + 0.56162 * h))
		pathPath.addCurve(to: CGPoint(x:minX + 0.49277 * w, y: minY + 0.53586 * h), controlPoint1:CGPoint(x:minX + 0.32311 * w, y: minY + 0.93781 * h), controlPoint2:CGPoint(x:minX + 0.38883 * w, y: minY + 0.34605 * h))
		pathPath.addCurve(to: CGPoint(x:minX + 0.69561 * w, y: minY + 0.32564 * h), controlPoint1:CGPoint(x:minX + 0.59671 * w, y: minY + 0.72568 * h), controlPoint2:CGPoint(x:minX + 0.52283 * w, y: minY + 0.13773 * h))
		pathPath.addCurve(to: CGPoint(x:minX + 0.90556 * w, y: minY + 0.00355 * h), controlPoint1:CGPoint(x:minX + 0.8593 * w, y: minY + 0.50367 * h), controlPoint2:CGPoint(x:minX + 0.80683 * w, y: minY + 0.03978 * h))
		pathPath.addCurve(to: CGPoint(x:minX + w, y: minY + 0.14763 * h), controlPoint1:CGPoint(x:minX + 1.00429 * w, y: minY + -0.03268 * h), controlPoint2:CGPoint(x:minX + 0.98909 * w, y: minY + 0.07391 * h))
		
		return pathPath
	}
	
	
}
