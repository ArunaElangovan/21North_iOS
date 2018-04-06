//
//  UIImage+Decompression.swift
//  RWDevCon
//
//  Created on 24/06/2016.
//  Copyright (c) 2016


import UIKit

extension UIImage {
  
  var decompressedImage: UIImage {
    UIGraphicsBeginImageContextWithOptions(size, true, 0)
    draw(at: CGPoint.zero)
    let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return decompressedImage!
  }
  
}
  
