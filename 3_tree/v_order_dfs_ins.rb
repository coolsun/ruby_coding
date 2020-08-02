
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
    output = []
    result.keys.sort.each { |x|
        output << result[x]
    }
end


def dfs_insert(arr)
    queue = []
    root = TreeNode.new(arr[0])
    i = 1 
    queue << root
    while queue.length > 0 and i<arr.length
        node = queue.shift
        if !arr[i].nil?
            node.left = TreeNode.new(arr[i])
            queue << node.left
        end
        if !arr[i+1].nil?
            node.right = TreeNode.new(arr[i+1])
            queue << node.right
        end
        i+=2
    end
    root
end

def main
    arr = [0,2,1,3,nil,nil,nil,4,5,nil,7,6,nil,10,8,11,9]
    root = dfs_insert(arr)
    result = find_order(root)
    pp result
end

main
