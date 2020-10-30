#!/bin/bash

if [ $# -ne 1 ]; then
	echo "usage: $0 num"
	exit
fi

num=$1

if (( $num % 2 == 0 )) ; then
	echo $num is even!
else
	echo $num is odd!
fi

