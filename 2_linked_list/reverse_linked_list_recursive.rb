# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} head
# @return {ListNode}
require 'pp'
def reverse_list(p1, p2)
    if p2.next.nil?
        p2.next = p1
        p2
    else
        root = reverse_list(p1.next, p2.next)
        p2.next = p1
        root
    end
end
def print_ll(head)
    output = []
    while !head.nil?
        output << head.val
        head = head.next
    end
    pp output
end

def main
    list = [1,2,3,4,5]
    n = p = nil
    list.reverse.each_with_index { |e, index|
        n = ListNode.new(e, p)
        p = n
    }
    print_ll n
    arr=reverse_list(n, n.next)
    n.next = nil
    print_ll arr
end

main