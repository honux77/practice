#!/bin/bash
sleep $1
s="$1초가 지났습니다."
echo $s; say $s
./alarm.sh $1

