//
//  QueueHelper.swift
//  Challenge
//
//  Created by Jenel Myers on 7/17/17.
//  Copyright © 2017 PetSmart. All rights reserved.
//

import Foundation

typealias QueueOperation = () -> Void

class QueueHelper {
    fileprivate let mainQueue: OperationQueue
    
    fileprivate static let sharedInstance = QueueHelper()
    fileprivate init() {
        self.mainQueue = OperationQueue.main
    }
    
    class func executeOnMainQueue(_ block: @escaping QueueOperation) {
        QueueHelper.sharedInstance.mainQueue.addOperation(block)
    }
    
    // MARK: - Dispatch Groups (multiple synchronized async calls)
    
    class func callGroup() -> DispatchGroup {
        return DispatchGroup()
    }
    
    class func enter(_ group: DispatchGroup) {
        group.enter()
    }
    
    class func onGroupCompletion(_ group: DispatchGroup, block: @escaping ()->()) {
        group.notify(queue: DispatchQueue.main, execute: block)
    }
    
    class func leave(_ group: DispatchGroup) {
        group.leave()
    }
}
