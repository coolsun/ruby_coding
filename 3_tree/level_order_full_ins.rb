
#https://leetcode.com/problems/binary-tree-level-order-traversal/
require 'pp'
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = nil, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} root
# @return {Integer[][]}
def find_order(root)
    queue = []
    depth = 0
    result = []
    queue << [root, depth]
    while queue.length > 0
        node, depth = queue.shift
        queue << [node.left, depth + 1] if node.left
        queue << [node.right, depth + 1] if node.right
        result[depth] = [] if result[depth].nil?
        result[depth] << node.val
    end
    result
end


def insert(arr, root, i, n)
    if i <= n
        return nil if arr[i].nil?
        root = TreeNode.new(arr[i])
        root.left = insert(arr, root.left, 2*i+1, n)
        root.right = insert(arr, root.right, 2*i+2, n)
    end
    root
end

def main
    queue = []
    arr = [3,9,20,nil,nil,15,7]
    root = insert(arr, root, 0, arr.length-1)
    pp find_order(root)
    arr = [0,2,1,3,nil,nil,nil,4,5,nil,7,6,nil,10,8,11,9]
    root = insert(arr, root, 0, arr.length-1)
    pp find_order(root)
end

main
