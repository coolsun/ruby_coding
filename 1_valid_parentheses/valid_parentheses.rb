
# https://leetcode.com/problems/valid-parentheses/
# Given a string containing just the characters '(', ')', '{', '}', '[' and ']', 
#determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
# Note that an empty string is also considered valid.

# @param {String} s
# @return {Boolean}
def is_valid(s)
    h = {')'=>'(', ']'=>'[', '}'=>'{'}
    st = []
    s.each_char {|c|
        st << c if c=='(' or c=='{' or c=='['
        return false if (c==')' or c=='}' or c==']') and st.pop != h[c]
    }
    st.length == 0
end


(str="{(())[]}";is_valid(str) == true)?puts("#{str} passed"):puts("#{str} failed")