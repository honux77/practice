#!/bin/bash
((START = 1))
((END = 10))
for ((I = START; I <= END; I++)); do
	((SUM = SUM + I))
	echo "+$I: $SUM"
done
echo $SUM
