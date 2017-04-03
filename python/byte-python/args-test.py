def argTest(*args): 
    i = 0
    for arg in args:
        print("arg[%s] is %s" % (i, arg))
        i += 1

def argTest2(**dict):
    for index in dict:
        print("arg[%s] is %s" % (index, dict[index]));

argTest(1, 10, 200, 'hello', 500)
argTest2(hello = 1, world = 2, honux = 'man');
