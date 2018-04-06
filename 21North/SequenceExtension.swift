//
//  SequenceExtension.swift
//  21North
//
//  Created by Aruna Elangovan on 22/01/18.
//  Copyright © 2018 Sachin Tomar. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var alreadyAdded = Set<Iterator.Element>()
        return self.filter { alreadyAdded.insert($0).inserted }
    }
}

