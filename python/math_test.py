import math
def fact(x):
	if x == 1:
		return 1
	else:
		return x * fact(x-1);

def mysin(x):
	return x - math.pow(x,3)/fact(3) + pow(x,5)/fact(5) - pow(x,7)/fact(7) \
			+ math.pow(x,9)/fact(9)

print mysin(3.14/2), math.sin(3.14/2)
print mysin(3.14/4), math.sin(3.14/4), 1/math.sqrt(2)
