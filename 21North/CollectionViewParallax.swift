//
// CollectionViewParallax
// iamkel.net
//
//  Created by Michael Henry Pantaleon on 18/07/2014.
//  Copyright (c) 2014 Michael Henry Pantaleon. All rights reserved.
//
// Version 1.0.1
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

protocol CollectionViewParallaxDatasource {
    func numberOfRowsInParallaxView(_ parallaxView: CollectionViewParallax) -> Int
    
    func parallaxView(_ parallaxView: CollectionViewParallax, cellForRowAtIndexPath indexPath: IndexPath) -> UICollectionViewCell
}
protocol CollectionViewParallaxDelegate {
    func parallaxViewDidScrollHorizontally(_ parallaxView: CollectionViewParallax, leftIndex: Int, leftImageLeftMargin: CGFloat, leftImageWidth: CGFloat, rightIndex: Int, rightImageLeftMargin: CGFloat, rightImageWidth: CGFloat)
    
    func parallaxViewDidScrollVertically(_ parallaxView: CollectionViewParallax, topIndex: Int, topImageTopMargin: CGFloat, topImageHeight: CGFloat, bottomIndex: Int, bottomImageTopMargin: CGFloat, bottomImageHeight: CGFloat)
}
enum CollectionViewParallaxType : Int {
    case horizontal = 0
    case vertical = 1
}

class CollectionViewParallax: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    var width: CGFloat?
    var height: CGFloat?
    var pageDivisor: CGFloat?
    var dataCount: Int?
    var separatorWidth: CGFloat?
    
    var parallaxCollectionView: UICollectionView?
    var parallaxViewType: CollectionViewParallaxType?
    var datasource: CollectionViewParallaxDatasource?
    var delegate: CollectionViewParallaxDelegate?
    var currentIndex: Int?
    
    override init(frame:CGRect) {
        
        super.init(frame:frame)
        self.setup(frame, withViewType:.horizontal)
    }
    
    
    func setup(_ frame: CGRect, withViewType viewType: CollectionViewParallaxType) {
        // super.init(frame: frame)
        // if self != nil {
        let layout: CollectionViewParallaxLayout = CollectionViewParallaxLayout()
        self.separatorWidth = 5.0
        layout.separatorWidth = separatorWidth
        //frame.size.width = frame.size.width + separatorWidth
        var framenew:CGRect  = frame;
        framenew.size.width = framenew.size.width + separatorWidth!
        parallaxCollectionView = UICollectionView(frame: framenew, collectionViewLayout: layout)
        parallaxCollectionView!.delegate = self
        parallaxCollectionView!.dataSource = self
        parallaxCollectionView!.isPagingEnabled = true
        parallaxViewType = viewType
        //parallaxCollectionView!.translatesAutoresizingMaskIntoConstraints = false
        addSubview(parallaxCollectionView!)
        // }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.width = self.frame.size.width
        self.height = self.frame.size.height
    }
    
    func registerClass(_ cellClass: AnyClass, forCellWithReuseIdentifier reuseIdentifier: String) {
        parallaxCollectionView!.register(cellClass, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //if datasource.respondsToSelector("numberOfRowsInParallaxView:") {
        if (datasource?.numberOfRowsInParallaxView(self) != nil)
        {
            self.dataCount = datasource!.numberOfRowsInParallaxView(self)//number of screens
        }
        //}
        return dataCount!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //var cell: UICollectionViewCell!
        // if datasource.respondsToSelector("parallaxView:cellForRowAtIndexPath:") {
        //if (datasource?.parallaxView(self, cellForRowAtIndexPath: indexPath) != nil)
        //{
        cell = datasource!.parallaxView(self, cellForRowAtIndexPath: indexPath)
        //        let yOffset:CGFloat = ((collectionView.contentOffset.y - cell.frame.origin.y) / 200) * 25
        //        cell.imageOffset = CGPointMake(0, yOffset)
        //}
        //}
        return cell
    }
    
    var cell: UICollectionViewCell!
    func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        //            print("Row : ",indexPath.row," Section", indexPath.section)
        if (parallaxCollectionView?.cellForItem(at: indexPath) != nil)
        {
            //cell = datasource!.parallaxView(self, cellForRowAtIndexPath: indexPath)
            cell = parallaxCollectionView!.cellForItem(at: indexPath)!
            
            
        }
        return cell
        //return parallaxCollectionView!.cellForItemAtIndexPath(indexPath)!
    }
    
    func dequeueReusableCellWithReuseIdentifier(_ reuseIdentifier: String, forIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        
        return parallaxCollectionView!.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth:Float = 320 ;
        
        let currentOffSet:Float = Float(scrollView.contentOffset.x)
        
        //        print(currentOffSet)
        let targetOffSet:Float = Float(targetContentOffset.pointee.x)
        
        //        print(targetOffSet)
        var newTargetOffset:Float = 0
        
        if(targetOffSet > currentOffSet){
            newTargetOffset = ceilf(currentOffSet / pageWidth) * pageWidth
        }else{
            newTargetOffset = floorf(currentOffSet / pageWidth) * pageWidth
        }
        
        if(newTargetOffset < 0){
            newTargetOffset = 0;
        }else if (newTargetOffset > Float(scrollView.contentSize.width)){
            newTargetOffset = Float(scrollView.contentSize.width)
        }
        
        targetContentOffset.pointee.x = CGFloat(currentOffSet)
        scrollView.setContentOffset(CGPoint(x: CGFloat(newTargetOffset), y: 0), animated: true)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.currentIndex = Int(scrollView.contentOffset.x) / (Int(width!) + Int(separatorWidth!))
        if parallaxViewType == .horizontal {
            
            
            var leftIndex: Int = -1
            var rightIndex: Int = -1
            
            leftIndex = currentIndex!
            
            
            if currentIndex < (dataCount! - 1) {
                rightIndex = leftIndex + 1
                
            }
            let leftImageMargingLeft: CGFloat = scrollView.contentOffset.x > 0 ? ((fmod(scrollView.contentOffset.x + width! + separatorWidth!, width! + separatorWidth!))):0
            let leftImageWidth: CGFloat = (width! + separatorWidth!) - (fmod(abs(scrollView.contentOffset.x + separatorWidth!), width! + separatorWidth!))
            let rightImageMarginLeft: CGFloat = 0.0
            let rightImageWidth: CGFloat = leftImageMargingLeft - separatorWidth!
            //if delegate.respondsToSelector(("parallaxViewDidScrollHorizontally:leftIndex:leftImageLeftMargin:leftImageWidth:rightIndex:rightImageLeftMargin:rightImageWidth:")) {
            if (delegate?.parallaxViewDidScrollHorizontally(self, leftIndex: leftIndex, leftImageLeftMargin: leftImageMargingLeft, leftImageWidth: leftImageWidth, rightIndex: rightIndex, rightImageLeftMargin: rightImageMarginLeft, rightImageWidth: rightImageWidth) != nil)
            {
                self.delegate!.parallaxViewDidScrollHorizontally(self, leftIndex: leftIndex, leftImageLeftMargin: leftImageMargingLeft, leftImageWidth: leftImageWidth, rightIndex: rightIndex, rightImageLeftMargin: rightImageMarginLeft, rightImageWidth: rightImageWidth)
            }
                
            else {
                var topIndex: Int = -1
                var bottomIndex: Int = -1
                topIndex = currentIndex!
                if currentIndex < (dataCount! - 1) {
                    bottomIndex = topIndex + 1
                }
                let topImageTopMargin: CGFloat = scrollView.contentOffset.y > 0 ? ((fmod(scrollView.contentOffset.y + height!, height!))) : 0.0
                //            var topImageHeight: CGFloat = height! - (fmod(abs(scrollView.contentOffset.y), height!))
                //                print("height ",height)
                let topImageHeight: CGFloat = height! - (fmod(abs(scrollView.contentOffset.y), height!))
                //            print("height ",height)
                let bottomImageTopMargin: CGFloat = 0.0
                let bottomImageHeight: CGFloat = topImageTopMargin
                //if delegate.respondsToSelector("parallaxViewDidScrollVertically:topIndex:topImageTopMargin:topImageHeight:bottomIndex:bottomImageTopMargin:bottomImageHeight:") {
                delegate!.parallaxViewDidScrollVertically(self, topIndex: topIndex, topImageTopMargin: topImageTopMargin, topImageHeight: topImageHeight, bottomIndex: bottomIndex, bottomImageTopMargin: bottomImageTopMargin, bottomImageHeight: bottomImageHeight)
                // }
                //        }
            }}
    }
    
    func setCurrentIndexinfo(_ index: Int) {
        self.setCurrentIndex(index, animated: false)
    }
    
    func setCurrentIndex(_ index: Int, animated: Bool) {
        self.currentIndex = index
        parallaxCollectionView!.setContentOffset(CGPoint(x: CGFloat(index) * width!, y: 0.0), animated: animated)
    }
}

