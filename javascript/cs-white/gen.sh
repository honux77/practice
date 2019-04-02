#!/bin/bash

if [ $# -ne 1 ]; then 
	echo "usage: $0 filename"
	exit 1
fi

echo "Generate $1.html.."
sed "s/____/$1/g" template.html > $1.html 

if [ ! -f $1.js ]; then 
	echo "Generate $1.js.."
	cp template.js $1.js
else
	echo "$1.js exist!"
fi


echo "Done!"

