#!/bin/sh
RESULT=$(ls)
# LIST=$(echo $RESULT | tr -s " ")
#for i in ${LIST[@]}; do
for i in $RESULT; do
	echo $i
done
