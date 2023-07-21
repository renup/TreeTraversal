//
//  TreeNode.swift
//  TreeTraversal
//
//  Created by renupunjabi on 7/19/23.
//

import Foundation

protocol TreeNodeProtocol {
    
}

struct TreeNode: TreeNodeProtocol {
    let rootValue: Int
    let left: TreeNodeProtocol?
    let right: TreeNodeProtocol?
        
    init() {
        rootValue = 0
        left = nil
        right = nil
    }
    
    init(rootValue: Int) {
        self.rootValue = rootValue
        left = nil
        right = nil
    }
    
    init(rootValue: Int, left: TreeNode?, right: TreeNode?) {
        self.rootValue = rootValue
        self.left = left
        self.right = right
    }
    
}









