#!/bin/python3

import sys

arr = []
for arr_i in range(6):
   arr_t = [int(arr_temp) for arr_temp in input().strip().split(' ')]
   arr.append(arr_t)
 
def glass_sum(arr, i, j):
    sum = arr[i + 1][j + 1]
    for v in range(0,3):
        sum += arr[i][j + v]
        sum += arr[i + 2][j + v]
    return sum

arr_max = -100
for i in range(4):
    for j in range(4):
        sum = glass_sum(arr, i, j)
        arr_max = max(arr_max, sum)

print(arr_max)
