def next_smaller_dollar(bill):
    """Returns the next smaller bill in order."""
    if bill == 100:
        return 50
    if bill == 50:
        return 20
    if bill == 20:
        return 10
    elif bill == 10:
        return 5
    elif bill == 5:
        return 1

def count_dollars(total):
    def count_num_max(m,n):
        if m<0:
            return 0
        elif m<=1:
            return  1
        elif n==1:
            return  1
        else :
            return  count_num_max(m-n,n)+count_num_max(m,next_smaller_dollar(n))
    return  count_num_max(total,100)


def next_larger_dollar(bill):
    """Returns the next larger bill in order."""
    if bill == 1:
        return 5
    elif bill == 5:
        return 10
    elif bill == 10:
        return 20
    elif bill == 20:
        return 50
    elif bill == 50:
        return 100

def count_dollars_upward(total):
    def count_bigger(m,n):
        if m<0:
            return 0
        elif m<1:
            return 1
        elif m<n:
            return  0
        elif n==100:
            return count_bigger(m-n,n)
        else :
            return  count_bigger(m-(n),n)+count_bigger(m,next_larger_dollar(n))
    return  count_bigger(total,1)
def count(total):
    def helper(total, bill=1):
        if total == 0:
            return 1

        if total < 0 or bill is None:
            return 0

        # Count ways using the current bill denomination
        ways_using_current = helper(total - bill, bill)

        # Count ways using the next larger bill denomination
        ways_using_next = helper(total, next_larger_dollar(bill))

        return ways_using_current + ways_using_next

    return helper(total)
NUM__=123
print(count_dollars(NUM__))
print(count_dollars_upward(NUM__))
print(count(NUM__))
