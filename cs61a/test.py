from http.cookiejar import uppercase_escaped_char


class test:
    def __init__(self):
        self.a = 1
    def pr(self):
        print(self.v)
    v=0
test.v=3
m=test()
n=test()
print(m.v)
print(n.v)
m.pr()
n.pr()
m.v=2
print(m.v)
print(n.v)
m.pr()
n.pr()
class Eye:
    """An eye.

    >>> Eye().draw()
    '0'
    >>> print(Eye(False).draw(), Eye(True).draw())
    0 -
    """
    def __init__(self, closed=False):
        self.closed = closed

    def draw(self):
        if self.closed:
            return '-'
        else:
            return '0'

class Bear:
    """A bear.

    >>> Bear().print()
    ? 0o0?
    """
    def __init__(self):
        self.nose_and_mouth = 'o'

    def next_eye(self):
        return Eye()

    def print(self):
        left, right = self.next_eye(), self.next_eye()
        print('? ' + left.draw() + self.nose_and_mouth + right.draw() + '?')

class WinkingBear(Bear):
    """A bear whose left eye is different from its right eye.

    >>> WinkingBear().print()
    ? -o0?
    """
    def __init__(self):
        "*** YOUR CODE HERE ***"
        self.NO_=False

    def next_eye(self):
        "*** YOUR CODE HERE ***"
        self.NO_=not self.NO_
        return Eye(self.NO_)

MMM='a'
nnnn=MMM.upper()
print(nnnn)