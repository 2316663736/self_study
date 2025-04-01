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