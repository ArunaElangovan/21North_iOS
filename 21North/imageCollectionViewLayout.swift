//
//  imageCollectionViewLayout.swift
//  Parallax
//
//  Created by Sree Kumar on 06/06/16.
//  Copyright © 2016 DevedUpLtd. All rights reserved.
//

import UIKit

class PinterestLayoutAttributes: UICollectionViewLayoutAttributes {
    
    
    var photoHeight: CGFloat = 0.0
    
    
    override func copy(with zone: NSZone?) -> Any {
        let copy = super.copy(with: zone) as! PinterestLayoutAttributes
        copy.photoHeight = photoHeight
        return copy
    }
    
    
    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? PinterestLayoutAttributes {
            if( attributes.photoHeight == photoHeight  ) {
                return super.isEqual(object)
            }
        }
        return false
    }
}

protocol imageCollectionViewLayoutDelegate {
    
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath,
                        withWidth:CGFloat) -> CGFloat
    
    func collectionView(_ collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat
}

class imageCollectionViewLayout: UICollectionViewLayout {
    
    var photoPos: CGFloat = 0.0
    
    var delegate: imageCollectionViewLayoutDelegate!
    
    
    var numberOfColumns = 1
    var cellPadding: CGFloat = 0
    
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    
    fileprivate var contentHeight: CGFloat  = 0.0
    fileprivate var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func prepare() {
        
        if cache.isEmpty {
            
            let columnWidth = contentWidth / CGFloat(numberOfColumns)
            var xOffset = [CGFloat]()
            for column in 0 ..< numberOfColumns {
                xOffset.append(CGFloat(column) * columnWidth )
            }
            var column = 0
            var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
            
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                
                let indexPath = IndexPath(item: item, section: 0)
                
                
                let width = columnWidth - cellPadding * 2
                let photoHeight = delegate.collectionView(collectionView!, heightForPhotoAtIndexPath: indexPath,
                                                          withWidth:width)
                let insets = collectionView!.contentInset
                var height: CGFloat!
                if(DataCreator.sharedInstance.homePageCheck == 0){
                    if(indexPath[1] == 0){
                        print(appDelegate.vehicleArray.count)
                        //                        if(appDelegate.carArray.count > 0){
                        yOffset[column] = yOffset[column] + 80
                        //                        }
                        height = cellPadding + photoHeight + cellPadding - insets.top - insets.bottom + 158
                    }
                    else if(indexPath[1] == 4){
                        height = cellPadding + photoHeight + cellPadding - insets.top - insets.bottom + 60
                    }
                    else{
                        height = cellPadding + photoHeight + cellPadding - insets.top - insets.bottom + 158
                    }
                }
                else{
                    height = cellPadding + photoHeight + cellPadding - insets.top - insets.bottom
                }
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                let attributes = PinterestLayoutAttributes(forCellWith: indexPath)
                attributes.photoHeight = photoHeight
                attributes.frame = insetFrame
                cache.append(attributes)
                
                photoPos = photoPos + photoHeight
                
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + height
                
                column = column >= (numberOfColumns - 1) ? 0 : column+1
                
            }
        }
        
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override var collectionViewContentSize : CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    override class var layoutAttributesClass : AnyClass {
        return PinterestLayoutAttributes.self
    }
    
}

