#!/bin/bash
# launch ec2 instances
# Amazon linux ap-northeast-1 : ami-383c1956
aws ec2 run-instances --image-id ami-383c1956 --count 1 --instance-type t2.micro --key-name MyKeyPair \
--security-group-ids sg-xxxxxxxx --subnet-id subnet-xxxxxxxx
