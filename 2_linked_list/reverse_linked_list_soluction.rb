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
def reverse_list(head)
    return head if head.nil?  # empty list
    p1 = head
    p2 = head.next
    head.next = nil
    while (!p2.nil?)
        t = p2.next
        p2.next = p1
        p1 = p2
        p2 = t
    end
    p1
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
    arr=reverse_list(n)
    print_ll arr
end

main