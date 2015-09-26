#!/bin/bash

IP="168.126.63.1"

for i in $IP; do
	echo "word: $i"
done

IFS="."

for i in $IP; do
	echo "word: $i"
done
