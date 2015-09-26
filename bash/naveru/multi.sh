#!/bin/bash

if [[ $0 == *address ]]; then
	echo "host $1"
	host $1
elif [[ $0 == *download ]]; then
	echo "wget $1"
	wget $1
else
	echo "use symbolick link" >&2
	exit 1
fi
