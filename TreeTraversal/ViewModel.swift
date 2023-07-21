//
//  ViewModel.swift
//  TreeTraversal
//
//  Created by renupunjabi on 7/19/23.
//

import Foundation

// https://levelup.gitconnected.com/depth-and-breadth-first-search-using-swift-ecd19324543a

final class ViewModel: ObservableObject {
    
    // Breadth first search
    // print each level
    
    // Depth first search
    // In-order
    // left -> root -> right
    // pre-order
    // root -> left -> right
    // post-order
    // left -> right -> root
    
    let one = TreeNode(rootValue: 1)
    let three = TreeNode(rootValue: 3)
    let five = TreeNode(rootValue: 5)
    let seven = TreeNode(rootValue: 7)
    
    let two: TreeNode
    let six: TreeNode
    let four: TreeNode
    
    @Published var result = [Int]()
    var queue = [TreeNode]()
    
    init() {
        two = TreeNode(rootValue: 2, left: one, right: three)
        six = TreeNode(rootValue: 6, left: five, right: seven)
        four = TreeNode(rootValue: 4, left: two, right: six)
        
//        let _ = inOrderSearch(rootNode: four)
//        let _ = preOrderSearch(rootNode: four)
//        let _ = postOrderSearch(rootNode: four)
        breadthFirstSearch(rootNode: four)
        print(result)
    }
    
    // result = [1, 2, 3 4, 5, 6, 7]
    func inOrderSearch(rootNode: TreeNode?) -> TreeNode? {
        if rootNode == nil {
            return rootNode
        }
        
        inOrderSearch(rootNode: rootNode?.left as? TreeNode)
        
        if let root = rootNode {
            result.append(root.rootValue)
        }
        
       inOrderSearch(rootNode: rootNode?.right as? TreeNode)
        return rootNode
    }
    
    // result = [4, 2, 1, 3, 6, 5, 7]
    func preOrderSearch(rootNode: TreeNode?) -> TreeNode? {
        if rootNode == nil {
            return rootNode
        }
        
        if let root = rootNode {
            result.append(root.rootValue)
        }
        preOrderSearch(rootNode: rootNode?.left as? TreeNode)
        preOrderSearch(rootNode: rootNode?.right as? TreeNode)
        return rootNode
    }
    
    // result = [1, 3, 2, 5, 7, 6, 4]
    func postOrderSearch(rootNode: TreeNode?) -> TreeNode? {
        if rootNode == nil {
            return rootNode
        }
        postOrderSearch(rootNode: rootNode?.left as? TreeNode)
        postOrderSearch(rootNode: rootNode?.right as? TreeNode)
        
        if let root = rootNode {
            result.append(root.rootValue)
        }
        
        return rootNode
    }
    
    // result = [4, 2, 6, 1,3, 5, 7]
    func breadthFirstSearch(rootNode: TreeNode?) {
        guard let rootNode = rootNode else { return }
        
        if queue.isEmpty {
            queue.append(rootNode)
        }
        
        while !queue.isEmpty {
            let counter = queue.count
            
            for _ in 0..<counter {
                let removedEle = queue.removeFirst()
                result.append(removedEle.rootValue)
                if let leftNode = removedEle.left {
                    queue.append((leftNode as! TreeNode)) }
                if let rightNode = removedEle.right {
                    queue.append(rightNode as! TreeNode) }
                
            }
        }
    }
}
