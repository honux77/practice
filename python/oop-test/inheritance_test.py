class A:
    def __init__(self, y):
        print("Constructor A called")
        self.x = 10 
        self.y = y

class B(A):
    def __init__(self, y):
        # self.y = y
        super(B, self).__init__(y)
        print("Constructor B called");

    def foo(self):
        print("hello", self.x, self.y);

b = B(20)
b.foo()
