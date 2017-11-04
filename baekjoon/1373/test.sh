#!/bin/bash
src=$1
input=$(cat input.txt)
for i in $input
do
	echo input: $i
	echo $i | node $1
done

