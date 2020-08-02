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
    if (head.nil? || head.next.nil?)
        return head;
    end
 
    #get second node    
    second = head.next;
    #set first's next to be null
    head.next = nil;
 
    rest = reverse_list(second);
    second.next = head;
 
    return rest;
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