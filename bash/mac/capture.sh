#!/bin/bash 

URL='http://public.codesquad.kr/honux/images/'

if [ $# -eq 1 ]
then 
	FILENAME=$1
else
	FILENAME=`date +"%Y%m%d%H%M"`
fi
	
screencapture -tpng -i ${PWD}/images/${FILENAME}.png

echo "![](${URL}${FILENAME}.png)" | pbcopy
