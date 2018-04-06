//
//  verticalCollectionViewCell.swift
//  Parallax
//
//  Created on 24/04/2016.


import UIKit

class verticalCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate{
    
    var backgroundImageView: UIImageView!
    var label: UILabel!
    var subHeadingLabel = UILabel()
    let drawservicing = DrawServicing()
    let homePageIcon = HomePageIcon()
    let style = Style()
    var brandImageView = UIImageView()
    var grad = UIImageView()
    var bottomLine = UIImageView()
    var activeLed = UIImageView()
    var comingSoonLabel = UILabel()
    var screenHeight: CGFloat = 0.0
    var screenWidth: CGFloat = 0.0
    var screenSize: CGRect!
    var sideView:UIView!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        comingSoonLabel.numberOfLines = 0
        comingSoonLabel.lineBreakMode = .byWordWrapping
        
        if(DataCreator.sharedInstance.homePageCheck == 0){
            label = UILabel()
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowOffset = CGSize.zero
            label.layer.shadowRadius = 3.0
            label.layer.masksToBounds = false
            label.layer.opacity = 0.9
            contentView.addSubview(label)
            
            backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 80, width: frame.size.width, height: frame.size.height-148))
            
            label.addSubview(backgroundImageView)
        }
        else{
            backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
            contentView.addSubview(backgroundImageView)
            label = UILabel()
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowOffset = CGSize.zero
            label.layer.shadowRadius = 3.0
            label.layer.masksToBounds = false
            label.layer.opacity = 0.9
            contentView.addSubview(label)
        }
        //        backgroundImageView.contentMode = UIViewContentMode.scaleAspectFill
        self.translatesAutoresizingMaskIntoConstraints = false
        
        comingSoonLabel.translatesAutoresizingMaskIntoConstraints = false
        comingSoonLabel.font = UIFont(name: "Roboto-Medium", size: 12)
        if(DataCreator.sharedInstance.homePageCheck == 0){
            comingSoonLabel.textColor = UIColor(red: 74/255.0, green: 144/255.0, blue: 226/255.0, alpha: 1.0)
            
            grad.translatesAutoresizingMaskIntoConstraints = false
            label.addSubview(grad)
            label.addConstraintsWithFormat("H:|[v0]|", views: grad)
            label.addConstraintsWithFormat("V:|-54-[v0(20)]", views: grad)
            
            bottomLine.translatesAutoresizingMaskIntoConstraints = false
            bottomLine.image = homePageIcon.bottomLine()
            contentView.addSubview(bottomLine)
            contentView.addConstraintsWithFormat("H:|[v0]|", views: bottomLine)
            contentView.addConstraintsWithFormat("V:[v0]|", views: bottomLine)
            
            //            activeLed.translatesAutoresizingMaskIntoConstraints = false
            comingSoonLabel.addSubview(activeLed)
            activeLed.layer.shadowColor = UIColor.black.cgColor
            activeLed.layer.shadowOffset = CGSize(width: -1, height: 1)
            activeLed.layer.shadowOpacity = 0.5
            activeLed.layer.shadowRadius = 1.0
            //            comingSoonLabel.addConstraintsWithFormat("H:[v0(8)]|", views: activeLed)
        }
        else{
            comingSoonLabel.textColor = UIColor.orange
        }
        label.addSubview(comingSoonLabel)
        
        if(DataCreator.sharedInstance.homePageCheck == 0){
            
            brandImageView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(brandImageView)
            contentView.addConstraintsWithFormat("V:|-(-60)-[v0]", views: brandImageView)
            
            label.textColor = UIColor.black
            label.font = style.firstLineFont//UIFont(name: "HelveticaNeue-DeskInterface", size: 20)
            label.textAlignment = .center
            
            subHeadingLabel.textAlignment = .center
            subHeadingLabel.adjustsFontSizeToFitWidth = true
            subHeadingLabel.font = style.secondLineFont//UIFont(name: "HelveticaNeue-Light", size: 14)
            label.addSubview(subHeadingLabel)
            contentView.addConstraintsWithFormat("H:|[v0]|", views: label)
            label.addConstraintsWithFormat("H:|[v0]|", views: subHeadingLabel)
            label.addConstraintsWithFormat("V:|-30-[v0]", views: subHeadingLabel)
            
            comingSoonLabel.textAlignment = .center
            label.addConstraintsWithFormat("H:|[v0]|", views: comingSoonLabel)
            label.addConstraintsWithFormat("V:|-58-[v0]", views: comingSoonLabel)
            
            contentView.addConstraintsWithFormat("V:|-25-[v0]", views: label)
            
            
            
        }
        else{
            label.font = style.firstLineFont//UIFont(name: ".SFUIDisplay-Bold", size: 20)
            label.textColor = style.homePageServiceLaCol
            label.layer.addSublayer(drawservicing.drawLineUnderLabel(0, y: 20, width: 175))
            contentView.addConstraintsWithFormat("H:|-13-[v0]", views: label)
            contentView.addConstraintsWithFormat("V:[v0]-35-|", views: label)
            
            label.addConstraintsWithFormat("H:|[v0]", views: comingSoonLabel)
            label.addConstraintsWithFormat("V:|-26-[v0]", views: comingSoonLabel)
        }
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // for vertical parallax
    
    /*    func parallaxTheImageViewScrollOffset(offsetPoint:CGPoint, scrollDirection:UICollectionViewScrollDirection) {
     // Horizontal? If not, it's vertical
     let isVertical = .vertical == scrollDirection
     
     // Choose the amount of parallax, one might say the distance from the viewer
     // 1 would mean the image wont move at all ie. very far away, 0.1 it moves a little i.e. very close
     let factor: CGFloat = 0.5
     let parallaxFactorX: CGFloat = isVertical ? factor : 0.0
     let parallaxFactorY: CGFloat = isVertical ? 0.0 : factor
     
     // Calculate the image position and apply the parallax factor
     let finalX = (offsetPoint.x - self.frame.origin.x) * parallaxFactorX
     let finalY = (offsetPoint.y - self.frame.origin.y) * parallaxFactorY
     
     print("Final ", finalX, "Final y", finalY)
     
     // Now we have final position, set the offset of the frame of the background iamge
     //        let frame = collectionView.bounds
     //        let offsetFame = CGRectOffset(frame, CGFloat(finalX), CGFloat(finalY))
     //
     //        collectionView.frame = offsetFame
     }
     */
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if layoutAttributes is PinterestLayoutAttributes {
            //imageViewHeightLayoutConstraint.constant = attributes.photoHeight
            //backgroundImageView.frame = CGRectMake(0, attributes.photoPos, 320, attributes.photoHeight)
            //label.frame = CGRectMake(0, attributes.photoPos, 320, attributes.photoHeight)
        }
    }
    
}

