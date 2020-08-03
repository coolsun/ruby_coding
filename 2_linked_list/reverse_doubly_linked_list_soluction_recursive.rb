# Definition for singly-linked list.
class DListNode
    attr_accessor :val, :pre, :next
    def initialize(val = 0, _pre = nil, _next = nil)
        @val = val
        @pre = _pre
        @next = _next
    end
end
# @param {ListNode} head
# @return {ListNode}
require 'pp'
def reverse_list(head)
    if (head.nil? || head.next.nil?)
        head.pre = nil;
        return head;
    end
 
    #get second node    
    second = head.next;

    rest = reverse_list(second);
    second.next = head;
    head.pre = second;

    #set first's next to be null
    head.next = nil;
    
    return rest;
end
def print_ll(head)
    output = []
    while !head.nil?
        output << head.val
        t = head
        head = head.next
    end
    while !t.nil?
        output << t.val
        t = t.pre
    end
    pp output
end

def main
    list = [1,2,3,4,5]
    v = p = n = nil
    list.reverse.each_with_index { |e, index|
        v = DListNode.new(e, p, n)      # pre is always nil
        n = v
    }
    # v is the head node
    n = v
    while n.next
        n.next.pre = n
        n = n.next
    end
    puts "expect: [1, 2, 3, 4, 5, 5, 4, 3, 2, 1]"
    print_ll v 
    arr=reverse_list(v)
    puts "expect: [5, 4, 3, 2, 1, 1, 2, 3, 4, 5]"
    print_ll arr # 
end

main