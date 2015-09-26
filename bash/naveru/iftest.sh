#!/bin/bash

error() {
	echo "$@" >&2
}

if [ $# -ne 1 ]; then
	error "Usage: $0 filename" 
	exit 1
fi
if [ -d $1 ]; then 
	echo "$1 is a directory"
elif [ -f $1 ]; then
	echo "$1 is a file"
elif [[ $1 == "NAVER" ]]; then
	echo "Welcome to NAVER"
else
	echo "What is $1?"
fi
