//
//  YUTableViewNode.swift
//  YUTableView-Swift
//
//  Created by yücel uzun on 16/07/15.
//  Copyright © 2015 Yücel Uzun. All rights reserved.
//

public func ==(lhs: YUTableViewNode, rhs: YUTableViewNode) -> Bool {
    return lhs.nodeId == rhs.nodeId
}

open class YUTableViewNode: Equatable {
    fileprivate static var nextId: Int = 0
    fileprivate weak var parent: YUTableViewNode!
    fileprivate var nodeId: Int
    
    /** Use this to set your custom data for the node. Like label names */
    open var data: AnyObject!
    /** Cell identifier of this node.
     - Warning: If you're using custom ".xib" file for your cell, you should register it before using it
     */
    open var cellIdentifier: String! // Don't forget register nib
    /** Children of this node */
    open var childNodes: [YUTableViewNode]! {
        didSet {
            setNodeAsParentOfChildren()
        }
    }
    /** Is children are displayed. YUTableView uses this and you probably don't need it. */
    open var isActive: Bool = false
    
    
    public init (childNodes: [YUTableViewNode]? = nil, data: AnyObject? = nil, cellIdentifier: String = "") {
        YUTableViewNode.nextId += 1
        nodeId = YUTableViewNode.nextId
        self.childNodes = childNodes
        setNodeAsParentOfChildren()
        self.data = data
        self.cellIdentifier = cellIdentifier == "" ? nil : cellIdentifier
    }
    
    fileprivate func setNodeAsParentOfChildren () {
        if childNodes != nil {
            for node in childNodes {
                node.parent = self
            }
        }
    }
    
    open func getParent () -> YUTableViewNode? {
        return parent
    }
    
    open func hasChildren() -> Bool {
        return childNodes != nil && childNodes.count != 0
    }
    
}

