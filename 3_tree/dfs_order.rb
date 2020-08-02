
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
    v_order = 0
    result = []
    queue << [root, v_order]
    while queue.length > 0
        node, v_order = queue.pop
        next if node.nil?
        queue << [node.left, v_order - 1] if node.left
        queue << [node.right, v_order + 1] if node.right
        result[v_order] = [] if result[v_order].nil?
        result[v_order] << node.val
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
    result = find_order(root)
    pp result
end

main
