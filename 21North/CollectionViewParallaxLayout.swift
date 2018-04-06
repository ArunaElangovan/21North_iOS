//
//  CollectionViewParallaxLayout.swift
//  scrolltest
//
//  Created by Sree Kumar on 24/05/16.
//  Copyright © 2016 Norte Technologies India Pvt Ltd. All rights reserved.
//

import UIKit
class CollectionViewParallaxLayout: UICollectionViewLayout {
    var itemSize: CGSize?
    
    var separatorWidth: CGFloat?
    
    override init() {
        super.init()
        self.separatorWidth = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        var boundSize: CGSize = self.collectionView!.bounds.size
        boundSize.width = boundSize.width - separatorWidth!
        self.itemSize = boundSize
    }
    
    override var collectionViewContentSize : CGSize {
        let numberOfItems: Int = self.collectionView!.numberOfItems(inSection: 0)
        let cvSize: CGSize = CGSize(width: (self.collectionView!.bounds.size.width * CGFloat(numberOfItems)), height: self.collectionView!.bounds.size.height)
        return cvSize
    }
    
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> (UICollectionViewLayoutAttributes) {
        //let attributes: UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes.layoutAttributesForCellWithIndexPath(indexPath)
        let attributes: UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.size = itemSize!
        let variablaone = Int(separatorWidth!) * Int((indexPath as NSIndexPath).row)
        let variabletwo = ((indexPath as NSIndexPath).row * Int(self.collectionView!.bounds.size.width - separatorWidth!))
        let variablethree = (self.collectionView!.bounds.size.width - separatorWidth!) / 2
        attributes.center = CGPoint(x: CGFloat(variablaone) + CGFloat(variabletwo) + CGFloat(variablethree), y: self.collectionView!.bounds.size.height / 2)
        return attributes
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //var attributes: [AnyObject] = NSMutableArray() as! [AnyObject]
        var attributes = [UICollectionViewLayoutAttributes]()
        let j = self.collectionView!.numberOfItems(inSection: 0)
        for i in 0  ..< j {
            let indexPath: IndexPath = IndexPath(item: i, section: 0)
            attributes.append(self.layoutAttributesForItem(at: indexPath))
        }
        return attributes
    }
    
}

