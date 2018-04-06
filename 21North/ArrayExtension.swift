//
//  ArrayExtension.swift
//  21North
//
//  Created by Aruna Elangovan on 09/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//


import UIKit

extension Array where Element : Collection {
    subscript(column column : Element.Index) -> [ Element.Iterator.Element ] {
        return map { $0[ column ] }
    }
}

extension Array where Element : Collection,
Element.Iterator.Element : Equatable, Element.Index == Int {
    
    func indices(of x: Element.Iterator.Element) -> (Int, Int)? {
        for (i, row) in self.enumerated() {
            if let j = row.index(of: x) {
                return (i, j)
            }
        }
        return nil
    }
}

