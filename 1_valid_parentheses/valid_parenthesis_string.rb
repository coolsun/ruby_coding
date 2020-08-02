# @param {String} s
# @return {Boolean}
def check_valid_string(s)
    lo = 0
    hi = 0
    s.each_char { |c|
        (lo += 1;hi += 1) if c=='('
        (lo -= 1;hi -= 1) if c==')'
        (lo -= 1;hi += 1) if c=='*'
        return false if hi < 0
        lo = [lo, 0].max
    }
    lo == 0
end

str="()*)(";check_valid_string(str)?puts("#{str} passed"):puts("#{str} failed")
str="(*)";check_valid_string(str)?puts("#{str} passed"):puts("#{str} failed")