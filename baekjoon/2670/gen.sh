#!/bin/zsh
echo 10000 > input2.txt
for i in `seq 1 10000`:
do
	echo $(($RANDOM % 20 / 10.0 - 1.0)) >> input2.txt
done
