#!/usr/local/bin/python
import random
import time

def dada(second):
	for i in range(0,second):
		print second - i
		time.sleep(1)
	print "Tada!"

names = open("name.txt")
data=[]
for name in names:
	data.append(name)
	print name,

dada(4)

print "-----------------"
print "  winner "
print "-----------------"

random.shuffle(data)
print data[0]


